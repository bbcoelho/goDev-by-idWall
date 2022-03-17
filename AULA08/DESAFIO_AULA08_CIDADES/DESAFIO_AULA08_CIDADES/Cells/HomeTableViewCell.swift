//
//  HomeTableViewCell.swift
//  DESAFIO_AULA08_CIDADES
//
//  Created by SP11601 on 16/03/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    // Conteúdo que a célula comporta, passado durante sua criação
    // Na HomeViewController
    private var cellData : PersonData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    // Configura a célula no momento de sua criação
    // Na HomeViewController
    func configureCell(data: PersonData) {
        cellData = data
        
        if let cellData = cellData {
            cityImageView.image = UIImage(named: cellData.cityImage)
            cityNameLabel.text = cellData.cityName
            personLabel.text = cellData.personName
        }        
    }
    
}
