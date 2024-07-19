//  Created by Alessandro Comparini on 31/10/23.
//

public protocol ResetPasswordProvider {
    func reset(_ email: String) async -> Bool
}
