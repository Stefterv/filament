// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "v1.25.0"
let targets = [
    "filament":"35d1893e8fd0669cf547702d844e1118f45c0db1fa8d78cd93d6ac40231a1ba4",
    "gltfio":"ca2e80af5a7fb03cab2797c173f9ae053717768f77eaa71607b1c5421af59b19",
    "backend":"5b2e3b963d148272c133924ad00c304a1a9d1d551b86b467cdb2a04a51f9b20c",
    "utils":"0c64d97329deacb677fd0f176cd5bd54883d557c1e31c34874325a2dafb7b9ba",
    "geometry":"760ba5690d961e2cb7a07d51d602ee05c0b810508731aef7c6ae4d7e0cc3b506",
    "dracodec":"6d78258bbff972123144476fbd829f8dc75582330c12329237d694449d4cc86d",
    "uberz":"1f1cde7a999ab40e1585d5d20a42b7a324e8fa23044b914dfbaa18f744ebfb33",
    "filaflat":"06207de37c1eadba010c484ab11868ad5004ed92e0a5baf48f8db9155ab3d6ac",
    "uberarchive":"5647cfb155f0897e97bf277ceed0d98b2dc162ee572d65570ffa7a92a16e3624",
    "ktxreader":"9cfa80e0849da30321e366de0cc9e301195afedf3c358a0367fa9eec64af3d91",
    "ibl":"198804d659a67de30de9270280cc98bb2ca0c4e42988bfca2ee26c457a41386b",
    "zstd":"70f1a2d13a9f1fe23e93fd4806f4691fc31f35f1376986cad826fade438a80c9",
    "basis_transcoder":"b9c4e34072eebb10378fd22e50d3960af4f2389eb9507b6d1a886d3f2317d2fb",
    "camutils":"0c64d97329deacb677fd0f176cd5bd54883d557c1e31c34874325a2dafb7b9ba",
    "civetweb":"301aed1237a53edb32d99623428e35c97c499685a92fca5f1917cd02caa55780",
    "filabridge":"7192e6bf1c5a8df24501eb52616ee5029c0b61e19c3b75b28cc3fd3af3e6f51a",
    "filamat_lite":"ff6f2353d1f285a5b05512028596c9fb4b028b20367d4db1300d841ccbf44978",
    "filament-iblprefilter":"7fa63ffd306d1b667a6d350d3a356299d52d7684d2f3f9e1d290637a01de333d",
    "filameshio":"5bb2a165701d83da82adf4af2f19bfb9ebba2803c83644ed3a20ff1417f6dffe",
    "image":"c4eb3aae4934320a1763c06edade1fa1dc426e2ab4fa6b1e437e5198ca4851c6",
    "meshoptimizer":"101c41ab068445043078c53a8a97fc88df99252ec33d6e95053be39a4f17dbf8",
    "shaders":"27c1457e9b916cdb614a941e4ef9ede7ba90ee089f1c50db76689734df4c995d",
    "smol-v":"6a110dca8d8a5da18f1d4776d595efd62bdf35430dfc6cc8f0aa57d2fef76bd8",
    "stb":"adbefe3956b14e7c433d776561ef4fbd108de2e587be16cd593dbb3fb7b92e0d",
    "viewer":"8bd980a205ac7c16e691576b9749920572a60b876e8259cb3b414ff1bd5c9983",
    "vkshaders":"06a1150af490bb9f3f30faefb06b3c47518636765f5874e6da0e1d5f57ee250b",
    "math":"a39d05d66fc52660188764ccc688962972c4bf67aae5c2ef175653baf611e00f"
]
let package = Package(
    name: "filament",
    products: [
        .library(
            name: "filament",
            targets: targets.map({$0.key})),
    ],
    dependencies: [
    ],
    
    targets: targets.map({ .binaryTarget(name: $0.key, url: "https://github.com/Stefterv/filament/releases/download/\(version)/\($0.key).xcframework.zip", checksum: $0.value) }),
    // targets: targets.map({ .binaryTarget(name: $0.key, path: "out/ios-release/filament/lib/universal/\($0.key).xcframework") }),
    cxxLanguageStandard: .cxx20
)
