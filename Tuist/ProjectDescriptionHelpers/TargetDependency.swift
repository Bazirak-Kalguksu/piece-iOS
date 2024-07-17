import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let Moya = TargetDependency.external(name: "Moya")
    static let Flow = TargetDependency.external(name: "FlowKit")
}

public extension Package {}
