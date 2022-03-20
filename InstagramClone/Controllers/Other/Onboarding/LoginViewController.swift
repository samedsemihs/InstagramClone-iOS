//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        static let radiusRatio: CGFloat = 8.0
    }
    
    private let usernameEmailTextField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .next
        field.placeholder = "Enter your username or email address"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let userPasswordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.returnKeyType = .continue
        field.placeholder = "Enter your Password"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = Constants.radiusRatio
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms for Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        header.addSubview(UIImageView(image: UIImage(named: "instagram-gradient")))
        return header
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameEmailTextField.delegate = self
        userPasswordTextField.delegate = self
        
        loginButton.addTarget(self, action: #selector(didTappedLoginButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTappedRegisterButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTappedTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTappedPrivacyButton), for: .touchUpInside)
        
        addSubviews()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        headerView.frame = CGRect(
            x: 0,
            y: 0, //view.safeAreaInsets.top,
            width: view.width,
            height: view.height / 3.0
        )
        
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 50, //view.safeAreaInsets.top,
            width: view.width - 50, //centered
            height: 52.0
        )
        
        userPasswordTextField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10, //view.safeAreaInsets.top,
            width: view.width - 50, //centered
            height: 52.0
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: userPasswordTextField.bottom + 10, //view.safeAreaInsets.top,
            width: view.width - 50, //centered
            height: 52.0
        )
        
        registerButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 30, //view.safeAreaInsets.top,
            width: view.width - 50, //centered
            height: 52.0
        )
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 50
        )
        
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-50,
            width: view.width-20,
            height: 50
        )
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // define app logo inside the header
        let appLogo = UIImageView(image: UIImage(named: "instagram-logo-white"))
        appLogo.contentMode = .scaleAspectFit
        appLogo.frame = CGRect(
            x: headerView.width / 4.0,
            y: view.safeAreaInsets.top,
            width: headerView.width / 2,
            height: headerView.height - view.safeAreaInsets.top
        )
        
        headerView.addSubview(appLogo)
    }
    
    private func addSubviews(){
        view.addSubview(usernameEmailTextField)
        view.addSubview(userPasswordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(headerView)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
    }

    
    @objc private func didTappedLoginButton(){
        userPasswordTextField.resignFirstResponder()
        usernameEmailTextField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let userPassword = userPasswordTextField.text, !userPassword.isEmpty, userPassword.count >= 8 else {
                  return
              }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@") && usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        
        //login
        AuthenticationManager.shared.loginUser(username: username, email: email, password: userPassword) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(
                        title: "Log-in Error",
                        message: "We cannot found your account.",
                        preferredStyle: .alert
                    )
                    
                    alert.addAction(
                        UIAlertAction(title: "Dismiss",
                                      style: .cancel,
                                      handler: nil)
                    )
                    
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @objc private func didTappedRegisterButton(){
        let registerVC = RegistrationViewController()
        registerVC.title = "Create Account"
        
        present(UINavigationController(rootViewController: registerVC), animated: true)
    }
    
    @objc private func didTappedTermsButton(){
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true)
    }
    
    @objc private func  didTappedPrivacyButton(){
        guard let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0") else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailTextField {
            userPasswordTextField.becomeFirstResponder()
        }else if textField == userPasswordTextField {
            didTappedLoginButton()
        }
        
        return true
    }
}

