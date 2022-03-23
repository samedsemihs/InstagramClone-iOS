//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
    }
    
    private func configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "gear"),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(didTapSettingsGearButton))
    }
    
    @objc func didTapSettingsGearButton(){
        let settingsViewController = SettingsViewController()
        settingsViewController.title = "Settings"
        navigationController?.pushViewController(settingsViewController, animated: true)
        //settingsViewController.modalPresentationStyle = .fullScreen
        //present(settingsViewController, animated: true)
    }
}
