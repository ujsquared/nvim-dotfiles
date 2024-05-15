---
myst:
  html_meta:
    "description": "Plone Sphinx Theme usage guide"
    "property=og:description": "Plone Sphinx Theme usage guide"
    "property=og:title": "Plone Sphinx Theme usage guide"
    "keywords": "Plone, Sphinx, Theme, plone-sphinx-theme, usage, guide"
---

# Usage

This guide describes how to use Plone Sphinx Theme for documentation of your project.
By following this guide, you can consistently reproduce results in any environment, including to Read the Docs.

```{seealso}
To contribute code to Plone Sphinx Theme, first follow the {doc}`contributing-policies`, then {doc}`contribute`.
To develop your own theme based upon Plone Sphinx Theme, see {doc}`develop`.
```


## Prerequisites

-  Install a supported version of Python, as specified on this documentation's {doc}`home page <../index>`.
-   Create a Python virtual environment for your project, and optionally activate it.
    The following commands assume you have activated your virtual environment.


## Configuration

1.  Add Plone Sphinx Theme to your project's documentation requirements.

    `````{tab-set}
    
    ````{tab-item} pyproject.toml
    :sync: key1
    ```toml
    [project.optional-dependencies]
    
    doc = [
      "plone-sphinx-theme",
    ]
    ```
    ````
    
    ````{tab-item} requirements-doc.txt
    :sync: key2
    ```text
    plone-sphinx-theme
    ```
    ````
    
    `````

1.  Install Plone Sphinx Theme according to Step 3.

    `````{tab-set}
    
    ````{tab-item} pyproject.toml
    :sync: key1
    ```shell
    pip install my_project[doc]
    ```
    ````
    
    ````{tab-item} requirements-doc.txt
    :sync: key2
    ```shell
    pip install -r requirements-doc.txt
    ```
    ````
    
    `````

1.  Configure your {file}`conf.py`.

    ```python
    html_theme = "plone_sphinx_theme"
    ```

Now you can build your documentation using this theme.
