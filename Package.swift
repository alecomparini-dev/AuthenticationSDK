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
        
//MARK: - DOMAIN
        .target(
            name: "AuthDomain",
            dependencies: [],
            path: "Sources/1Domain",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        
        
        
//MARK: - INTERFACE ADAPTER LAYER
        .target(
            name: "AuthUseCaseGateway",
            dependencies: ["AuthDomain"],
            path: "Sources/2InterfaceAdapter/UseCaseGateway",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),

        
        .target(
            name: "AuthController",
            dependencies: ["AuthDomain"],
            path: "Sources/2InterfaceAdapter/Controller",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),

        
        
//MARK: - DETAIL
        .target(
            name: "AuthSignIn",
            dependencies: [
                "AuthValidation",
                "AuthUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SingInProvider",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),

        .target(
            name: "AuthSignUp",
            dependencies: [
                "AuthUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/SignUpProvider",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),

        .target(
            name: "AuthLogout",
            dependencies: [
                "AuthUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/LogoutProvider",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),

        .target(
            name: "AuthUserInfo",
            dependencies: [
                "AuthUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/UserAuthInfoProvider",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        
        .target(
            name: "AuthResetPass",
            dependencies: [
                "AuthUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/ResetPassProvider",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        
        .target(
            name: "AuthValidation",
            dependencies: [ 
                "AuthDomain",
                "AuthUseCaseGateway"
            ],
            path: "Sources/Detail/Validation",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        
        .target(
            name: "AuthLocal",
            dependencies: [
                "AuthUseCaseGateway",
                "AuthDomain"
            ],
            path: "Sources/Detail/LocalAuthentication",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
            
        ),

        
        
//  MARK: - MAIN LAYER
        .target(
            name: "AuthenticationSDKMain",
            dependencies: [
                "AuthUserInfo"
            ],
            path: "Sources/Main",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        

        
//MARK: - TESTE
        
    ]
)
