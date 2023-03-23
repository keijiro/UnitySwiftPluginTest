// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftPlugin",
    products: [
        .library(
            name: "SwiftPlugin",
            type: .dynamic,
            targets: ["SwiftPlugin"]),
    ],
    targets: [
        .target(
            name: "SwiftPlugin",
            dependencies: [])
    ]
)
