#!/bin/bash

set -eu

echo "Generate xcodeproj file by XcodeGen...."
mint run xcodegen generate --use-cache

if [ $(which carthage) ]; then
  carthage bootstrap --platform iOS --no-use-binaries --cache-builds
else
  "carthage not found"
fi

if [ $(which pod) ]; then
  bundle exec pod install
else
  "cocoapods not found"
fi
