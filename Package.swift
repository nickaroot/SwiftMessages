// swift-tools-version:5.0

import PackageDescription

let pkg = Package(name: "SwiftMessages")
pkg.platforms = [
   .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
]
pkg.products = [
    .library(name: "SwiftMessages", targets: ["SwiftMessages"]),
]

let smg: Target = .target(name: "SwiftMessages")
smg.path = "Sources"
pkg.swiftLanguageVersions = [.v4, .v4_2, .v5]
pkg.targets = [
    smg,
    .testTarget(name: "SwiftMessagesTests", dependencies: ["SwiftMessages"], path: "SwiftMessagesTests"),
]

