//  Created by Alessandro Comparini on 17/11/23.
//

import AuthDomain
import AuthProvider
import AuthUseCaseGateway
import AuthLocal

public extension AuthSDKMain {

    func checkBiometry() -> CheckBiometryUseCaseDTO {
        
        let biometryCheckAuthentication = LocalAuthentication()
        
        let checkBiometryGateway = CheckBiometryUseCaseGatewayImpl(biometryAuthentication: biometryCheckAuthentication)
        
        let checkBiometryUseCase = CheckBiometryUseCaseImpl(checkBiometryGateway: checkBiometryGateway)
        
        return checkBiometryUseCase.check()
    }
    
}
