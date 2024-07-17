import SwiftUI
import Alamofire

class HomeViewModel: ObservableObject {
    @Published var campaigns: [CampaignResponse] = .init()
    
    func getCampaigns() {
        AF.request("\(Bucket.BASE_URL)/campaign/list",
                   parameters: ["page": 1, "size": 10],
                   encoding: URLEncoding.default,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<[CampaignResponse]>.self) { response in
            switch response.result {
            case .success(let result):
                self.campaigns = result.data ?? .init()
            case .failure(_):
                break
            }
        }
    }
}
