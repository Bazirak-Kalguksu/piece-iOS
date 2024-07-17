import SwiftUI
import Alamofire

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var birth: Date? = nil
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    
    func signup() {
        AF.request()
    }
}
