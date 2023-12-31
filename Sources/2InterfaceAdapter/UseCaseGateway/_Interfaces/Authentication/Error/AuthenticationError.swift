//  Created by Alessandro Comparini on 15/09/23.
//

import Foundation

import AuthDomain

public struct AuthenticationError: Error {
        
    public let code: AuthenticationDomainError
    
    public init(code: AuthenticationDomainError) {
        self.code = code
    }
    
}
