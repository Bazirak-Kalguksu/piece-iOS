import SwiftUI

struct UserResponse: Codable {
    var email: String = ""
    var password: String = ""
    var name: String = ""
    var birth: String = ""
    var point: Int = 0
    var balance: Int = 0
}
