import ProjectDescription

public extension Project {
    static func executable(
        name: String,
        platform: Platform = .iOS,
        product: Product = .app,
        deploymentTarget: DeploymentTarget = .iOS(targetVersion: "16.0", devices: .iphone, supportsMacDesignedForIOS: false),
        dependencies: [TargetDependency],
        settings: Settings? = nil
    ) -> Project {
        return Project(
            name: name,
            organizationName: myOrganizationName,
            settings: .settings(),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(myOrganizationName).\(name)",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .file(path: Path("Support/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies,
                    settings: settings,
                    environment: ["IDEPreferLogStreaming": "YES"]
                    
                )
                
            ]
        )
    }
}
