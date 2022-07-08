// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "v1.25.0"
let targets = [
    "filament":"3a455f8112d8c5d20c8b83aafe595d1813ff26723a5ebb862baa146ef468e1e3",
    "gltfio":"b4a96d837d13f40123a606d51fcba5d130d0bc3ee2e22f01cabdc1d4cd501b6f",
    "backend":"90aa726191c751602087a9dcd8829a00644ec002e03d615863639c2020c11719",
    "utils":"922b88c1f24300621b2ccfd63514f996dc24c712c3119afd3d99149cfac3b1bc",
    "geometry":"aa2f5b4d580f9dffe24edef629bb9639981db2ab445faa1be7c1baf6d270e0ac",
    "dracodec":"ab4cebea1bc3e4ad017fc00840c9dc073b5aa8f5e637c3570701dd7497c24d87",
    "uberz":"1b725299e735930395e5b076c5e2c947d6f9a677ad46368c529247ee4971d1f8",
    "filaflat":"c09fef93e42fc3daa8b1a18b45ef174df33a8d69ceb9e8453b704d29b37b969c",
    "uberarchive":"7072af425082e76087e7a3813e0339a3e97d09289e3f54b255c7c28e41ed7695",
    "ktxreader":"e3175785983471bfa1593c2f19242509cd7b55ff86cf56ba25c478d54522f043",
    "ibl":"a623467c62324b774080172f48d463b5815def421a87c366f5786957df2efec1",
    "zstd":"315a9e86f63dc4469393e0c3f595d72e8652a40f8408e3453927329c5ec44a8c",
    "basis_transcoder":"c3a47178993e88c2b396818a2f0549305d76b045e9ead04a2626ab1a630e9ec4",
    "camutils":"9782d848d29d9cf3eb530f5825f85972367c5d44577c1debfdb5ea55934abc64",
    "civetweb":"7f9520dd6c309b5793fe0fbbfc309368caaa63141ad712e949118c2d6ce5d495",
    "filabridge":"4613f788647dc7a3685861a891f7664cff6ce5219b924b3247ae460b97818368",
    "filamat_lite":"3260d6d775e734deb88847abe39413d3565b953a887943eb07b3b0948c36156a",
    "filament-iblprefilter":"f1c62725e15c725a8adb7dfe914e9469e956d324d26b5da9a029689d7d706e5e",
    "filameshio":"cc0cf79cb9bd558ac3ac363e7ffdf3d4bd266ba7f65be030a08d90c73a3cbe6b",
    "image":"d078d0f96e8abce6f167cf309f66e63bf2970b924934ebd1a15d577b77cecfc6",
    "meshoptimizer":"226c3526181d22844836bac53e9a14aa07144cf52a61b9e80511e6a2ca00c345",
    "shaders":"105cec3d1c3ac1e2489e99caf8afc2aa47c772c1f0a207b34412c5a50a65a00d",
    "smol-v":"86358732f37b4ee703b04ab50db2cf41b77079a2a6dcc5b65e84479e9da251f5",
    "stb":"f3833d75ce338e1f03132685d9ed01f37e6908296ffcc7e5909a4163444fa081",
    "viewer":"07adc126bc4b91047d0da3184911bac3f8a82024d225076c602b054b6e6bd6a9",
    "vkshaders":"ef24bbaae0490eba5bcfb1fc47bbcd5491315f48d27ee150c05ae781de569b2f",
    "math":"c3a1b10ef46bd5f34c0c9a39d9ae4e61427af8e7f9630e0ecd8ab91dc7945d63"
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
