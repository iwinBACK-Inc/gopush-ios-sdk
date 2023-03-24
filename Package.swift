// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GoPush",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GoPushApp",
            targets: ["GoPushApp", "GoPushAppDeps"]),
        .library(
            name: "GoPushNotifications",
            targets: ["GoPushNotifications", "GoPushNotificationsDeps"]),
        .library(
            name: "GoPushMessaging",
            targets: ["GoPushMessaging", "GoPushMessagingDeps"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "GoPushCore",
            path: "bin/GoPushCore.xcframework"
        ),
        .binaryTarget(
            name: "GoPushApp",
            path: "bin/GoPushApp.xcframework"
        ),
        .binaryTarget(
            name: "GoPushNotifications",
            path: "bin/GoPushNotifications.xcframework"
        ),
        .binaryTarget(
            name: "GoPushMessaging",
            path: "bin/GoPushMessaging.xcframework"
        ),
        .target(
            name: "GoPushAppDeps",
            dependencies: ["GoPushCore"],
            path: "GoPushAppDeps"
        ),
        .target(
            name: "GoPushNotificationsDeps",
            dependencies: ["GoPushCore"],
            path: "GoPushNotificationsDeps"
        ),
        .target(
            name: "GoPushMessagingDeps",
            dependencies: ["GoPushCore"],
            path: "GoPushMessagingDeps"
        )
    ]
)
