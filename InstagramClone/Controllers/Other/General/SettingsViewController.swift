//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 10.03.2022.
//

import UIKit

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
        let section = [
            SettingsCellParameters(title: "Log-out"){ [weak self] in
                self?.didTapLogOutButton()
            }
        ]
        
        data.append(section)
    }
    
    private func didTapLogOutButton(){
        AuthenticationManager.shared.logOutUser { success in
            DispatchQueue.main.async {
                if success {
                    let loginViewController = LoginViewController()
                    loginViewController.modalPresentationStyle = .fullScreen
                    self.present(loginViewController, animated: true){
                        self.navigationController?.popToRootViewController(animated: true)
                        self.tabBarController?.selectedIndex = 0
                    }
                }else{
                    //return some error
                }
            }
        }
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
