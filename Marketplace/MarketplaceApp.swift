//
//  MarketplaceApp.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 23/04/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    FirebaseApp.configure()
    return true
  }
}

@main
struct MarketplaceApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

//    init() {
//        FirebaseApp.initialize()
//    }


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
