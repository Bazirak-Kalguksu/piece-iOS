import ProjectDescription
import ProjectDescriptionHelpers

let projects = Project.executable(
    name: "piece",
    platform: .iOS,
    dependencies: [
        .SPM.Moya
    ]
)
