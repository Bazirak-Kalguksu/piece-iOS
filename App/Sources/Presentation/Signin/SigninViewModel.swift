import SwiftUI
import Alamofire

class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signin( onComplete: @escaping () -> (), onError: (() -> ())? ) {
        AF.request(
            "\(Bucket.BASE_URL)/auth/sign-in",
            method: .post,
            parameters: [
                "email": email,
                "password": password
            ],
            encoding: JSONEncoding.default
        )
        .responseDecodable(of: BaseResponse<SigninResponse>.self) { response in
            switch response.result {
            case .success(let result):
                
                if 200..<300 ~= result.status {
                    
                    if let data = result.data {
                        KeyChain.create(token: data)
                    }
                    
                    onComplete()
                    
                }
                
                else {
                    if let onError = onError {
                        onError()
                    }
                }
                
            case .failure(_):
                break
            }
        }
    }
}
