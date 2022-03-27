//
//  ViewController.swift
//  EXERCICIO_TABLEVIEW_WHATSAPP
//
//  Created by SP11601 on 25/03/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        delegates()
        
        view.backgroundColor = .white
        title = "Chats"
        
        view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = "Teste"
        
        return cell
    }
    
    
}
