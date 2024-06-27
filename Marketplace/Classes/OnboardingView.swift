//
//  OnboardingView.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 23/04/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.bgColor.ignoresSafeArea()
                LazyHStack {
                    PageView()
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}

struct PageView: View {
    
    @State private var onboardingData = SlidingData.perview()

    var body: some View {
        TabView {
            ForEach(Array(onboardingData.enumerated()), id: \.1) { index, item in
                ZStack{
                    VStack {
                        CardView(item: item)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                if (index + 1 == onboardingData.count) {
                    VStack{
                        LastCardView()
                    }
                }
            }
            
            .padding(.all, 5)
        }
        .frame(width: UIScreen.main.bounds.width, height: 400)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CardView: View {
        
    var item: SlidingData
    
    var body: some View {
        Image(systemName: item.icon)
            .resizable()
            .foregroundStyle(.white)
            .frame(width: 120, height: 120)
        Text(item.title).foregroundColor(.white)
            .font(.system(size: 22))
            .bold()
            .multilineTextAlignment(.center)
            .padding()
        Text(item.description).foregroundStyle(.white)
            .font(.system(size: 18))
            .bold()
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct LastCardView: View {
    @State private var isShowingWelcomeView = false

    var body: some View {
        NavigationLink(
            destination: WelcomeView()
                .toolbar(.hidden, for: .navigationBar),
            isActive: $isShowingWelcomeView,
            label: {
                VStack {
                    Text("Let's Get Started")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .overlay {
                            Image(systemName: "arrow.forward")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.bg)
                        }
                }
            }
        )
        .onTapGesture {
            isShowingWelcomeView = true
        }
    }
}
