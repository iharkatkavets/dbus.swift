// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DBusSwift",
    products: [
    .library(name: "DBusSwift", targets: ["DBusSwift"])
    ],
    targets: [
        .target(
            name: "DBusSwift",
            dependencies: ["Core", "Clibdbus"],
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
        ),
        .testTarget(
            name: "DBusSwiftTests",
            dependencies: ["DBusSwift"],
            path: "Tests"
        )
    ]
)
