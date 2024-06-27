//
//  SignInView.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 06/05/24.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @ObservedObject var vm = LoginViewModel()

    @State var email: String = ""
    @State var password: String = ""
    
   fileprivate func EmailInputView() -> some View {
        TextField("Email ID", text: $vm.email)
            .foregroundColor(.black)
            .font(.system(size: 18))
            .keyboardType(.numberPad)
            .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 60)))
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.gray)
            }
            .padding(.bottom)
    }
    
    fileprivate func PasswordInputView() -> some View {
        SecureField("Password", text: $vm.password)
            .font(.system(size: 18))
            .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 60)))
        
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.gray)
            }
    }
    
    fileprivate func LoginButtonView() -> some View {
        Button(action: {
            Task {
                await vm.signIn { error in
                    guard error == nil else {
                        return
                    }
                    
                    // Login success!
                }
            }
        }, label: {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 320, height: 56)
                .background(Color.bg)
                .cornerRadius(15)
                .overlay {
                    VStack {
                        Text("Log In")
                            .bold()
                            .font(.system(size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
                .padding()
        })
        .alert(isPresented: $vm.hasError) {
            Alert(title: Text("Error!"), message: Text(vm.errorMessage))
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                SignInTextView()
                EmailInputView()
                PasswordInputView()
                LoginButtonView()
                LoginWithView()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    SignInView()
}

@ViewBuilder
func SignInTextView() -> some View {
    Text("Sign In")
        .foregroundStyle(.bg)
        .font(.system(size: 34, weight: .bold, design: .rounded))
    //            .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 70)
        .offset(x: -100)
}

@ViewBuilder
func LoginWithView() -> some View {
    Text("OR")
        .bold()
        .padding()
    
    Button {} label: {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 320, height: 56)
            .background(.blue)
            .cornerRadius(15)
            .overlay {
                VStack {
                    Text("Facebook Login")
                        .bold()
                        .font(.system(size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
            }
            .padding()
    }
    
    Button {} label: {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 320, height: 56)
            .background(Color.black)
            .cornerRadius(15)
            .overlay {
                HStack {
                    
                    Image(systemName: "apple.logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Text("Sign in with Apple")
                        .bold()
                        .font(.system(size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
            }
            .padding()
    }
}
