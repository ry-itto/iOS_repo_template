#!/bin/bash

set -eu

echo "  + Generate xcodeproject by XcodeGen."
xcodegen generate --use-cache
carthage bootstrap --platform iOS --no-use-binaries --cache-builds
bundle exec pod install
