// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IntuneMAM",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "IntuneMAMSwift",
                 targets: ["IntuneMAMSwift", "IntuneMAMSwiftStub"]),
        .library(name: "IntuneMAMStatic",
                 targets: ["IntuneMAMStaticWrapper", "IntuneMAMSwiftStub"]),
        .library(name: "IntuneMAMTelemetry",
                 targets: ["IntuneMAMTelemetry"]),
        .library(name: "libIntuneMAMSwiftFileProvider",
                 targets: ["libIntuneMAMSwiftFileProvider", "IntuneMAMSwiftStub"])
    ],
    targets: [
        .target(
          name: "IntuneMAMStaticWrapper",
          dependencies: [
            .target(name: "IntuneMAMStatic", condition: .when(platforms: [.iOS]))
          ],
          path: ".",
          linkerSettings: [
            .linkedFramework("AudioToolbox"),
            .linkedFramework("CoreServices"),
            .linkedFramework("ImageIO"),
            .linkedFramework("LocalAuthentication"),
            .linkedFramework("MessageUI"),
            .linkedFramework("QuartzCore"),
            .linkedFramework("Security"),
            .linkedFramework("MetricKit"),
            .linkedFramework("MessageUI"),
            .linkedFramework("SystemConfiguration"),
            .linkedFramework("WebKit")
          ]
        ),
        // Local Binary Packages
        .binaryTarget(name: "IntuneMAMSwiftStub",
                      path: "./IntuneMAMSwiftStub.xcframework"
                     ),
        .binaryTarget(name: "IntuneMAMSwift",
                      path: "./IntuneMAMSwift.xcframework"
                     ),
        .binaryTarget(name: "IntuneMAMStatic",
                      path: "./IntuneMAMStatic.xcframework"
                     ),
        .binaryTarget(name: "IntuneMAMTelemetry",
                      path: "./IntuneMAMTelemetry.xcframework"
                     ),
        .binaryTarget(name: "libIntuneMAMSwiftFileProvider",
                      path: "./libIntuneMAMSwiftFileProvider.xcframework"
                     )
    ]
)