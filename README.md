# github-action-pycodestyle
A Github Action that runs a [pycodestyle](https://pycodestyle.pycqa.org/en/latest/intro.html) check on a pull request and leaves a comment on your pull request.

:bulb: Flake8 is more capable than Pycodestyle, you should probably use https://github.com/konciergeMD/github-action-flake8

## Example

#### Create `.github/workflows/pycodestyle.yml`:
```
on: [pull_request]
name: Python Pycodestyle Check
jobs:
  pycodestyle:
    name: pycodestyle
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: pycodestyle
      uses: konciergeMD/github-action-pycodestyle@main
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        PYCODESTYLE_OPTS: "--config=./.github/workflows/pycodestyle_config"  # additional pycodestyle options
        #PYCODESTYLE_CODE_DIR: "."  # what directory to check, defaults to "."
        #PRECOMMAND_MESSAGE: You have style errors. See them below.
```

#### Create `./.github/workflows/pycodestyle_config`

Example:
```
[pycodestyle]
count = False
ignore = W503, E501
statistics = True
```
Please find additional information in the official [documentation](https://pycodestyle.pycqa.org/en/latest/intro.html#configuration)

#### Additional options
* `PRECOMMAND_MESSAGE` - if you set it, it will print before
the code errors. For example, this is helpful if you want to print a message to refer the user
to any tools you have for managing style errors.
* `PYCODESTYLE_OPTS` - in case you don't want to use the `pycodestyle` configuration file, update this variable and set additional `pycodestyle` options, like `--ignore=E501,W303`, etc.
* `PYCODESTYLE_CODE_DIR` - what directory to check, defaults to the root of the repository `.`
