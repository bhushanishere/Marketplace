//
//  ContentView.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSplash: Bool = false
    
    var body: some View {
        ZStack {
            if self.showSplash {
                OnboardingView()
            } else {
                SplashScreen(isActive: $showSplash)
            }
        }
    }
}

#Preview {
    ContentView()
}
