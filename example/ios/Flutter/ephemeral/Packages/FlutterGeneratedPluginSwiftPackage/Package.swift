// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// Generated file. Do not edit.
//

import PackageDescription

let package = Package(
    name: "FlutterGeneratedPluginSwiftPackage",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "FlutterGeneratedPluginSwiftPackage", type: .static, targets: ["FlutterGeneratedPluginSwiftPackage"])
    ],
    dependencies: [
        .package(name: "file_picker_darwin", path: "../.packages/file_picker_darwin-2.1.2"),
        .package(name: "flutter_inappwebview_ios", path: "../.packages/flutter_inappwebview_ios-1.2.0-beta.3"),
        .package(name: "flutter_keyboard_visibility", path: "../.packages/flutter_keyboard_visibility-7.0.1"),
        .package(name: "FlutterFramework", path: "../.packages/FlutterFramework")
    ],
    targets: [
        .target(
            name: "FlutterGeneratedPluginSwiftPackage",
            dependencies: [
                .product(name: "file-picker-darwin", package: "file_picker_darwin"),
                .product(name: "flutter-inappwebview-ios", package: "flutter_inappwebview_ios"),
                .product(name: "flutter-keyboard-visibility", package: "flutter_keyboard_visibility"),
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
