# Makefile for Sphinx documentation
.DEFAULT_GOAL   = help
SHELL           = bash

# You can set these variables from the command line.
SPHINXOPTS      ?=
PAPER           ?=

# Internal variables.
SPHINXBUILD     = "$(realpath .venv/bin/sphinx-build)"
SPHINXAUTOBUILD = "$(realpath .venv/bin/sphinx-autobuild)"
DOCS_DIR        = ./docs/
BUILDDIR        = ../_build
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
VALEFILES       := $(shell find $(DOCS_DIR) -type f -name "*.md" -print)
VALEOPTS        ?=

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help:  # This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# environment management
.venv/bin/python:  ## Create Python virtual environment and install package requirements
	python3 -m venv .venv
	.venv/bin/pip install --upgrade pip setuptools uv wheel
	.venv/bin/uv pip install -r requirements.txt

.PHONY: docs
docs: .venv/bin/python  ## Install documentation requirements into Python virtual environment
	.venv/bin/uv pip install -r requirements-docs.txt -e .

.PHONY: dev
dev: docs  ## Install development requirements into Python virtual environment
	.venv/bin/uv pip install -r requirements-dev.txt -e .

.PHONY: update-deps
update-deps:  ## Update
	.venv/bin/uv pip install --upgrade pip setuptools uv wheel
	.venv/bin/uv pip compile --upgrade pyproject.toml -o requirements.txt
	.venv/bin/uv pip compile --upgrade pyproject.toml \
		--extra docs -o requirements-docs.txt
	.venv/bin/uv pip compile --upgrade pyproject.toml \
		--extra docs --extra dev -o requirements-dev.txt

.PHONY: init
init: clean clean-python docs  ## Clean docs build directory and initialize Python virtual environment
	.venv/bin/uv pip install -r requirements.txt -r requirements-docs.txt -r requirements-dev.txt -e .
	.venv/bin/uv pip check

.PHONY: clean
clean:  ## Clean docs build directory
	cd $(DOCS_DIR) && rm -rf $(BUILDDIR)/

.PHONY: clean-python
clean-python: clean
	rm -rf .venv/
# /environment management

# documentation builders
.PHONY: html
html: .venv/bin/python  ## Build html
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

.PHONY: livehtml
livehtml: docs  ## Rebuild Sphinx documentation on changes, with live-reload in the browser
	cd "$(DOCS_DIR)" && ${SPHINXAUTOBUILD} \
		--ignore "*.swp" \
		--port 8050 \
		-b html . "$(BUILDDIR)/html" $(SPHINXOPTS) $(O)

.PHONY: dirhtml
dirhtml: docs
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

.PHONY: singlehtml
singlehtml: docs
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

.PHONY: text
text: docs
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
	@echo
	@echo "Build finished. The text files are in $(BUILDDIR)/text."

.PHONY: changes
changes: docs
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
	@echo
	@echo "The overview file is in $(BUILDDIR)/changes."
# /documentation builders

# test
.PHONY: linkcheck
linkcheck: docs  ## Run linkcheck
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
		"or in $(BUILDDIR)/linkcheck/ ."

.PHONY: linkcheckbroken
linkcheckbroken: docs  ## Run linkcheck and show only broken links
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck | GREP_COLORS='0;31' grep -wi "broken\|redirect" --color=always | GREP_COLORS='0;31' grep -vi "https://github.com/plone/volto/issues/" --color=always && if test $$? = 0; then exit 1; fi || test $$? = 1
	@echo
	@echo "Link check complete; look for any errors in the above output " \
		"or in $(BUILDDIR)/linkcheck/ ."

.PHONY: vale
vale: docs dev  ## Run Vale style, grammar, and spell checks
	.venv/bin/vale sync
	.venv/bin/vale --no-wrap $(VALEOPTS) $(VALEFILES)
	@echo
	@echo "Vale is finished; look for any errors in the above output."

.PHONY: doctest
doctest: docs  ## Test snippets in the documentation
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

.PHONY: test
test: clean vale linkcheckbroken doctest  ## Clean docs build, then run vale and linkcheckbroken
# /test

# development
.PHONY: html_meta
html_meta: docs  ## Add meta data headers to all Markdown pages
	python ./docs/addMetaData.py

.PHONY: kitchen-sink-update
kitchen-sink-update:  ## Copy Kitchen Sink documentation files to Plone Sphinx Theme
	.venv/bin/python scripts/kitchen_sink_update.py

.PHONY: sbt-styles-update
sbt-styles-update:  ## Copy Sphinx Book Theme styles to Plone Sphinx Theme
	.venv/bin/python scripts/sbt_styles_update.py

.PHONY: serve
serve:  ## Compile static assets, build and serve the docs, and reload the browser on changes
	.venv/bin/stb serve docs/

.PHONY: compile
compile:  ## Compile static assets
	.venv/bin/stb compile

.PHONY: rtd-pr-preview
rtd-pr-preview: docs  ## Build pull request preview on Read the Docs
	cd $(DOCS_DIR) && $(SPHINXBUILD) -b html $(ALLSPHINXOPTS) ${READTHEDOCS_OUTPUT}/html/

.PHONY: release
release: dev compile  ## Release with zest.releaser
	.venv/bin/fullrelease

.PHONY: all
all: clean vale linkcheck html  ## Clean docs build, then run vale and linkcheck, and build html
# /development

.PHONY: deploy
deploy: clean html
