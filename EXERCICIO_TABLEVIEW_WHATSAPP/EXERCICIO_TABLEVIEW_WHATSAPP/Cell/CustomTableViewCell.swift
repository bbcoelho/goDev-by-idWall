//
//  CustomTableViewCell.swift
//  EXERCICIO_TABLEVIEW_WHATSAPP
//
//  Created by SP11601 on 25/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    lazy var contactImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Brunao")
        image.clipsToBounds = true
        image.layer.cornerRadius = 30        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.contentMode = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Contact Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Bla bla bla bla Bla bla bla blaBla bla bla blaBla bla bla blaBla bla bla blaBla bla bla blaBla bla bla blaBla bla bla blaBla bla bla blaBla bla bla blaBla bla bla bla"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        addSubview(contactImageView)
        
        NSLayoutConstraint.activate([
            contactImageView.heightAnchor.constraint(equalToConstant: 60),
            contactImageView.widthAnchor.constraint(equalToConstant: 60),
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        addSubview(cellStackView)
        
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellStackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 16),
            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
        
        cellStackView.addArrangedSubview(contactLabel)
        cellStackView.addArrangedSubview(messageLabel)
    
    }
    
    func setup(image: String, contact: String, message: String) {
        if let contactImagem = UIImage(named: image) {
            contactImageView.image = contactImagem
        }
        contactLabel.text = contact
        messageLabel.text = message
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
