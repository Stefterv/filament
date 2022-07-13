// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "v1.25.1"
let targets = [
    "filament":"328b6b99295919e0546a9f1545cc26b75e5cb361f3d1a805bcd98fe42df685ac",
    "gltfio":"a19cc84be205c072d10c32fb18ffabf160cf98ad265e6b62699ed4a7071d7303",
    "backend":"770272a12f858fcbd6b6ab4f7c5a423c2e7997730178ad3619b8ca13cb99542a",
    "utils":"a7fb07e569e85fe957b59008b1d439f11f70f311a3f5368b04b44b0bfe666063",
    "geometry":"785b7ebd43cf17c977afab5abe5edaf4a3dcf7f22d40bee69d08192eaf036ccd",
    "dracodec":"dc59af9a8a91db6eeb6398bff8a108ac77020834fc60d3d92c709f922d094641",
    "uberz":"c735b041ca99a4514252462558dfc753651eefa52c07b073515c54283ff17623",
    "filaflat":"94f94d3e12cc59f8435b88108dab3914fb28a11a7ae1e7f882b6af0a680febb2",
    "uberarchive":"7ee4eef8917b208c565b92d200de55a1dd1d71fa575ca641d356647aabd99ee3",
    "ktxreader":"2e3221666af466b0dc3788908cc66dd5331edb61822409ec8243877f33961d5d",
    "ibl":"e9834a551a21d9107e4fea74f8f49f9ac611d4112e40329cefbe0e59f546a072",
    "zstd":"35d98da6ad26aa809f55b5ce2640582dc6fa441aac2b1a1a1bf5e24c03993357",
    "basis_transcoder":"4fb8c6a9bc1be73540202504f51b9928c700ddf6fd3d607afddd0918efd80f4d",
    "camutils":"a7fb07e569e85fe957b59008b1d439f11f70f311a3f5368b04b44b0bfe666063",
    "civetweb":"13cd2378a15b0599720cc7e69f0c2fb645be3f0fb11dd5ae160e07b26acf391c",
    "filabridge":"fd7fc7650883b45380245b41207ab6899bce9b089f85229a56f2fad97b8b7a2f",
    "filamat_lite":"6ae5294467c0d144f224e7008338433c92011311703d83258c2ad7c54223a592",
    "filament-iblprefilter":"3e776d71525122eff348977633c2b7bd2015651d9c7a1724dc0f90a0f93e4a96",
    "filameshio":"22486fdc22d35a4904fdc86174f668913837d2f28b48998b35ad27daf8b1955c",
    "image":"5ef69cf7aa38dff601973066d7d35c7c495ec51b18443131e1658478143c8d85",
    "meshoptimizer":"579bbf325092b058f3ffb32492ee475f4b2cb82e13b38daa02798cf26d5e9e85",
    "shaders":"65a776bc79712ad8ae714e27fc51d136969c790f8028965615ac9c540acee0ba",
    "smol-v":"7a70cca0ffe54c0ba57ff86718d8ef1d217a4b3c08f21401178bdf4adc810bb4",
    "stb":"d409f120f2ec1d435f730bf55047a0063a982d71de5a596688c2fcc8687b73dd",
    "viewer":"d0ba07c1624f84b53e9bd6fe3bb2df8ce2177e752478879440b6db53c7cdf585",
    "vkshaders":"23f0128afa568fbea2be46ea5b4c4c6f707a5bacbb467489924f651208c404e9",
    "math":"d57ba1a5e8d35a72ab4e484eeded20cc120a1294710f9b752fa7f2057821d07d"
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
