import ProjectDescription
import ProjectDescriptionHelpers

let projects = Project.executable(
    name: "piece",
    platform: .iOS,
    dependencies: [
        .SPM.Alamofire,
        .SPM.Flow
    ],
    settings: .settings(
        base: ["DEVELOPMENT_TEAM": "C22QH9P7HR"],
        configurations: [],
        defaultSettings: .recommended
    )
    
)
