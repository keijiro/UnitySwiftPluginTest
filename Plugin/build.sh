#!/bin/sh -x

swiftc plugin.swift -emit-module -emit-library -target arm64-apple-macosx13.0 -o arm64.dylib
swiftc plugin.swift -emit-module -emit-library -target x86_64-apple-macosx13.0 -o x86_64.dylib

lipo -create -output SwiftPlugin.bundle arm64.dylib x86_64.dylib

mv SwiftPlugin.bundle ../Assets
rm *.json *.dylib *.swiftdoc *.swiftmodule *.swiftsourceinfo
