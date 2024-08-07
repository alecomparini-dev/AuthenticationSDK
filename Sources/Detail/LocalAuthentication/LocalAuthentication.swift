//  Created by Alessandro Comparini on 03/11/23.
//

import Foundation

import LocalAuthentication
import AuthenticationSDKUseCaseGateway
import AuthenticationSDKDomain


public class LocalAuthentication  {
    
    private var context: LAContext
    
    public init(context: LAContext = LAContext()) {
        self.context = context
    }
    
}


//  MARK: - EXTENSION - BiometryAuthentication

extension LocalAuthentication: BiometryAuthentication {
    
    public func checkBiometry() -> BiometryAuthenticationGatewayDTO {
        var error: NSError?
        
        var biometryGatewayDTO = BiometryAuthenticationGatewayDTO()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if error != nil { biometryGatewayDTO.biometryTypes = .noneBiometry }
            
            biometryGatewayDTO.biometryTypes = configBiometryTypes()
            
        } else {
            biometryGatewayDTO.biometryTypes = .noneBiometry
        }
        
        return biometryGatewayDTO
    }
    
    public func authenticate(reason: String, cancelTitle: String?) async -> BiometryAuthenticationGatewayDTO {
        var biometryGatewayDTO = BiometryAuthenticationGatewayDTO()
        
        biometryGatewayDTO.isAuthenticated = false
        
        context = LAContext()
        
        do {
            
            if let cancelTitle { context.localizedCancelTitle = cancelTitle }
            
            context.touchIDAuthenticationAllowableReuseDuration = 0
            
            biometryGatewayDTO.isAuthenticated = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            
            biometryGatewayDTO.biometryTypes = configBiometryTypes()
            
        } catch let error  {
            biometryGatewayDTO.biometryCanceled = configBiometryCanceled(error)
        }
        
        return biometryGatewayDTO
    }

    
//  MARK: - PRIVATE AREA
    private func configBiometryCanceled(_ error: Error) -> BiometryCanceled {
        if let laError = error as? LAError {
            switch laError.code {
                case .appCancel:
                    return .appCancel
                case.userCancel:
                    return .userCancel
                case .authenticationFailed:
                    return .others
                case .userFallback:
                    return .others
                case .systemCancel:
                    return .others
                case .passcodeNotSet:
                    return .others
                case .touchIDNotAvailable:
                    return .others
                case .touchIDNotEnrolled:
                    return .others
                case .touchIDLockout:
                    return .others
                case .invalidContext:
                    return .others
                case .notInteractive:
                    return .others
                default:
                    return .others
                }
        }
        return .others
    }
    
    private func configBiometryTypes() -> BiometryTypes {
        switch context.biometryType {
            case .faceID:
                return .faceID
            case .none:
                return .noneBiometry
            case .touchID:
                return .touchID
            case .opticID:
                return .opticID
            @unknown default:
                return .noneBiometry
        }
    }

    
}


