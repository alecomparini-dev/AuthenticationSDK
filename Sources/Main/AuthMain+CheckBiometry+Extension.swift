//  Created by Alessandro Comparini on 17/11/23.
//

import AuthDomain
import AuthSignIn
import AuthUseCaseGateway
import AuthLocal

public extension AuthenticationMain {

    func checkBiometry() -> CheckBiometryUseCaseDTO {
        
        let biometryCheckAuthentication = LocalAuthentication()
        
        let checkBiometryGateway = CheckBiometryUseCaseGatewayImpl(biometryAuthentication: biometryCheckAuthentication)
        
        let checkBiometryUseCase = CheckBiometryUseCaseImpl(checkBiometryGateway: checkBiometryGateway)
        
        return checkBiometryUseCase.check()
    }
    
}
