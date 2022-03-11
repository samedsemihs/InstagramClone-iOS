//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let radiusRatio: CGFloat = 8.0
    }
    
    private let usernameEmailTextField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .next
        field.placeholder = "Enter Username or Email Address"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
        return UITextField()
    }()
    
    private let userPasswordTextField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.returnKeyType = .next
        field.placeholder = "Enter Password"
        field.adjustsFontSizeToFitWidth = true
        field.autocapitalizationType = .none
        field.clearButtonMode = .whileEditing
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.layer.masksToBounds = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = Constants.radiusRatio
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
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        header.addSubview(UIImageView(image: UIImage(named: "instagram-gradient")))
        return header
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
    }
    
    @objc private func didTappedRegisterButton(){
        
    }
    
    @objc private func didTappedTermsButton(){
        
    }
    
    @objc private func  didTappedPrivacyButton(){
        
    }
    
    
}

