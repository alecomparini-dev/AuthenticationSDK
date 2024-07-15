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
            name: "AuthenticationSDKLocal",
            dependencies: [
                "AuthenticationSDKDomain",
                "AuthenticationSDKController",
            ],
            path: "Sources/Detail/LocalAuthentication"
        ),
    
        .target(
            name: "AuthenticationSDKProviders",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk")
            ],
            path: "Sources/Detail/Providers"
        ),

        .target(
            name: "AuthenticationSDKValidation",
            dependencies: [
                "AuthenticationSDKDomain"
            ],
            path: "Sources/Detail/Validation"
        ),

        

        
        //  MARK: - MAIN LAYER -
        
        .target(
            name: "AuthenticationSDKMain",
            dependencies: [
                "AuthenticationSDKUseCaseGateway",
                "AuthenticationSDKProviders",
                "AuthenticationSDKController",
                "AuthenticationSDKValidation",
            ],
            path: "Sources/Main",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"], .when(configuration: .release))
            ]
        ),
        

        
        //MARK: - TESTE -
        
    ]
)
