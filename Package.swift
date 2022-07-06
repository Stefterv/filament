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
        .binaryTarget(name: "filament", url: "https://github.com/Stefterv/filament/releases/download/v1.24.0/filament.xcframework.zip", checksum: "424ad0f0c6469046e28fa7667aa504645fab84a4636bf9876755f0be4181c016")
    ],
    cxxLanguageStandard: .cxx20
)
