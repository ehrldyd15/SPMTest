// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetSPMTest",
    platforms: [.iOS(.v13), .tvOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "MetSPMTest",
            targets: ["MetSPMTest"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.3")
    ],
    targets: [
        .target(
            name: "MetSPMTest",
            dependencies: ["Lottie"],
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
