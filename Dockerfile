FROM node:21-alpine AS final
# source .env && docker run --rm --name srcv -e GITHUB_TOKEN -v "${PWD}":/app  -v ~/.ssh:/root/.ssh/ semantic-release-cv --debug -d

WORKDIR /app

RUN apk add --update --no-cache git openssh

RUN npm install --no-save -g \
    semantic-release@22.0.7 \
    @semantic-release/exec@6.0.3 \
    @semantic-release/changelog@6.0.3 \
    conventional-changelog-conventionalcommits@7.0.1

COPY .releaserc /app/.releaserc
RUN git config --global --add safe.directory /app

ENTRYPOINT ["semantic-release", "--ci", "false", "--debug"]
