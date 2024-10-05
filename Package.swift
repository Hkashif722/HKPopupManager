// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "HKPopManager",  // Updated name
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "HKPopManager",  // Updated product name
            targets: ["HKPopManager"]),
    ],
    dependencies: [
        // Add any dependencies if required
    ],
    targets: [
        .target(
            name: "HKPopManager",  // Updated target name
            dependencies: []),
        .testTarget(
            name: "HKPopManagerTests",  // Updated test target name
            dependencies: ["HKPopManager"]),
    ]
)
