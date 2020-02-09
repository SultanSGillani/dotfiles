# Build docs in watch mode.
# requires sphinx-autobuild (pip install sphinx-autobuild)
sphinxwatch() {
    sphinx-autobuild --open-browser docs docs/_build
}
