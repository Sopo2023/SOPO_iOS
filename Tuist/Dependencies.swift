import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: [
        .remote(
            url: "https://github.com/Moya/Moya",
            requirement: .upToNextMajor(from: "15.0.0")),
        .remote(
            url: "https://github.com/Alamofire/Alamofire",
            requirement: .upToNextMinor(from: "5.0.0")),
        .remote(
            url: "https://github.com/Sopo2023/SOPO_Design_system_iOS",
            requirement: .upToNextMajor(from: "0.3.2"))
    ],
    platforms: [.iOS]
)
