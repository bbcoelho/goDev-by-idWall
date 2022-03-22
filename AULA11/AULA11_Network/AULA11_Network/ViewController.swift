//
//  ViewController.swift
//  AULA11_Network
//
//  Created by SP11601 on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "BRUTAL TECHNOLOGY GUYS"
        
        delegates()
        getUsers()
        
    }
    
    private func delegates() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    private func getUsers() {
        
        Service.shared.getUsers { result in
            
            switch result {
            case .success(let res):
                self.users = res
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let user = users[indexPath.row]
        
        cell.setup(imageURL: user.photo, name: user.name, company: user.company.name)
        
        return cell
    }
    
/*
  
 extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return games.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
         else { return UITableViewCell() }
         
         let game = games[indexPath.row]
         
         cell.setup(logo: game.logo, name: game.name, description: game.description)
         
         return cell
         
     }

    
*/
    
}
