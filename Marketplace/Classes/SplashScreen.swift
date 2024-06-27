//
//  SplashScreen.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 23/04/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var scale = 0.2
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack{
            Color.bgColor
                .ignoresSafeArea()
            VStack {
                VStack {
                    Image(systemName: "logo.xbox")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.white)

                }.scaleEffect(scale)
                    .onAppear{
                        withAnimation(.easeIn(duration: 0.7)) {
                            self.scale = 0.9
                        }
                    }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen(isActive: .constant(false))
}
