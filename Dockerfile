FROM python:3.8-alpine


LABEL name="pycodestyle-github-action"
LABEL version="1.0.0"
LABEL repository="http://github.com/konciergeMD/pycodestyle-github-action"
LABEL homepage="http://github.com/konciergeMD/pycodestyle-github-action"

LABEL maintainer="Toga <toga@accolade.com>"
LABEL com.github.actions.name="pycodestyle-github-action"
LABEL com.github.actions.description="Run Pycodestyle Check on a GitHub pull request"
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="blue"

RUN apk add jq curl

RUN pip install pycodestyle
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
