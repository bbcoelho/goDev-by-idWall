//
//  SecondViewController.swift
//  EXERCICIO_TABLEVIEW_WHATSAPP
//
//  Created by SP11601 on 28/03/22.
//

import UIKit

class SecondViewController: UIViewController {

    lazy var whatsappLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wpl")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubview(whatsappLogo)
        
        NSLayoutConstraint.activate([
            whatsappLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whatsappLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            whatsappLogo.heightAnchor.constraint(equalToConstant: 200),
            whatsappLogo.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }

}
