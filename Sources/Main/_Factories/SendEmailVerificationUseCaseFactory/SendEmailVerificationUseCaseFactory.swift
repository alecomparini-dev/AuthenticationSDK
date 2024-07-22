//  Created by Alessandro Comparini on 22/07/24.
//

import AuthenticationSDKUseCaseGateway
import AuthenticationSDKDomain
import AuthenticationSDKProviders

class SendEmailVerificationUseCaseFactory {
    
    static func make() -> SendEmailVerificationUseCase {
        
        let sendEmailProvider = FirebaseSendEmailVerification()
        
        let sendEmailGateway = SendEmailVerificationUseCaseGatewayImpl(sendEmailProvider: sendEmailProvider)

        return SendEmailVerificationUseCaseImpl(sendEmailGateway: sendEmailGateway )
    }
    
}
