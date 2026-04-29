FROM dart:stable

ARG FLUTTER_VERSION=3.41.7

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        libglu1-mesa \
        unzip \
        xz-utils \
        zip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL \
      "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
      -o /tmp/flutter.tar.xz \
    && mkdir -p /opt \
    && tar -xf /tmp/flutter.tar.xz -C /opt \
    && mv /opt/flutter "/opt/flutter-${FLUTTER_VERSION}" \
    && ln -s "/opt/flutter-${FLUTTER_VERSION}" /opt/flutter \
    && rm /tmp/flutter.tar.xz

COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN mkdir -p .fvm \
    && ln -sf /opt/flutter .fvm/flutter_sdk \
    && flutter config --enable-web \
    && flutter precache --web --no-android --no-ios --no-linux --no-windows --no-macos --no-fuchsia

ENV FAIR_ONLINE_RESOURCE_BASE_URL=/resource

EXPOSE 8082 8001 8002

CMD ["dart", "run", "bin/server.dart", "--version", "3.41.7", "--port", "8082"]
