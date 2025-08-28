#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Clone Flutter SDK.
git clone https://github.com/flutter/flutter.git --depth 1 -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Precache the Flutter SDK for web.
flutter precache --web

# Get Flutter dependencies.
flutter pub get

# Build the web app with the API key from Vercel's environment variables.
flutter build web --release --dart-define=EXCHANGERATE_API_KEY=$EXCHANGERATE_API_KEY