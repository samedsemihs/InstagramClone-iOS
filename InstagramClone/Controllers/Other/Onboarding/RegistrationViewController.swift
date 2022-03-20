//
//  RegistrationViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants {
        static let radiusRatio: Double = 8.0
        static let borderWidth: Double = 0.1
    }

    private let usernameTextField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .next
        field.placeholder = "Username"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
        field.layer.borderWidth = Constants.borderWidth
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let userEmailTextField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .next
        field.placeholder = "Email"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
        field.layer.borderWidth = Constants.borderWidth
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let userPasswordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.returnKeyType = .continue
        field.placeholder = "Password"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
        field.layer.borderWidth = Constants.borderWidth
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign-Up", for: .normal)
        button.layer.cornerRadius = Constants.radiusRatio
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        userEmailTextField.delegate = self
        userPasswordTextField.delegate = self
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //add buttons functionality
        signUpButton.addTarget(self, action: #selector(didTappedRegisterButton), for: .touchUpInside)
        
        //assign frames
        
        usernameTextField.frame = CGRect(
            x: 25,
            y: view.safeAreaInsets.top + 50,
            width: view.width - 50, //centered
            height: 52.0
        )
        
        userEmailTextField.frame = CGRect(
            x: 25,
            y: usernameTextField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        userPasswordTextField.frame = CGRect(
            x: 25,
            y: userEmailTextField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
        
        signUpButton.frame = CGRect(
            x: 25,
            y: userPasswordTextField.bottom + 20,
            width: view.width - 50,
            height: 52.0
        )
    }
    
    private func addSubviews(){
        view.addSubview(usernameTextField)
        view.addSubview(userEmailTextField)
        view.addSubview(userPasswordTextField)
        view.addSubview(signUpButton)
    }
    
    @objc private func didTappedRegisterButton() {
        usernameTextField.resignFirstResponder()
        userEmailTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
        
        guard let userName = usernameTextField.text, !userName.isEmpty,
              let userEmail = userEmailTextField.text, !userEmail.isEmpty,
              let userPassword = userPasswordTextField.text, !userPassword.isEmpty else {
            return
        }
        
        AuthenticationManager.shared.registerUser(username: userName, email: userEmail, password: userPassword) { registered in
            DispatchQueue.main.async {
                if registered {
                    //redirect
                    print("success")
                }else{
                    //register failed show alert
                    print("failed")
                }
            }
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            usernameTextField.becomeFirstResponder()
        }else if textField == userEmailTextField{
            userEmailTextField.becomeFirstResponder()
        } else if textField == userPasswordTextField {
            userPasswordTextField.becomeFirstResponder()
        }else {
            didTappedRegisterButton()
        }
        
        return true
    }
}
