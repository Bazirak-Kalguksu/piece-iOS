import SwiftUI
import Alamofire

class RankViewModel: ObservableObject {
    @Published var ranks: [RankResponse] = .init()
    @Published var page: Int = 1

    init() {
        getRanks()
        
    }
    
    func resetRanks() {
        ranks = .init()
    }
    
    func getRanks() {
        AF.request("\(Bucket.BASE_URL)/user/ranking",
                   method: .get,
                   parameters: ["page": page, "size": 10],
                   encoding: URLEncoding.default,
                   interceptor: PieceRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<[RankResponse]>.self) { response in
            print(response)
            switch response.result {
            case .success(let result):
                if let data = result.data {
                    self.ranks = data
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    
    @MainActor
    func nextRanks() async {
        page += 1
        
        getRanks()
        
    }

}
