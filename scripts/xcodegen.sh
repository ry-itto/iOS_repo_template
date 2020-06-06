#!/bin/bash

set -eu

echo "Generate xcodeproj file by XcodeGen...."
mint run xcodegen generate --use-cache
carthage bootstrap --platform iOS --no-use-binaries --cache-builds
bundle exec pod install
