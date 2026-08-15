// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "joe",
    platforms: [
        .iOS(.v14),
        .macCatalyst(.v14),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "joe", targets: ["joe", "JoeDependencies"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/kitknox/ios_system-rootshell.git",
            exact: "0.1.0"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "joe",
            url: "https://github.com/kitknox/joe-rootshell/releases/download/v0.1.0/joe.xcframework.zip",
            checksum: "c8cc049f7d89fae749f170c3e850c1ac01de429fc3ff70cd94f845407a410c2b"
        ),
        .target(
            name: "JoeDependencies",
            dependencies: [
                .product(
                    name: "ios_system",
                    package: "ios_system-rootshell"
                ),
            ]
        ),
    ]
)
