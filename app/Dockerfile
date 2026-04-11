# Stage 1: Build Flutter Web
FROM ghcr.io/cirruslabs/flutter:3.24.5 AS build-env

WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web --release

# Stage 2: Serve with NGINX
FROM nginx:alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
