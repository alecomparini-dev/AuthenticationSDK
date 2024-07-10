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
            name: "AuthDomain",
            dependencies: [],
            path: "Sources/1Domain",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        
        
        
//MARK: - INTERFACE ADAPTER LAYER -
        
        .target(
            name: "AuthUseCaseGateway",
            dependencies: [
                "AuthDomain"
            ],
            path: "Sources/2InterfaceAdapter/UseCaseGateway"
        ),

        .target(
            name: "AuthController",
            dependencies: [
                "AuthDomain"
            ],
            path: "Sources/2InterfaceAdapter/Controller"
        ),

        
        
//MARK: - DETAIL -
        
        .target(
            name: "AuthSignIn",
            dependencies: [
                "AuthController",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SingInProvider"
        ),

        .target(
            name: "AuthSignUp",
            dependencies: [
                "AuthController",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SignUpProvider"
        ),

        .target(
            name: "AuthLogout",
            dependencies: [
                "AuthController",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/LogoutProvider"
        ),

        .target(
            name: "AuthUserInfo",
            dependencies: [
                "AuthController",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/UserAuthInfoProvider"
        ),
        
        .target(
            name: "AuthResetPass",
            dependencies: [
                "AuthController",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/ResetPassProvider"
        ),
        
        .target(
            name: "AuthValidation",
            dependencies: [ 
                "AuthDomain",
                "AuthController"
            ],
            path: "Sources/Detail/Validation"
        ),
        
        .target(
            name: "AuthLocal",
            dependencies: [
                "AuthDomain",
                "AuthController",
            ],
            path: "Sources/Detail/LocalAuthentication"
            
        ),

        
        
//  MARK: - MAIN LAYER -
        
        .target(
            name: "AuthenticationSDKMain",
            dependencies: [
                "AuthUseCaseGateway",
                "AuthSignIn",
                "AuthValidation",
            ],
            path: "Sources/Main",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        

        
//MARK: - TESTE
        
    ]
)
