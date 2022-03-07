//
//  RegisterViewModel.swift
//  FirebaseMVVM
//
//  Created by MacMini on 7.03.2022.
//

import Foundation
import FirebaseAuth



class RegisterViewModel : ViewModel {
    
    
   
    
    typealias View = ViewController
    
  
    
     
    
   
    
    typealias RequestModel = RegisterRequestModel
    
    typealias ResponseModel = RegisterResponseModel
    
    var view: ViewController?
    
    func connect(with model: RegisterRequestModel) {
        
        if model.password.isEmpty || model.mail.isEmpty {
            view?.handleRegisterError(with: CustomError(errorString: "Please fill all empty fields"))
          
            return
        }
        
        Auth.auth().createUser(withEmail: model.mail, password: model.password) {[weak self] result, error in
            if let error = error {
                self?.view?.handleRegisterError(with: CustomError(errorString: error.localizedDescription))
              
                return
            }
            
            let uid = result?.user.uid ?? ""
            let response = RegisterResponseModel(uid: uid)
            
            self?.view?.handleSuccessfulRegister(with: response)
         
            
        }
        
    
    }
    
    
    
}
