// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "1.24.0"
let targets = [
    "filament":"424ad0f0c6469046e28fa7667aa504645fab84a4636bf9876755f0be4181c016",
    "gltfio": "d015e741db43d74ec8111f7efcdac8f554d897eb7839fd7462f52d3c6f5fb79b",
    "backend": "e292e31f25d6e5b97b4d7951dcd317cb907d06e086cdab272d066e6c70d4d372",
    "utils": "33f983818a8705a9ff310c280fdca32dfb23e6fa1470904b6e03abe5796811d0",
    "geometry": "0b8f320494fa3e6355166a8685c6cb7ca6b523745f3dd23bef5b245a42bec6c1",
    "dracodec": "aa271458994b13409cd76e344c27184b558b8b9dcbe6b7a921c88bc06b680111",
    "uberz": "536a277df76ce67bec54eb9f4b9ce4dc335f2afde500b3a5845b861bc5259440",
    "filaflat": "f63c457c0eb298102b423085020ca5e792a9b34e3704078d579f4f53a199278c",
    "uberarchive": "9f58684f78fe0266537d07dc5d3fa1f2f174d4174f0e993e8ff0dc2aefd1495c",
    "ktxreader": "cf74b47bfa25b85d34bf886f228c311fb890b9dda6b600c7b7e4dddef314cc91",
    "ibl": "2f62430922ddd99cce97876065917453e9895e3ce37911de2b340a6966971f75",
    "zstd": "76e94bebefbf95d955d5335191366092241cf19a8b0dc97e4bc79901eb5c3322",
    "basis_transcoder":"29dce1d96e73f4b7e333e19c7a901b9f97396b401b6e3506c24d8ab4105ac272",
    "camutils":"7a20909ed8cf3f4b4f2aca3117f0df7bb05b02053cc4c733346ffade4ef47f7d",
    "civetweb":"0cf12df6b7f4003d7a0c88ee6c1f11e828c926be99194aea0579eb0efd12ead8",
    "filabridge":"0acf24043dd17395c74c72b539a879634ff5a210143092dfc95f756f57a0eb69",
    "filamat_lite":"fb0e5f02051723e29450814346a8513be09b58bf96b0687da69f899019f8ccbd",
    "filament-iblprefilter":"613d53690a412ad2ccbe1e750cc5a8ca4f8a09f75131233e49d84c76a540578a",
    "filameshio":"3f605145a2a0e3bd9443f2e053274de808ae73626eb33565dca169170559241e",
    "image":"b6a7272192e89e264a44047572edc32ff84a35446382cbbe5697522990dfd649",
    "meshoptimizer":"cd664a4ccd8d630f5e848f88b47710dbe1b698c65599fe25d3cefee2db80f3e8",
    "shaders":"9a3f6c73fd22d9c00beaa833b8749379424cfb2ce49198ed391a4997c9ae58ae",
    "smol-v":"3e5c0c658a9d79ed6abc3c57f782431f7c1143248c68e0149ea8f86368c0961a",
    "stb":"35d6cd4964223357f7d976f48330392af2e9831d34e018cc75e0856142cd4b31",
    "viewer":"9c73c545ef87a71f7ad5a653ffb8387966f95ae47c0bb8e713782ec7bb89b651",
    "vkshaders":"fa0e80c7b48de3bd65491929c616178b9d09bbbd12bf534dc067cd2eb4d9ceaf"
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
    cxxLanguageStandard: .cxx20
)
