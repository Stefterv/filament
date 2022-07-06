// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "filament",
    products: [
        .library(
            name: "filament",
            targets: ["filament"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(name: "filament", url: "https://github.com/Stefterv/filament/releases/download/v1.24.0/filament.zip", checksum: "778f8fdd415784c47174edea88f3679e81e437b78663024c30c6a62879488cc0")
    ],
    cxxLanguageStandard: .cxx20
)
