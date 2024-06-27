//
//  WelcomeSwiftUI.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 30/04/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var path = NavigationPath()
    
    @State private var isShowingDetail = false

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    Image(systemName: "logo.xbox")
                        .resizable()
                        .foregroundStyle(Color.bg)
                        .frame(width: 150, height: 150)
                    Text("Welcome to Marketplace!")
                        .bold()
                        .font(.system(size: 26))
                        .foregroundStyle(Color.bg)
                        .padding()
                    Text("Browse and Post Anythings")
                        .foregroundStyle(.gray)
                    
                    VStack(){
                        
                        NavigationLink(destination: SignInView()) {
                            Rectangle()
                                .background(Color.bg)
                                .foregroundColor(.clear)
                                .frame(width: 300, height: 56)
                                .cornerRadius(.infinity)
                                .overlay {
                                    VStack {
                                        Text("Log In")
                                            .bold()
                                            .font(.system(size: 20))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                    }
                                }
                        }
                
                        NavigationLink(destination: SignUpView(),isActive: $isShowingDetail) {
                            Text("Sign Up")
                                .bold()
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .frame(width: 300, height: 56)
                                .multilineTextAlignment(.center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: .infinity)
                                        .stroke(Color.gray, lineWidth: 2)
                                )
                        }
                        .background(.clear)
                        .cornerRadius(.infinity)
                        .padding()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
