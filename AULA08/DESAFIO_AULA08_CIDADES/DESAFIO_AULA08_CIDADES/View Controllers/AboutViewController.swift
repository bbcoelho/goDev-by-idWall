//
//  ViewController.swift
//  DESAFIO_AULA08_CIDADES
//
//  Created by SP11601 on 16/03/22.
//

import UIKit

struct TeamData {
    var name : String
}

class AboutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var team : [TeamData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Sobre"
        
        delegates()
        createData()
    }

    @IBAction func openRepository(_ sender: Any) {
        guard let url = URL(string: "https://github.com/bbcoelho/goDev-by-idWall/tree/main/AULA08/DESAFIO_AULA08_CIDADES") else {
            return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func createData() {
        team = [.init(name: "Alison Lima"), .init(name: "Bruno Coelho"), .init(name: "Bruno Oliveira"), .init(name: "Jady Linnit"), .init(name: "Renato Felício")]
    }
}

// MARK: - About Table Functions

extension AboutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.identifier, for: indexPath) as? AboutTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(data: team[indexPath.row])
        
        return cell
    }
}

