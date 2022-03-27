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
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}