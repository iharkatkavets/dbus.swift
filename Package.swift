// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DBusSwift",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "DBusSwift",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Core",
                "Clibdbus"
            ],
            path: "Sources"
        ),
        .target(
            name: "Core",
            dependencies: [
                "Clibdbus"
            ],
            path: "Core"
        ),
        .systemLibrary(
            // pkg-config --cflags dbus-1
            name: "Clibdbus",
            pkgConfig: "dbus-1",
            providers: [
                .apt(["libdbus-dev"])
            ]
        )
    ]
)
