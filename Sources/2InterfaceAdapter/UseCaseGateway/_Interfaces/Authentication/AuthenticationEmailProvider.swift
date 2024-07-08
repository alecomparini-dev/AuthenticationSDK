
//  Created by Alessandro Comparini on 14/09/23.
//

import Foundation


public protocol AuthenticationEmailProvider {
    typealias UserId = String
    func createAuth(email: String, password: String, completion: @escaping (UserId?, AuthenticationError?) -> Void)
    
    func signIn(email: String, password: String, completion: @escaping (UserId?, AuthenticationError?) -> Void)
    
}
