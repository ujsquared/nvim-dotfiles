---
myst:
  html_meta:
    "description": "Develop your own theme based upon Plone Sphinx Theme"
    "property=og:description": "Develop your own theme based upon Plone Sphinx Theme"
    "property=og:title": "Develop your own theme based upon Plone Sphinx Theme"
    "keywords": "Plone, Sphinx, Theme, Develop"
---

# Develop your own theme

```{todo}
This document is a work in progress.
Currently it only lists the files that need to be customized for your own theme, and not how to customize them.
This may be replaced by a cookiecutter, `plone/cookie-documentation`.
```

This page describes how to develop your own theme based upon Plone Sphinx Theme.
This is an advanced topic for experienced Sphinx theme developers only.


## Install Plone Sphinx Theme

See {doc}`contribute`.


## Configure

You need to configure files that contain the commented string `Configure for your theme`.
You can use your editor's search feature to locate where to modify the following files, located from the project root.

-   {file}`__init__.py`
-   {file}`theme.conf`
-   {file}`webpack.config.js`
-   {file}`docs/conf.py`

```{seealso}
{doc}`../reference/file-system-structure`
```
