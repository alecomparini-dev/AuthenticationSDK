// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AuthenticationSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],

    products: [
        .library( name: "AuthenticationSDK", targets: ["AuthenticationSDKMain"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.18.0"))
    ],

    
    targets: [
        
//MARK: - DOMAIN
        .target(
            name: "AuthDomain",
            dependencies: [],
            path: "Sources/1Domain"
        ),
        
        
        
//MARK: - INTERFACE ADAPTER LAYER
        .target(
            name: "AuthUseCaseGateway",
            dependencies: ["AuthDomain"],
            path: "Sources/2InterfaceAdapter/UseCaseGateway"
        ),

        
        .target(
            name: "AuthController",
            dependencies: ["AuthDomain"],
            path: "Sources/2InterfaceAdapter/Controller"
        ),

        
        
//MARK: - DETAIL
        .target(
            name: "AuthProvider",
            dependencies: [
                "AuthUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/AuthenticationProvider"
        ),

        .target(
            name: "AuthLocal",
            dependencies: [
                "AuthUseCaseGateway",
                "AuthDomain"
            ],
            path: "Sources/Detail/LocalAuthentication"
        ),

        
        
//  MARK: - MAIN LAYER
        .target(
            name: "AuthenticationSDKMain",
            dependencies: [
                "AuthController",
                "AuthProvider",
                "AuthLocal"
            ],
            path: "Sources/Main"
        ),
        

        
//MARK: - TESTE
        
    ]
)
