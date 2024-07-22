//  Created by Alessandro Comparini on 15/07/24.
//

import AuthenticationSDKUseCaseGateway
import FirebaseAuth

public struct FirebaseErrorToDomainError {
    
    public func mapper(_ error: NSError) -> SetDomainError {
        guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else { return SetDomainError(code: .unknownError()) }
        
        switch errorCode {
            case .invalidCredential:
                return SetDomainError(code: .emailOrPassInvalid)
                
            case .emailAlreadyInUse:
                return SetDomainError(code: .emailAlreadyInUse)
            
            case .invalidEmail:
                return SetDomainError(code: .invalidEmail)
                
            case .invalidRecipientEmail:
                return SetDomainError(code: .invalidEmail)
                
            case .missingEmail:
                return SetDomainError(code: .emailOrPassInvalid)
                
            case .wrongPassword:
                return SetDomainError(code: .emailOrPassInvalid)
            
            case .weakPassword:
                return SetDomainError(code: .weakPassword)

            case .tooManyRequests:
                return SetDomainError(code: .tooManyRequests)
                
            case .userNotFound:
                return SetDomainError(code: .userNotAuthenticated)
                
            case .requiresRecentLogin:
                return SetDomainError(code: .unknownError("requiresRecentLogin"))
                
            case .invalidCustomToken:
                return SetDomainError(code: .unknownError("invalidCustomToken"))
                
            case .customTokenMismatch:
                return SetDomainError(code: .unknownError("customTokenMismatch"))
                
            case .userDisabled:
                return SetDomainError(code: .emailOrPassInvalid)
                
            case .operationNotAllowed:
                return SetDomainError(code: .unknownError("operationNotAllowed"))
                
            case .accountExistsWithDifferentCredential:
                return SetDomainError(code: .unknownError("accountExistsWithDifferentCredential"))
                
            case .providerAlreadyLinked:
                return SetDomainError(code: .unknownError("providerAlreadyLinked"))
                
            case .noSuchProvider:
                return SetDomainError(code: .unknownError("noSuchProvider"))
                
            case .invalidUserToken:
                return SetDomainError(code: .userNotAuthenticated)
                
            case .networkError:
                return SetDomainError(code: .networkError)
                
            case .userTokenExpired:
                return SetDomainError(code: .userNotAuthenticated)
                
            case .invalidAPIKey:
                return SetDomainError(code: .userNotAuthenticated)
                
            case .userMismatch:
                return SetDomainError(code: .unknownError("userMismatch"))
                
            case .credentialAlreadyInUse:
                return SetDomainError(code: .emailAlreadyInUse)
                
            case .appNotAuthorized:
                return SetDomainError(code: .unknownError("appNotAuthorized"))
                
            case .expiredActionCode:
                return SetDomainError(code: .expiredActionCode)
                
            case .invalidActionCode:
                return SetDomainError(code: .unknownError("invalidActionCode"))
                
            case .invalidMessagePayload:
                return SetDomainError(code: .unknownError("invalidMessagePayload"))
                
            case .invalidSender:
                return SetDomainError(code: .unknownError("invalidSender"))
                                
            case .missingIosBundleID:
                return SetDomainError(code: .unknownError("missingIosBundleID"))
                
            case .missingAndroidPackageName:
                return SetDomainError(code: .unknownError("missingAndroidPackageName"))
                
            case .unauthorizedDomain:
                return SetDomainError(code: .unknownError("unauthorizedDomain"))
                
            case .invalidContinueURI:
                return SetDomainError(code: .unknownError("invalidContinueURI"))
                
            case .missingContinueURI:
                return SetDomainError(code: .unknownError("missingContinueURI"))
                
            case .missingPhoneNumber:
                return SetDomainError(code: .unknownError("missingPhoneNumber"))
                
            case .invalidPhoneNumber:
                return SetDomainError(code: .invalidPhoneNumber)
                
            case .missingVerificationCode:
                return SetDomainError(code: .unknownError("missingVerificationCode"))
                
            case .invalidVerificationCode:
                return SetDomainError(code: .invalidVerificationSMSCode)
                
            case .missingVerificationID:
                return SetDomainError(code: .unknownError("missingVerificationID"))
                
            case .invalidVerificationID:
                return SetDomainError(code: .unknownError("invalidVerificationID"))
                
            case .missingAppCredential:
                return SetDomainError(code: .unknownError("missingAppCredential"))
                
            case .invalidAppCredential:
                return SetDomainError(code: .unknownError("invalidAppCredential"))
                
            case .sessionExpired:
                return SetDomainError(code: .userNotAuthenticated)
            
            /** Indicates that the quota of SMS messages for a given project has been exceeded. */
            case .quotaExceeded:
                return SetDomainError(code: .unknownError("quotaExceeded"))
                
            case .missingAppToken:
                return SetDomainError(code: .unknownError("missingAppToken"))
                
            case .notificationNotForwarded:
                return SetDomainError(code: .unknownError("notificationNotForwarded"))
                
            case .appNotVerified:
                return SetDomainError(code: .unknownError("appNotVerified"))
                
            case .captchaCheckFailed:
                return SetDomainError(code: .unknownError("captchaCheckFailed"))
                
            case .webContextAlreadyPresented:
                return SetDomainError(code: .unknownError("webContextAlreadyPresented"))
                
            case .webContextCancelled:
                return SetDomainError(code: .unknownError("webContextCancelled"))
                
            case .appVerificationUserInteractionFailure:
                return SetDomainError(code: .unknownError("appVerificationUserInteractionFailure"))
                
            case .invalidClientID:
                return SetDomainError(code: .unknownError("invalidClientID"))
                
            case .webNetworkRequestFailed:
                return SetDomainError(code: .unknownError("webNetworkRequestFailed"))
                
            case .webInternalError:
                return SetDomainError(code: .unknownError("webInternalError"))
                
            case .webSignInUserInteractionFailure:
                return SetDomainError(code: .unknownError("webSignInUserInteractionFailure"))
                
            case .localPlayerNotAuthenticated:
                return SetDomainError(code: .unknownError("localPlayerNotAuthenticated"))
                
            case .nullUser:
                return SetDomainError(code: .userNotAuthenticated)
                
            case .dynamicLinkNotActivated:
                return SetDomainError(code: .unknownError("dynamicLinkNotActivated"))
                
            case .invalidProviderID:
                return SetDomainError(code: .unknownError("invalidProviderID"))
                
            case .tenantIDMismatch:
                return SetDomainError(code: .unknownError("tenantIDMismatch"))
                
            case .unsupportedTenantOperation:
                return SetDomainError(code: .unknownError("unsupportedTenantOperation"))
                
            case .invalidDynamicLinkDomain:
                return SetDomainError(code: .unknownError("invalidDynamicLinkDomain"))
                
            case .rejectedCredential:
                return SetDomainError(code: .userNotAuthenticated)
                
            case .gameKitNotLinked:
                return SetDomainError(code: .unknownError("gameKitNotLinked"))
                
            case .secondFactorRequired:
                return SetDomainError(code: .unknownError("secondFactorRequired"))
                
            case .missingMultiFactorSession:
                return SetDomainError(code: .unknownError("missingMultiFactorSession"))
                
            case .missingMultiFactorInfo:
                return SetDomainError(code: .unknownError("missingMultiFactorInfo"))
                
            case .invalidMultiFactorSession:
                return SetDomainError(code: .unknownError("invalidMultiFactorSession"))
                
            case .multiFactorInfoNotFound:
                return SetDomainError(code: .unknownError("multiFactorInfoNotFound"))
                
            case .adminRestrictedOperation:
                return SetDomainError(code: .unknownError("adminRestrictedOperation"))
                
            case .unverifiedEmail:
                return SetDomainError(code: .unverifiedEmail)
                
            case .secondFactorAlreadyEnrolled:
                return SetDomainError(code: .unknownError("secondFactorAlreadyEnrolled"))
                
            case .maximumSecondFactorCountExceeded:
                return SetDomainError(code: .unknownError("maximumSecondFactorCountExceeded"))
                
            case .unsupportedFirstFactor:
                return SetDomainError(code: .unknownError("unsupportedFirstFactor"))
                
            case .emailChangeNeedsVerification:
                return SetDomainError(code: .unknownError("emailChangeNeedsVerification"))
                
            case .missingClientIdentifier:
                return SetDomainError(code: .unknownError("missingClientIdentifier"))
                
            case .missingOrInvalidNonce:
                return SetDomainError(code: .unknownError("missingOrInvalidNonce"))
                
            case .blockingCloudFunctionError:
                return SetDomainError(code: .unknownError("blockingCloudFunctionError"))
                
            case .recaptchaNotEnabled:
                return SetDomainError(code: .unknownError("recaptchaNotEnabled"))
                
            case .missingRecaptchaToken:
                return SetDomainError(code: .unknownError("missingRecaptchaToken"))
                
            case .invalidRecaptchaToken:
                return SetDomainError(code: .unknownError("invalidRecaptchaToken"))
                
            case .invalidRecaptchaAction:
                return SetDomainError(code: .unknownError("invalidRecaptchaAction"))
                
            case .missingClientType:
                return SetDomainError(code: .unknownError("missingClientType"))
                
            case .missingRecaptchaVersion:
                return SetDomainError(code: .unknownError("missingRecaptchaVersion"))
                
            case .invalidRecaptchaVersion:
                return SetDomainError(code: .unknownError("invalidRecaptchaVersion"))
                
            case .invalidReqType:
                return SetDomainError(code: .unknownError("invalidReqType"))
                
            case .recaptchaSDKNotLinked:
                return SetDomainError(code: .unknownError("recaptchaSDKNotLinked"))
                
            case .keychainError:
                return SetDomainError(code: .unknownError("keychainError"))
                
            case .internalError:
                return SetDomainError(code: .internalError)
                
            case .malformedJWT:
                return SetDomainError(code: .unknownError("malformedJWT"))
                
            @unknown default:
                return SetDomainError(code: .unknownError(error.localizedDescription))
                
        }

    }
    
}

   
