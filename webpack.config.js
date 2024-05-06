// Webpack configuration for plone-sphinx-theme
const { resolve } = require("path");
const OptimizeCssAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const dedent = require("dedent");

// Paths for various assets (sources and destinations)
const staticPath = resolve(
  __dirname,
  // Configure for your theme
  "src/plone_sphinx_theme/theme/plone-sphinx-theme/static",
);

module.exports = {
  mode: "production",
  devtool: "source-map",
  entry: {
    // Configure for your theme
    "plone-sphinx-theme": ["./src/plone_sphinx_theme/assets/scripts/index.js"],
  },
  output: {
    filename: "scripts/[name].js",
    path: staticPath,
  },
  optimization: {
    minimize: true,
    minimizer: [
      new TerserPlugin({ sourceMap: true }),
      new OptimizeCssAssetsPlugin({}),
    ],
  },
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          {
            loader: "file-loader", // using the string as content, emits a file into the output directory.
            options: {
              // Configure for your theme
              name: "styles/plone-sphinx-theme.css", // the output file name
            },
          },
          {
            loader: "extract-loader", // extracts the css from the source js file into a string
          },
          {
            // Use the css-loader with url()-inlining turned off.
            loader: "css-loader?-url", // loads the css into the main js
          },
          {
            loader: "sass-loader", // turns scss into css
          },
        ],
      },
    ],
  },
};
