# LaTeX Template for GitHub CI

Template for building a LaTeX document via GitHub Actions.
Creates and maintains a "latest" pre-release, which is automatically updated to the latest commit.

The latest PDF is available [here][pdf].

The makefile automatically generates and updates revision information from git (if built in-tree), which can be found in `build/version.tex` and inspected in the final PDF via `exiftool -a -G1 build/main.pdf`.
This should output something like
```
[PDF] Revision : e973819b69824d701541cd502fd6b249d32f41fa*
```

[pdf]: https://github.com/qzed/latex-ci-template/releases/download/latest/main.pdf
