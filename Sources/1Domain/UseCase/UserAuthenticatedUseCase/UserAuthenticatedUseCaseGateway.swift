//  Created by Alessandro Comparini on 18/10/23.
//

public protocol UserAuthenticatedUseCaseGateway {
    func getUser() async -> UserAuthInfoUseCaseDTO?
}
