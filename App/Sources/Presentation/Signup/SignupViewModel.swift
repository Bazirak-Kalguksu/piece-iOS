import SwiftUI
import Alamofire
import FlowKit

class SignupViewModel: ObservableObject {
    @Published var name: String = "신민호"
    @Published var birth: Date? = Date.now
    @Published var email: String = "gaaaaag@gmail.com"
    @Published var password: String = "1234"
    @Published var passwordConfirm: String = "1234"
    
    
    let dateFormatter = DateFormatter()
    
    init() {
        self.dateFormatter.dateFormat = "yyyyMMdd"
    }
    
    func signup(onComplete: @escaping () -> ()) {
        
        if let birth = birth {
            AF.request(
                "\(Backet.BASE_URL)/auth/sign-up",
                method: .post,
                parameters: [
                    "email": email,
                    "password": password,
                    "birth": dateFormatter.string(from: birth),
                    "name": name
                ],
                encoding: JSONEncoding.default
            )
            .responseDecodable(of: BaseResponse<Empty>.self) { result in
                switch result.result {
                    
                case .success(let data):
                    
                    
                    print(data)
                    
                    if data.status == 201 {
                        onComplete()
                    }
                case .failure(_): break
                    
                }
                
            }
            

        }


    }
}
