//
//  ViewController.swift
//  EXERCICIO_TABLEVIEW_WHATSAPP
//
//  Created by SP11601 on 25/03/22.
//

import UIKit

struct FriendsGrups {
    var image: String
    var name: String
    var message: String
}

class ViewController: UIViewController {
    
    var contacts: [FriendsGrups] = []

    lazy var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let editButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callSecondView))
        
        navigationItem.rightBarButtonItem = editButton
        
    }
    
    @objc func callSecondView() {
        let secondViewController = SecondViewController()
        navigationController?.present(secondViewController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        delegates()
        createContacts()
        
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
    
    private func createContacts() {
        contacts = [FriendsGrups(image: "Brunao", name: "Brunao", message: "Sou eu mesmo! Tentando construir essa replica do whatsapp e evoluir nos meus estudos em Swift nesse maravilhoso bootcamp promovido pela idWall!!! Obrigado por essa oportunidade! Estou muito feliz!! 😃"), FriendsGrups(image: "Coelhos", name: "Coelhos Hawaiianos", message: "Ana, coloca nele a camisetinha no dia 15/04 q vai ser o dia que estaremos reunidos vestindo a nossa também!"), FriendsGrups(image: "Liu", name: "Pai", message: "Aos poucos, sim"), FriendsGrups(image: "Proibidao", name: "Proibidao 2022 - 15/04", message: "Eu geralmente calculo 0,500g de carne por adulto e crianca pequena cada 3 considero 1 adulto"), FriendsGrups(image: "Barsa", name: "Barsa", message: "🕺🕺🕺🕺 fechou entao 🤣"), FriendsGrups(image: "Doug", name: "Doug PROFESSOR", message: "essa aula eu quis trazer um nível de complexidade pq foi pedido na minha avaliação sabe"), FriendsGrups(image: "AnaC", name: "Ana Cristina", message: "Então, isso aqui não rola"), FriendsGrups(image: "Thiago", name: "Thiago", message: "Como chama mesmo o porteiro aqui do condominio que trabalho no supermercado?"),    FriendsGrups(image: "Amigos", name: "Amigos do Liu", message: "achei muito fera tbm"), FriendsGrups(image: "Dimas", name: "Dimas", message: "esse fds tem MotoGP Argentina hein"), FriendsGrups(image: "Filps", name: "Filps", message: "essa achei que ia ficar melhor com tela grande, mas ficou ruim... vou refazer ela"),  FriendsGrups(image: "Millo", name: "Millo", message: "devo ir pra Varginha só na semana santa"),   FriendsGrups(image: "Chicao", name: "Chicão", message: "foi mto boa a competicao... tive um bom resultado"), FriendsGrups(image: "Chu", name: "Chu", message: "aqui ta tudo bem, os meninos estao grandoes")]
    }
 
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let contact = contacts[indexPath.row]
        
        cell.setup(image: contact.image, contact: contact.name, message: contact.message)
        
        return cell
    }
    
}
