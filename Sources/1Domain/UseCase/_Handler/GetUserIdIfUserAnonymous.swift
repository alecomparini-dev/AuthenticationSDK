//  Created by Alessandro Comparini on 17/07/24.
//

typealias UserID = String

func getUserIdIfUserAnonymous(_ userAuth: UserAuthInfoUseCaseDTO?) -> UserID? {

    guard let userAuth else { return nil }
    
    if let isAnonymous = userAuth.isAnonymous, isAnonymous {
        return userAuth.userID
    }
    
    return nil
}
