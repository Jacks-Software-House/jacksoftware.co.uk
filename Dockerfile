FROM node:23-alpine

ARG version="dev"
ARG revision="dev"

LABEL org.opencontainers.image.authors="Jack's Software House"
LABEL org.opencontainers.image.description="Portfolio and advertising website for Jack's Software House"
LABEL org.opencontainers.image.documentation="https://github.com/Jacks-Software-House/jacksoftware.co.uk"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.revision=$revision
LABEL org.opencontainers.image.source="https://github.com/Jacks-Software-House/jacksoftware.co.uk"
LABEL org.opencontainers.image.title="jacksoftware.co.uk"
LABEL org.opencontainers.image.url="https://jacksoftware.co.uk"
LABEL org.opencontainers.image.version=$version

ENV NODE_ENV="production"

# Only copy over the files we actually need
COPY . /app
WORKDIR /app

RUN npm install --production=false
RUN npm run build

EXPOSE 4173

ENTRYPOINT ["npm", "run", "preview"]