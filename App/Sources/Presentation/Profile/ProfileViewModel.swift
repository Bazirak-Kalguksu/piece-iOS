import SwiftUI
import Alamofire

class ProfileViewModel: ObservableObject {
    @Published var model: UserResponse = .init()
    
    func getProfile() {
        AF.request("\(Bucket.BASE_URL)/user",
                   method: .get,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<UserResponse>.self) { response in
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    self.model = data
                }
            case .failure(_):
                break
            }
        }
    }
}
