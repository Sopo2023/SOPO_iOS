import ProjectDescription

public extension TargetDependency {
    struct SPM { }
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let SDS = TargetDependency.external(name: "SDS")

}

public extension Package {}
