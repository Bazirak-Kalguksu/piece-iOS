import SwiftUI

class SigninViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

}
