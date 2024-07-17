import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .branch("master")
            ),
            .remote(
                url: "https://github.com/Moya/Moya.git",
                requirement: .branch("master")
            ),
            .remote(
                url: "https://github.com/Mercen-Lee/FlowKit.git",
                requirement: .branch("main")
            )
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ]
        )
    ),
    platforms: [.iOS]
)
