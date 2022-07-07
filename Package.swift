// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.25.0"
let targets = [
    "filament":"a7aefb0eccf84b126bdee515499686d7a09c369aee2dfede8eac37ef1fec28e7",
    "gltfio": "1ec108a0b9c0ff70ef5ca4d81840210f464e7aa753fd58886d3f52b26e084175",
    "backend": "48f271fa9d9f8637ba8b5c6022048d1c21e16112def5276d5f18249313bbb70f",
    "utils": "4b8618dfcdcd90aa0d4cb35dc4d59fee0fe46c853e48724a0a6e0485211f6fc0",
    "geometry": "fb6fe0be219119a0c60fb2d14fa67b2d866368b5d992816e6cc6c5b6f6187554",
    "dracodec": "baf57bc738261b6c641159d759b074575ffb16c604f6df72af9b9fd9af348580",
    "uberz": "35bdcfa4c2f34b033001939c0eb7148019588ac91a770638606bfde1930eb856",
    "filaflat": "f3e2d23ed3ad1c0a18ac0d986f18f93a054e87fe5e745671f98f7f1f59cd8f09",
    "uberarchive": "aa5bcc28094c067d11f39ca4c45ecbd0f5bc558c2549012e2585e82cb9d5d0f4",
    "ktxreader": "951f1afeb7aee004f02f04c262b754220ef9c391250c39b5f20e14f2d133d96c",
    "ibl": "09b8196353f858b437ccabbd33c4db8782b3cc531eb3b89ec42bd2b8bba05792",
    "zstd": "1398495b4e5c3a1960c9064964b8f31a198bf4117a78f92f081e1f1fa58bddbe",
    "basis_transcoder":"3c068008f2668589ac66bc55ffa8730c2376895d57f2af3439d05c13af204b21",
    "camutils":"df984002d3a43da55642e205e47109d67f85e22e36561a3c23cfb4f06181a6c0",
    "civetweb":"602e5e076f9a1f3ef1a5bbee707070f1a496b277fa2d6687a406c379a53a7d87",
    "filabridge":"a2433274921f7e447cdbbe487d92d19a2ebc74dc2b4dbe83c84eb38a0eb8cfa6",
    "filamat_lite":"d8a86716af316bf7675c88586ea6e7c15b4168632b80a99bf443e5590390a0c9",
    "filament-iblprefilter":"a336e6b07553b6ed318a109a94e1f160968f5e2cdc6ce635de790b1b65f46cff",
    "filameshio":"90ed3419a215bbd64fc7609ab86a0f05f78cdd197a7803241876ea69e8494f56",
    "image":"85859d533dcc2699ddb1feaa171fc1b81a00e52241bbd002f5a4226620e4d22e",
    "meshoptimizer":"3fe86a0c8119a51a1ebc5cec994e770bad6d23394f51aba17472e7e175402da4",
    "shaders":"2b5f7279443cb20260fad2bd3c9a1f15ef5c98f91138f7aceb44ff8ab1cf5548",
    "smol-v":"0d2f91b72ea2d0d31f6e20940be81f959ca0879d757344f3dc5884264580ce04",
    "stb":"a8b5e5a599921664d830225b5b0511ff03303d9471683783feb88cb071e77f0d",
    "viewer":"6d8c6fb0117637003ea7799a19040033f2ddf17d510ef2720705ce5e904b456d",
    "vkshaders":"ba276da5769e76ff96299097edf3a9c220a408fff43df886d14e3732a4c8d743",
    "math": "a823fabcb90656b8fb41a6630fac09e51c106313c242b2a715b60ad2113e4815"
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
    
    targets: targets.map({ .binaryTarget(name: $0.key, url: "https://github.com/Stefterv/filament/releases/download/v\(version)/\($0.key).xcframework.zip", checksum: $0.value) }),
    // targets: targets.map({ .binaryTarget(name: $0.key, path: "out/ios-release/filament/lib/universal/\($0.key).xcframework") }),
    cxxLanguageStandard: .cxx20
)
