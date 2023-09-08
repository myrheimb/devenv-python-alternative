# Makefile used to run common commands.

.PHONY: help
# Automatically parse recipes and their comments to display available commands.
# Ref: https://stackoverflow.com/a/35730928
# List the available commands.
help:
	@awk '/^#/{c=substr($$0,3);next}c&&/^[[:alpha:]][[:alnum:]_-]+:/{print substr($$1,1,index($$1,":")),c}1{c=0}' $(MAKEFILE_LIST) | column -s: -t

.PHONY: lock
# Lock version pins for Python dependencies.
lock:
	@poetry lock && poetry export --format=requirements.txt --output=requirements.txt

.PHONY: sync
# Install pinned Python packages and uninstall any other packages.
sync:
	@pip-sync --python-executable .venv/bin/python requirements.txt

.PHONY: clean
# Remove the .devenv, devenv_python.egg-info, .direnv, and .venv folders.
clean:
	@rm -rf .devenv devenv_python.egg-info .direnv .venv
	@direnv reload

.PHONY: gc
# Removes old devenv generations.
gc:
	@devenv gc
