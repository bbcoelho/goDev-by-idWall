//
//  HomeViewController.swift
//  DESAFIO_AULA08_CIDADES
//
//  Created by SP11601 on 16/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    private var personsData: [PersonData] = []
   
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        delegates()
        createData()
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func createData() {
        personsData = [.init(cityImage: "Brasilia", cityName: "Brasilia", personName: "Renato"),
                       .init(cityImage: "Fortaleza", cityName: "Fortaleza", personName: "Bruno Oliveira"),
                       .init(cityImage: "Taquaritinga", cityName: "Taquaritinga", personName: "Alison"),
                       .init(cityImage: "Recife", cityName: "Recife", personName: "Jady"),
                       .init(cityImage: "Varginha", cityName: "Varginha", personName: "Bruno Coelho")]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct PersonData {
    var cityImage: String
    var cityName: String
    var personName: String
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
