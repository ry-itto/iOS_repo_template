#!/bin/bash

set -eu

echo "Generate xcodeproj file by XcodeGen...."

mint run xcodegen generate --use-cache

if [ -f "Cartfile" ]; then
  carthage bootstrap --platform iOS --no-use-binaries --cache-builds
else
  "carthage not found"
fi

if [ -f "Podfile" ]; then
  bundle exec pod install
else
  "cocoapods not found"
fi
