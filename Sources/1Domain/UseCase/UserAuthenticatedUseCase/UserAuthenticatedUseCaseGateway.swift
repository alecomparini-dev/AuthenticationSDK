//  Created by Alessandro Comparini on 18/10/23.
//

public protocol UserAuthenticatedUseCaseGateway {
    func getUser(_ refresh: Bool) async -> UserAuthInfoUseCaseDTO?
}
