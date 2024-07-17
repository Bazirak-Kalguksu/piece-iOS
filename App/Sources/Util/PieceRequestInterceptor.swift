import Alamofire
import Foundation

final class PieceRequestInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        guard let accessToken = KeyChain.read()?.accessToken else {
            completion(.success(urlRequest))
            return
        }
        
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        guard let refreshToken = KeyChain.read()?.refreshToken else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        
        AF.request("\(Bucket.BASE_URL)/auth/refresh",
                   method: .post,
                   parameters: ["refreshToken": refreshToken],
                   encoding: JSONEncoding.default
        )
        .responseDecodable(of: BaseResponse<RefreshResponse>.self) { response in
            switch response.result {
            case .success(let result):
                if result.status == 200 {
                    
                    if let data = result.data {
                        KeyChain.update(token: SigninResponse(accessToken: data.accessToken, refreshToken: refreshToken))
                        
                    }
                }
                else {
                    KeyChain.delete()
                }
                
                completion(.doNotRetry)
                
            case .failure(_):
                completion(.doNotRetryWithError(error))
            }
        }
    }

}
