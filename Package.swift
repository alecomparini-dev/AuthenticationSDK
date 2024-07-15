// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AuthenticationSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],

    products: [
        .library( name: "AuthenticationSDK", targets: ["AuthenticationSDKMain"])
    ],
    
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.28.0"))
    ],

    
    
    targets: [
        
//MARK: - DOMAIN -
        
        .target(
            name: "AuthenticationSDKDomain",
            dependencies: [],
            path: "Sources/1Domain"
        ),
        
        
        
//MARK: - INTERFACE ADAPTER LAYER -
        
        .target(
            name: "AuthenticationSDKUseCaseGateway",
            dependencies: [
                "AuthenticationSDKDomain"
            ],
            path: "Sources/2InterfaceAdapter/UseCaseGateway"
        ),

        .target(
            name: "AuthenticationSDKController",
            dependencies: [
                "AuthenticationSDKDomain"
            ],
            path: "Sources/2InterfaceAdapter/Controller"
        ),

        
        
//MARK: - DETAIL -
        
        .target(
            name: "AuthenticationSDKSignInProvider",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                "AuthenticationSDKErrorProvider",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SignInProvider"
        ),

        .target(
            name: "AuthenticationSDKSignUpProvider",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                "AuthenticationSDKErrorProvider",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SignUpProvider"
        ),

        .target(
            name: "AuthenticationSDKLogoutProvider",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/LogoutProvider"
        ),

        .target(
            name: "AuthenticationSDKUserAuthInfoProvider",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/UserAuthInfoProvider"
        ),
        
        .target(
            name: "AuthenticationSDKResetPassProvider",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/ResetPassProvider"
        ),
        
        .target(
            name: "AuthenticationSDKSendEmailVerificationProvider",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                "AuthenticationSDKErrorProvider",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SendEmailVerificationProvider"
        ),
        
        .target(
            name: "AuthenticationSDKValidation",
            dependencies: [
                "AuthenticationSDKDomain"
            ],
            path: "Sources/Detail/Validation"
        ),
        
        .target(
            name: "AuthenticationSDKLocal",
            dependencies: [
                "AuthenticationSDKDomain",
                "AuthenticationSDKController",
            ],
            path: "Sources/Detail/LocalAuthentication"
        ),
    
        .target(
            name: "AuthenticationSDKErrorProvider",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/_ErrorProvider"
        ),

        
        
//  MARK: - MAIN LAYER -
        
        .target(
            name: "AuthenticationSDKMain",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                "AuthenticationSDKSignInProvider",
                "AuthenticationSDKSignUpProvider",
                "AuthenticationSDKController",
                "AuthenticationSDKValidation",
            ],
            path: "Sources/Main",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        

        
//MARK: - TESTE
        
    ]
)
