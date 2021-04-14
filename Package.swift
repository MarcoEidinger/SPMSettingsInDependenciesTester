// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMSettingsInDependenciesTester",
    products: [
        .library(
            name: "SPMSettingsInDependenciesTester",
            targets: ["SPMSettingsInDependenciesTester"]),
    ],
    dependencies: [
        .package(name: "SPMSettingsTester", url: "https://github.com/MarcoEidinger/SPMSettingsTester", .exact("1.0.0")),
    ],
    targets: [
        .target(
            name: "SPMSettingsInDependenciesTester",
            dependencies: [.product(name: "SPMSettingsTester-Dynamic", package: "SPMSettingsTester")],
            cSettings: [
                .define("SQLITE_HAS_CODEC", to: "1"),
            ],
            swiftSettings: [
                .define("SQLITE_HAS_CODEC"),
            ]
        ),
        .testTarget(
            name: "SPMSettingsInDependenciesTesterTests",
            dependencies: ["SPMSettingsInDependenciesTester"],
            cSettings: [
                .define("SQLITE_HAS_CODEC", to: "1"),
            ],
            swiftSettings: [
                .define("SQLITE_HAS_CODEC"),
            ]
        ),
    ]
)
