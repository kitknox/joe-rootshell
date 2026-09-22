// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "joe",
    platforms: [
        .iOS(.v18),
        .macCatalyst(.v18),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "joe", targets: ["joe", "JoeDependencies"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/kitknox/ios_system-rootshell.git",
            exact: "0.1.1"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "joe",
            url: "https://github.com/kitknox/joe-rootshell/releases/download/v0.1.2/joe.xcframework.zip",
            checksum: "82f51050784ef34b2cd3f4391e2228b47b16af3242f52e13e69ad5d2b9124dba"
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
