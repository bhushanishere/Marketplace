//
//  SignUpView.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 08/05/24.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var phoneNumber: String = ""
    @State private var showAlert = false
//    @State private var hasError = false

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            VStack {
                SignUPTextView()
                TextInputView(email: $email, password: $password, fullName: $fullName, phoneNumber: $phoneNumber)
                SignUpButton(email: email, password: password, createAccount: createAccount)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Sign up Success"), message: Text("you have successfully signed up, please login to access the application."), primaryButton: .default(Text("Okay"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }), secondaryButton: .cancel())
                    }
            }
            .padding()
        }
        .padding()
    }
    
    func createAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
                print("Error creating user: \(error!.localizedDescription)")
                    
                return
            }
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = fullName
            changeRequest.commitChanges { error in
                if let error = error {
                    print("Error getting : \(error.localizedDescription)")
                    return
                }
                
                print("uploaded successfully!!!")
                showAlert = true
            }
            
        }
    }
}

#Preview {
    SignUpView()
}


@ViewBuilder
func SignUPTextView() -> some View {
    Text("Create new account")
        .foregroundStyle(.bg)
        .font(.system(size: 34, weight: .bold, design: .rounded))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 70)
}

@ViewBuilder
func TextInputView(email: Binding<String>, password: Binding<String>, fullName: Binding<String>, phoneNumber: Binding<String>) -> some View  {
    
    TextField("Full Name", text: fullName)
        .foregroundColor(.black)
        .font(.system(size: 18))
        .keyboardType(.default)
        .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 60)))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray)
        }
        .padding(.bottom)
    
    TextField("Phone Number", text: phoneNumber)
        .foregroundColor(.black)
        .font(.system(size: 18))
        .keyboardType(.numberPad)
        .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 60)))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray)
        }
        .padding(.bottom)
    
    TextField("E-mail", text: email)
        .foregroundColor(.black)
        .font(.system(size: 18))
        .keyboardType(.emailAddress)
        .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 60)))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray)
        }
        .padding(.bottom)
    
    SecureField("Password", text: password)
        .font(.system(size: 18))
        .padding(EdgeInsets(NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 60)))
        .overlay {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray)
        }
}

@ViewBuilder
func SignUpButton(email: String, password: String, createAccount: @escaping (String, String) -> Void) -> some View {
    Button(action: {
        createAccount(email, password)
    }, label: {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 320, height: 56)
            .background(.blue)
            .cornerRadius(15)
            .overlay {
                VStack {
                    Text("Sign Up")
                        .bold()
                        .font(.system(size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 40)
    })
}
