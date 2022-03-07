//
//  LoginViewController.swift
//  FirebaseMVVM
//
//  Created by MacMini on 7.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var activityIndicatorView : UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        indicator.backgroundColor = .clear
        indicator.hidesWhenStopped = true
        indicator.color = .black
        return indicator
    }()
    
    var loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "LOGIN"
        loginViewModel.view = self
        activityIndicatorView.frame = view.bounds
        activityIndicatorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(activityIndicatorView)
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        let mail = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let loginRequestModel = LoginRequestModel(mail: mail, password: password)
        self.activityIndicatorView.startAnimating()
        loginViewModel.connect(with: loginRequestModel)
    }
    
    
    func handleSuccessfulRegister(with response : LoginResponseModel) {
        
        /// user registration is successful showing just alert now for demostration
        
     
        let alert = UIAlertController(title: "SUCCESS", message: "User with id \(response.uid) has been created successfully", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    
    func handleRegisterError(with error : CustomError) {
        
        /// do whatever you want with the error just showing alert for demonstration now
        
        let alert = UIAlertController(title: "ERROR", message:  "\(error.errorString)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    


}
