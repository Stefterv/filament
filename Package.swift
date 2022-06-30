// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Filament",
    products: [
        .library(
            name: "Filament",
            targets: ["Filament","FilamentBindings", "filament"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "backend",
            path: "out/ios-release/filament/lib/universal/backend.xcframework"
        ),
        .binaryTarget(
            name: "basis_transcoder",
            path: "out/ios-release/filament/lib/universal/basis_transcoder.xcframework"
        ),
        .binaryTarget(
            name: "camutils",
            path: "out/ios-release/filament/lib/universal/camutils.xcframework"
        ),
        .binaryTarget(
            name: "civetweb",
            path: "out/ios-release/filament/lib/universal/civetweb.xcframework"
        ),
        .binaryTarget(
            name: "dracodec",
            path: "out/ios-release/filament/lib/universal/dracodec.xcframework"
        ),
        .binaryTarget(
            name: "filabridge",
            path: "out/ios-release/filament/lib/universal/filabridge.xcframework"
        ),
        .binaryTarget(
            name: "filaflat",
            path: "out/ios-release/filament/lib/universal/filaflat.xcframework"
        ),
        .binaryTarget(
            name: "filamat_lite",
            path: "out/ios-release/filament/lib/universal/filamat_lite.xcframework"
        ),
        .binaryTarget(
            name: "filament-iblprefilter",
            path: "out/ios-release/filament/lib/universal/filament-iblprefilter.xcframework"
        ),
        .binaryTarget(
            name: "filament",
            path: "out/ios-release/filament/lib/universal/filament.xcframework"
        ),
        .binaryTarget(
            name: "filameshio",
            path: "out/ios-release/filament/lib/universal/filameshio.xcframework"
        ),
        .binaryTarget(
            name: "geometry",
            path: "out/ios-release/filament/lib/universal/geometry.xcframework"
        ),
        .binaryTarget(
            name: "gltfio",
            path: "out/ios-release/filament/lib/universal/gltfio.xcframework"
        ),
        .binaryTarget(
            name: "ibl-lite",
            path: "out/ios-release/filament/lib/universal/ibl-lite.xcframework"
        ),
        .binaryTarget(
            name: "ibl",
            path: "out/ios-release/filament/lib/universal/ibl.xcframework"
        ),
        .binaryTarget(
            name: "image",
            path: "out/ios-release/filament/lib/universal/image.xcframework"
        ),
        .binaryTarget(
            name: "ktxreader",
            path: "out/ios-release/filament/lib/universal/ktxreader.xcframework"
        ),
        .binaryTarget(
            name: "meshoptimizer",
            path: "out/ios-release/filament/lib/universal/meshoptimizer.xcframework"
        ),
        .binaryTarget(
            name: "shaders",
            path: "out/ios-release/filament/lib/universal/shaders.xcframework"
        ),
        .binaryTarget(
            name: "smol-v",
            path: "out/ios-release/filament/lib/universal/smol-v.xcframework"
        ),
        .binaryTarget(
            name: "stb",
            path: "out/ios-release/filament/lib/universal/stb.xcframework"
        ),
        .binaryTarget(
            name: "uberz",
            path: "out/ios-release/filament/lib/universal/uberz.xcframework"
        ),
        .binaryTarget(
            name: "utils",
            path: "out/ios-release/filament/lib/universal/utils.xcframework"
        ),
        .binaryTarget(
            name: "viewer",
            path: "out/ios-release/filament/lib/universal/viewer.xcframework"
        ),
        .binaryTarget(
            name: "vkshaders",
            path: "out/ios-release/filament/lib/universal/vkshaders.xcframework"
        ),
        .binaryTarget(
            name: "zstd",
            path: "out/ios-release/filament/lib/universal/zstd.xcframework"
        ),
        .target(
            name: "Filament",
            dependencies: [
                "FilamentBindings"
            ],
            path: "ios/Swift/Helpers"
        ),
        .target(
            name: "FilamentBindings",
            dependencies: [
                "filament",
                "backend",
                "basis_transcoder",
                "camutils",
                "civetweb",
                "dracodec",
                "filabridge",
                "filaflat",
                "filamat_lite",
                "filament-iblprefilter",
                "filameshio",
                "geometry",
                "gltfio",
                "ibl-lite",
                "ibl",
                "image",
                "ktxreader",
                "meshoptimizer",
                "shaders",
                "smol-v",
                "stb",
                "uberz",
                "utils",
                "viewer",
                "vkshaders",
                "zstd",
            ],
            path: "ios/Swift/Bindings",
            cxxSettings: [
                .headerSearchPath("../../../out/ios-release/filament/include")
            ]
        ),
    ],
    cxxLanguageStandard: .cxx20
)
