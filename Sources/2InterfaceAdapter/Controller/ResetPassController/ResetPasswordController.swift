//  Created by Alessandro Comparini on 19/07/24.
//

public protocol ResetPasswordController {
    func reset(_ email: String) async -> Bool
}
