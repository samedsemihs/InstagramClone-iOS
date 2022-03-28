//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit
import SafariServices

struct SettingsCellParameters {
    let title: String
    let handler: (() -> Void)
}

/// ViewController for manage user settings.
class SettingsViewController: UIViewController {
    
    private var data = [[SettingsCellParameters]]()
    
    //define the table view
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        configureSections()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureSections() {
        //Define sections of settings view
        
        //Personal settings
        data.append([
            SettingsCellParameters(title: "Edit Profile"){ [weak self] in
                self?.didTapEditProfile()
            },
            SettingsCellParameters(title: "Invite Friends"){ [weak self] in
                self?.didTapInviteFriends()
            },
            SettingsCellParameters(title: "Save Original Posts"){ [weak self] in
                self?.didTapSavePosts()
            }
        ])
        
        //Terms
        data.append([
            SettingsCellParameters(title: "Terms of Service"){ [weak self] in
                self?.didTapTermsOfService(termType: .service)
            },
            SettingsCellParameters(title: "Privacy Policy"){ [weak self] in
                self?.didTapTermsOfService(termType: .privacy)
            },
            SettingsCellParameters(title: "Help / Feedback"){ [weak self] in
                self?.didTapTermsOfService(termType: .help)
            }
        
        ])
        
        //log out
        data.append([
            SettingsCellParameters(title: "Log-out"){ [weak self] in
                self?.didTapLogOutButton()
            }
        ])
    }
    
    enum TermsTypes {
    case service, privacy, help
    }
    
    private func didTapEditProfile() {
        
    }
    
    private func didTapInviteFriends() {
        
    }
    
    private func didTapSavePosts() {
        
    }
    
    private func didTapTermsOfService(termType: TermsTypes) {
        let urlString: String
        
        switch termType {
        case .service:
            urlString = "https://help.instagram.com/581066165581870"
        case .privacy:
            urlString = "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0"
        case .help:
            urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else { return }
        
        present(SFSafariViewController(url: url), animated: true)
        
        
    }
    
    private func didTapLogOutButton() {
        //Give options for user to select those
        let actionSheet = UIAlertController(title: "Log Out", message: "Do you want to Log Out ?", preferredStyle: .actionSheet)
        
        //When says OK
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            DispatchQueue.main.async {
                AuthenticationManager.shared.logOutUser { success in
                    if success {
                        let loginView = LoginViewController()
                        loginView.modalPresentationStyle = .fullScreen
                        self.present(loginView, animated: true){
                            self.navigationController?.popToRootViewController(animated: true)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }else{
                        print("Error")
                    }
                }
            }
        }))
        
        //Cancel
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        //Show alert
        present(actionSheet, animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Define number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    //Define number of rows for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    //Provide a cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    
    //Handle cell selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
    
}
