// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetSPMTest",
    platforms: [.iOS(.v13), .tvOS(.v13), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MetSPMTest",
            targets: ["MetSPMTest"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MetSPMTest",
            dependencies: [],
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "MetSPMTestTests",
            dependencies: ["MetSPMTest"]),
    ]
)


/*
리소스를 추가할 때, .process는 리소스 번들 루트에 위치되고, .copy는 디렉터리 구조를 유지하면서 추가됩니다.
resources: [
    .process("이미지파일 이름"),
    .copy("Data")
]

타겟에서 리소스 번들에 접근할 때 SwiftPM은 Bundle.module이라는 accessor로 접근합니다.
let image = UIImage(named: "Logo", in: Bundle.module)
*/
