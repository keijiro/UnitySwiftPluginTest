#!/bin/sh -e -x

# Build directory removal
rm -rf .build
rm -rf .xcodebuild

# macOS binary build using SPM
swift build -c release --arch arm64 --arch x86_64

# iOS binary build using Xcode
xcodebuild build \
 -scheme SwiftPlugin \
 -configuration Release \
 -sdk iphoneos \
 -destination generic/platform=iOS \
 ENABLE_BITCODE=YES \
 CONFIGURATION_BUILD_DIR=.xcodebuild

# Binary copy to the destination
cp -f .build/apple/Products/Release/libSwiftPlugin.dylib ../Assets
cp -rf .xcodebuild/PackageFrameworks/SwiftPlugin.framework ../Assets
