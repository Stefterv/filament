// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let targets = [
    "filament":"424ad0f0c6469046e28fa7667aa504645fab84a4636bf9876755f0be4181c016",
    "gltfio": "d015e741db43d74ec8111f7efcdac8f554d897eb7839fd7462f52d3c6f5fb79b",
    "backend": "e292e31f25d6e5b97b4d7951dcd317cb907d06e086cdab272d066e6c70d4d372",
    "utils": "33f983818a8705a9ff310c280fdca32dfb23e6fa1470904b6e03abe5796811d0"
]

let package = Package(
    name: "filament",
    products: [
        .library(
            name: "filament",
            targets: ["filament"]),
    ],
    dependencies: [
    ],
    targets: targets.map({ .binaryTarget(name: $0.key, url: "https://github.com/Stefterv/filament/releases/download/v1.24.0/\($0.key).xcframework.zip", checksum: $0.value) }),
    cxxLanguageStandard: .cxx20
)
