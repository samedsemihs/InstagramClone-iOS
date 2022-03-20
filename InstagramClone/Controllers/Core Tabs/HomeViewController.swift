//
//  ViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //Sign-out the user
        do{
            try Auth.auth().signOut()
        }catch{
            print("error")
        }
        
        userSessionControlHandler()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func userSessionControlHandler() {
        //check if user authenticated
        if Auth.auth().currentUser == nil {
            //if not, show login screen
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
        }
    }

}

