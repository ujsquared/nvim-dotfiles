---
myst:
  html_meta:
    "description": "Contribute to Plone Sphinx Theme"
    "property=og:description": "Contribute to Plone Sphinx Theme"
    "property=og:title": "Contribute to Plone Sphinx Theme"
    "keywords": "Plone, Sphinx, Theme, plone-sphinx-theme, contribute, kitchen, sink, demonstration, demo, template, style, JavaScript"
---

# Contribute to Plone Sphinx Theme

This document describes how to install Plone Sphinx Theme for contributing code to this project, and what you can modify.
It also covers the essential commands for building and previewing

## Prerequisites

-   A supported version of Python, as specified on this documentation's {doc}`home page <../index>`
-   GNU Make


## Install Plone Sphinx Theme

Begin by cloning the Plone Sphinx Theme repository from GitHub.

```shell
git clone https://github.com/plone/plone-sphinx-theme.git
```

Change your working directory to the cloned repository.

```shell
cd plone-sphinx-theme
```

Then create a Python virtual environment, install requirements for development, and install the package in development mode with a single command.

```shell
make dev
```


## Edit documentation

You can edit documentation located in the directory {file}`docs`, except for the files contained in `docs/reference/kitchen-sink`.

```{danger}
Do not directly edit files in the directory {file}`docs/reference/kitchen-sink`.
These files are copied from the source of the demonstration website [Sphinx Themes Gallery](https://sphinx-themes.org/) whenever there is an update to it.
See {ref}`update-kitchen-sink-demonstration` for details.
```


(update-kitchen-sink-demonstration)=

### Update Kitchen Sink demonstration

From time to time, the demonstration files for [Sphinx Themes Gallery](https://sphinx-themes.org/) will be updated.
Plone Sphinx Theme uses these files as a demonstration for its styles.
To copy these updated files to Plone Sphinx Theme, run the following command.

```shell
make kitchen-sink-update
```


## Edit the theme

You can edit the Plone Sphinx Theme's layout, content, styles, and JavaScripts.
This section describes how you can change this theme.

```{seealso}
{doc}`../reference/file-system-structure`
```


### Add or edit a template

Templates are pages of Jinja2 code into which components can be inserted.
Plone Sphinx Theme uses a template, {file}`404.html` to display an HTTP "404 Not Found" response page to visitors when they request a page that does not exist.
In Plone Sphinx Theme, templates are located in the directory {file}`src/plone_sphinx_theme/theme/plone-sphinx-theme`.


### Add or edit a component

Components are snippets of Jinja2 code that can be inserted in templates.
In Plone Sphinx Theme, components are located in the directory {file}`src/plone_sphinx_theme/theme/plone-sphinx-theme/components`.


### Add or edit styles

Plone Sphinx Theme uses Sass and webpack to compile a CSS file for its theme.
You can edit these files located in the directory {file}`src/plone_sphinx_theme/assets/styles`, except for those in {file}`src/plone_sphinx_theme/assets/styles/sphinx-book-theme`.

```{danger}
Do not directly edit files in the directory {file}`src/plone_sphinx_theme/assets/styles/sphinx-book-theme`.
These files are copied from the parent theme whenever there is an update to it.
See {ref}`update-parent-theme-styles` for details.
```

(update-parent-theme-styles)=

#### Update parent theme styles

From time to time, the parent theme, Sphinx Book Theme, will update its Sass files.
Plone Sphinx Theme uses these files as a base for its styles.
To copy these updated files to Plone Sphinx Theme, run the following command.

```shell
make sbt-styles-update
```


### Add or edit JavaScripts

Plone Sphinx Theme uses webpack to compile a JavaScript file for its theme.
You can edit these files located in the directory {file}`src/plone_sphinx_theme/assets/scripts`.
