//
//  LoginViewModel.swift
//  FirebaseMVVM
//
//  Created by MacMini on 7.03.2022.
//

import UIKit

import FirebaseAuth




class LoginViewModel : ViewModel {
    
    
    
    
    
  
    typealias View = LoginViewController

    /**
     for 'LoginViewModel'  'RequestModel' is 'LoginRequestModel'
     */
    typealias RequestModel = LoginRequestModel
    
    /**
     for 'LoginViewModel'  'RequestModel' is 'LoginResponseModel' it has just a uid property  at the moment just for demonstration
     */
    typealias ResponseModel = LoginResponseModel
    
  /// connect function receives the request and returns a completion handler whether success of failure, this function can connect to firebase or any other custom server
    
    var view: LoginViewController?
   
    func connect(with model: LoginRequestModel) {
        
        if model.password.isEmpty || model.mail.isEmpty {
            
            view?.handleRegisterError(with: CustomError(errorString: "Please fill all empty fields"))
            
            return
        }
        
        Auth.auth().signIn(withEmail: model.mail, password: model.password) {[weak self] result, error in
            if let error = error {
                self?.view?.handleRegisterError(with: CustomError(errorString: error.localizedDescription))
                return
            }
            
            let uid = result?.user.uid ?? ""
            let response = LoginResponseModel(uid: uid)
            
            self?.view?.handleSuccessfulRegister(with: response)
           
        }
    }
  
    
}
