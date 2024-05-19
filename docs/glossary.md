---
myst:
  html_meta:
    "description": "Terms and definitions used throughout the Plone Sphinx Theme documentation."
    "property=og:description": "Terms and definitions used throughout the Plone Sphinx Theme documentation."
    "property=og:title": "Glossary"
    "keywords": "Plone, documentation, glossary, term, definition"
---

(glossary-label)=

# Glossary

```{glossary}
:sorted: true

Sphinx
    [Sphinx](https://www.sphinx-doc.org/en/master/) is a tool that makes it easy to create intelligent and beautiful documentation.
    It was originally created for Python documentation, and it has excellent facilities for the documentation of software projects in a range of languages.
    Sphinx uses {term}`reStructuredText` as its markup language, and many of its strengths come from the power and straightforwardness of reStructuredText and its parsing and translating suite, {term}`Docutils`.

Docutils
    [Docutils](https://docutils.sourceforge.io/) is an open-source text processing system for processing plain text documentation into useful formats, such as HTML, LaTeX, man-pages, OpenDocument, or XML.
    It includes {term}`reStructuredText`, the easy to read, easy to use, what-you-see-is-what-you-get plain text markup language.

reStructuredText
    [reStructuredText (rST)](https://docutils.sourceforge.io/rst.html) is an easy-to-read, what-you-see-is-what-you-get plain text markup syntax and parser system.
    The Plone 6 Documentation was written in reStructuredText originally, then converted to {term}`MyST` in 2022.

MyST
    [Markedly Structured Text (MyST)](https://myst-parser.readthedocs.io/en/latest/) is a rich and extensible flavor of Markdown, for authoring Plone Documentation.

Markdown
    [Markdown](https://daringfireball.net/projects/markdown/) is a text-to-HTML conversion tool for web writers.

fence
    A method to extend basic MyST syntax.
    You can define a directive with backticks (`` ` ``) followed by a reStructuredText directive in curly brackets (`{}`), and a matching number of closing backticks.
    You can also nest fences by increasing the number of backticks.

    `````md
    ````{warning}
    There be dragons!
    ```{important}
    Dragons have feelings, too!
    ```
    ````
    `````

    ````{warning}
    There be dragons!
    ```{important}
    Dragons have feelings, too!
    ```
    ````

Open Graph
    The [Open Graph protocol](https://ogp.me/) enables any web page to become a rich object in a social graph.
    For instance, this is used on Facebook to allow any web page to have the same functionality as any other object on Facebook.

```
