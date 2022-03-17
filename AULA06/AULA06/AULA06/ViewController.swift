//
//  ViewController.swift
//  AULA06
//
//  Created by SP11601 on 16/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gamesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Teste \(indexPath.row)")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        
        cell.textLabel?.text = "Zelda"
        cell.detailTextLabel?.text = "The Legend of Zelda: A Link to the Past, também conhecido como Zelda no Densetsu: Kamigami no Triforce no Japão, é um jogo eletrônico de ação-aventura desenvolvido e publicado pela Nintendo para o Super Nintendo Entertainment System."
        
        cell.imageView?.image = UIImage(systemName: "gamecontroller")
        cell.imageView?.tintColor = .purple
        
        return cell
    }
    

}
