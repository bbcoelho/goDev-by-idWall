//
//  HomeTableViewCell.swift
//  DESAFIO_AULA08_CIDADES
//
//  Created by SP11601 on 16/03/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
}
