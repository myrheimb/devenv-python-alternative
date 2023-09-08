# devenv.nix
{ pkgs, ... }:

{
  name = "Python project template";

  # https://devenv.sh/packages/
  packages = [
    pkgs.python311
    pkgs.python311Packages.pip-tools
    pkgs.poetry
  ];

  # Set any environment variables here.
  # https://devenv.sh/reference/options/#env
  # env.TEST_ENV_VAR_1="foo";
  # env.TEST_ENV_VAR_2="bar";

  # Secrets can be set in a .env file. Change to true if needed.
  # https://devenv.sh/reference/options/#dotenvenable
  dotenv.enable = false;

  # Create a Python virtual environment if it doesn't exist, activate it, and install or
  # uninstall Python packages according to requirements.txt.
  # https://devenv.sh/reference/options/#entershell
  enterShell = ''
    if [[ ! -d  .venv ]]
    then
      python -m venv .venv
      source .venv/bin/activate
      pip install --upgrade pip wheel setuptools
    fi
    source .venv/bin/activate
    make sync
  '';

  # See full reference at https://devenv.sh/reference/options/
}
