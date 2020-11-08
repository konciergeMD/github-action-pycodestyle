# pycodestyle-github-action
A Github Action that runs pycodestyle check on a pull request and leaves a comment on your pull request.

## Example
Add the following to `.github/workflows/pycodestyle.yml`.

Note that the PRECOMMAND_MESSAGE variable is optional. If you set it, it will print before
the code errors. For example, this is helpful if you want to print a message to refer the user
to any tools you have for managing style errors.

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
      uses: konciergeMD/pycodestyle-github-action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        PRECOMMAND_MESSAGE: You have style errors. See them below.
```

# Acknowledgement
Inspired by https://github.com/ankitvgupta/pycodestyle-action
