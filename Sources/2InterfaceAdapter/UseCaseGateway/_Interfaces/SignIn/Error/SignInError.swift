//  Created by Alessandro Comparini on 15/09/23.
//

import Foundation

import AuthDomain

public struct SignInError: Error {
        
    public let code: SignInDomainError
    
    public init(code: SignInDomainError) {
        self.code = code
    }
    
}
