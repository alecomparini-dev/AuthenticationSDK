//  Created by Alessandro Comparini on 15/09/23.
//


public class SignUpUseCaseImpl: SignUpUseCase {
    
    private let sendEmail: SendEmailVerificationUseCase
    private let signUpGateway: SignUpUseCaseGateway
    
    public init(sendEmail: SendEmailVerificationUseCase, signUpGateway: SignUpUseCaseGateway) {
        self.sendEmail = sendEmail
        self.signUpGateway = signUpGateway
    }
    
    
//  MARK: - PUBLIC AREA
    
    public func signUp(email: String, pass: String) async throws -> UserAuthInfoUseCaseDTO {
        
        let userAuth = try await signUpGateway.signUp(email: email, pass: pass)
        
        try await sendEmail.sendEmail(email)
        
        return userAuth
    }    
        
}
