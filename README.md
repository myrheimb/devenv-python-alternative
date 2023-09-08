# devenv-python
A simple template to get started with a new Python project using [devenv](https://devenv.sh/).

## Requirements
[Nix](https://nixos.org/download#download-nix)
[devenv](https://devenv.sh/getting-started)
[direnv](https://direnv.net/docs/installation.html)

## Usage
### Setting up
Clone and `cd` into the repo, write `direnv allow`, hit enter, and watch the magic happen!
Devenv will then automatically take care of setting up everything as [Nix derivations](https://zero-to-nix.com/concepts/derivations), create a Python virtual environment, activate it, and install the packages specified in the `requirements.txt` file.

This project will be completely isolated and not make any global changes, even if you just want to try out a new package with `pip install`.

### Update python dependencies
To update or add new Python dependencies, simply add them to the `requirements.in` file, either with an unspecified version, e.g. `black`, or with a specified version, e.g. `black==23.7.0`.
You can then run `make lock` to have pip-compile sort out the dependencies in `requirements.txt`.
Finally, run `make sync` to have pip-sync install or uninstall any new or obsolete packages.

> Note that `pip sync` will also remove any manually installed packages using `pip install` unless they're also specified as a requirement.
Nice and clean, right?
