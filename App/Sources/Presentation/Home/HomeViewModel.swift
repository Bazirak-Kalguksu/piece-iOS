import SwiftUI
import Alamofire

class HomeViewModel: ObservableObject {
    @Published var campaigns: [CampaignResponse] = .init()
    @Published var page: Int = 1
    
    init() {
        getCampaigns()
    }
    
    func hasReachedEnd(of campaign: CampaignResponse) -> Bool {
        
        return campaigns.count >= page * 10
    }
    
    func getCampaigns() {
        AF.request("\(Bucket.BASE_URL)/campaign/list",
                   parameters: ["page": page, "size": 10],
                   encoding: URLEncoding.default,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<[CampaignResponse]>.self) { response in
            switch response.result {
            case .success(let result):
                self.campaigns.append(contentsOf: (result.data ?? .init()))
            case .failure(_):
                break
            }
        }
    }
    
    @MainActor
    func nextCampaigns() async {
        page += 1
        
        getCampaigns()
        
    }
}
