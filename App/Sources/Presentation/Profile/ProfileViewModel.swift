import SwiftUI
import Alamofire

class ProfileViewModel: ObservableObject {
    @Published var model: UserResponse = .init()
    @Published var reloadValue: Int = 0
    
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
    
    func chargeMoney( onComplete: @escaping () -> () ) {
        AF.request("\(Bucket.BASE_URL)/user/charge-money",
                   method: .patch,
                   parameters: ["money": reloadValue],
                   encoding: URLEncoding.default,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<Empty>.self) { response in
            switch response.result {
            case .success(let result):
                print("result : \(result)")
                if result.status == 200 {
                    onComplete()
                    
                }
            case .failure(let error):
                
                print("error : \(error.localizedDescription)")
                break
            }
        }
    }
}
