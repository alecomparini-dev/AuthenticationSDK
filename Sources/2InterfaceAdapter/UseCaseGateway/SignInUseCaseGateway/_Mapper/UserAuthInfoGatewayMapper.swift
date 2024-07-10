
//  Created by Alessandro Comparini on 09/07/24.
//

import AuthDomain

public struct UserAuthInfoGatewayMapper {
    
    func toUserAuthInfoUseCase(_ dto: UserAuthInfoGatewayDTO) -> UserAuthInfoUseCaseDTO {
        UserAuthInfoUseCaseDTO(userID: dto.userID,
                               email: dto.email,
                               isAnonymous: dto.isAnonymous,
                               isEmailVerified: dto.isEmailVerified,
                               phoneNumber: dto.phoneNumber,
                               displayName: dto.displayName,
                               photoURL: dto.photoURL)
    }
    
    
}

