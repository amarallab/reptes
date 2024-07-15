// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Reptes",
    platforms: [
        .macOS("12.0"),
        .iOS("15.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Reptes",
            targets: ["Reptes"]),
        .library(
            name: "ReptesUI",
            targets: ["ReptesUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/gonzalezreal/swift-markdown-ui", from: "2.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Reptes",
            dependencies: []),
        .target(
            name: "ReptesUI",
            dependencies: [
                "Reptes",
                .product(name: "MarkdownUI", package: "swift-markdown-ui")
            ]),
        .testTarget(
            name: "ReptesTests",
            dependencies: ["Reptes"]),
        .testTarget(
            name: "ReptesUITests",
            dependencies: ["Reptes", "ReptesUI"])
    ]
)
