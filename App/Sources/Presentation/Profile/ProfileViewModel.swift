import SwiftUI
import Alamofire

class ProfileViewModel: ObservableObject {
    @Published var model: UserResponse = .init()
    
    let firstDateFormatter = DateFormatter()
    let secondDateFormatter = DateFormatter()
    
    init() {
        firstDateFormatter.dateFormat = "yyyyMMdd"
        secondDateFormatter.dateFormat = "yyyy.MM.dd"
        
        self.getProfile()
    }
    
    func getProfile() {
        AF.request("\(Bucket.BASE_URL)/user",
                   method: .get,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<UserResponse>.self) { response in
            switch response.result {
            case .success(let result):
                if var data = result.data {
                    guard let date = self.firstDateFormatter.date(from: data.birth) else { return }
                        
                    data.birth = self.secondDateFormatter.string(from: date)
                    
                    self.model = data
                }
            case .failure(_):
                break
            }
        }
    }
}
