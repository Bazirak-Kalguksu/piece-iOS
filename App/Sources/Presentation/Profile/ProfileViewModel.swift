import SwiftUI
import Alamofire

enum DonationType: String {
    case point = "point"
    case balance = "money"
}

class ProfileViewModel: ObservableObject {
    
    @Published var model: UserResponse = .init()
    @Published var reloadValue: Int = 0
    @Published var donationSheetCondition: Bool = false
    @Published var shareSheetCondition: Bool = false
    
    let firstDateFormatter = DateFormatter()
    let secondDateFormatter = DateFormatter()
    
    init() {
        firstDateFormatter.dateFormat = "yyyyMMdd"
        secondDateFormatter.dateFormat = "yyyy.MM.dd"
        
        self.getProfile()
    }
    
    func openSheet() {
        donationSheetCondition.toggle()
    }
    
    func donation(type: DonationType, value: Int, onComplete: (() -> ())? = nil, onError: (() -> ())? = nil) {
        AF.request("\(Bucket.BASE_URL)/donate/\(type.rawValue)",
                   method: .patch,
                   parameters: [type.rawValue: value],
                   encoding: JSONEncoding.default,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<Empty>.self) { response in
            print(type.rawValue)
            print(response)
            switch response.result {
            case .success(let result):
                if result.status == 200 {
                    if let onComplete = onComplete {
                        onComplete()
                    }
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
