# pycodestyle-github-action
A Github Action that runs a [pycodestyle](https://pycodestyle.pycqa.org/en/latest/intro.html) check on a pull request and leaves a comment on your pull request.

## Example

Create `.github/workflows/pycodestyle.yml`:
```
on: [pull_request]
name: Python Style Check
jobs:
  pycodestyle:
    name: pycodestyle
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: pycodestyle
      uses: konciergeMD/pycodestyle-github-action@main
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        #PRECOMMAND_MESSAGE: You have style errors. See them below.
        #PYCODESTYLE_CONFIG: ./.github/workflows/pycodestyle_config  # pycodestyle config file
        #PYCODESTYLE_OPTS: "--ignore=E501"  # additional pycodestyle options
```
* `PRECOMMAND_MESSAGE` - if you set it, it will print before
the code errors. For example, this is helpful if you want to print a message to refer the user
to any tools you have for managing style errors.
* `PYCODESTYLE_CONFIG` - path to the [pycodestyle](https://pycodestyle.pycqa.org/en/latest/intro.html#configuration) compatible configuration file.
* `PYCODESTYLE_OPTS` - in case you don't want to use the `pycodestyle` configuration file, use this variable to set additional `pycodestyle` options, like `--verbose`, etc.

# Acknowledgement
Inspired by https://github.com/ankitvgupta/pycodestyle-action
