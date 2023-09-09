// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let targets = [
    "libbackend","libbasis_transcoder","libcamutils","libcivetweb","libdracodec","libfilabridge","libfilaflat","libfilamat","libfilamat_lite","libfilament-iblprefilter","libfilament","libfilameshio","libgeometry","libgltfio_core","libibl-lite","libibl","libimage","libktxreader","libmeshoptimizer","libmikktspace","libshaders","libsmol-v","libstb","libuberarchive","libuberzlib","libutils","libviewer","libvkshaders","libzstd"
]


let package = Package(
    name: "filament",
    products: [
        .library(
            name: "filament",
            targets: targets
        ),
    ],
    targets: targets.map({ .binaryTarget(name: $0, path: "lib/universal/\($0).xcframework") })
)
