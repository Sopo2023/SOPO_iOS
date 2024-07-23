import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Sopo",
    platform: .iOS,
    product: .app,
    dependencies: [
        .SPM.Moya,
        .SPM.Alamofire,
        .SPM.SDS
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
