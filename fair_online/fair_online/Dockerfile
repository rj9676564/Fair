FROM ghcr.io/cirruslabs/flutter:3.41.7 AS build

WORKDIR /app

COPY pubspec.* ./
RUN flutter pub get

COPY . .
RUN flutter config --enable-web && flutter build web

FROM nginx:1.27-alpine

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY docker/40-generate-config.sh /docker-entrypoint.d/40-generate-config.sh
COPY --from=build /app/build/web /usr/share/nginx/html

RUN chmod +x /docker-entrypoint.d/40-generate-config.sh

EXPOSE 80
