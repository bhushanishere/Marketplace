//
//  LoginViewModel.swift
//  Marketplace
//
//  Created by Bhushan Borse DXC on 14/05/24.
//

import Foundation
import Firebase

struct User {
    let uuid: String
    let name: String
    let email: String
    let phone: String
}

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published private var _currentUser : User? = nil
    @Published var hasError = false
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    
    private var handler = Auth.auth().addStateDidChangeListener { _, _ in }
    
    var currentUser: User {
        return _currentUser ?? User(uuid: "", name: "", email: "", phone: "")
    }
    
    init() {
        
        handler = Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                self._currentUser = User(uuid: user.uid, name: user.displayName ?? "", email: user.email!, phone: user.phoneNumber ?? "")
                self.isLoggedIn = true
            } else {
                self._currentUser = nil
                self.isLoggedIn = false
            }
        })
    }
    
    func signIn(completion: @escaping (Error?) -> Void) async {
        DispatchQueue.main.async {
            self.hasError = false
            self.errorMessage = ""
        }

        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            completion(nil)
        } catch {
            DispatchQueue.main.async {
                self.hasError = true
                self.errorMessage = error.localizedDescription
            }
            completion(error)
        }
    }
    
    func signOut() async {
           hasError = false
           do{
               try Auth.auth().signOut()
               
           }catch{
               hasError = true
               errorMessage = error.localizedDescription
           }
           
       }
       
       deinit{
           Auth.auth().removeStateDidChangeListener(handler)
       }
}
