//
//  AboutTableViewCell.swift
//  DESAFIO_AULA08_CIDADES
//
//  Created by Aloc FL00030 on 17/03/22.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    static let identifier = "AboutTableViewCell"
    
    @IBOutlet weak var nameLabel : UILabel!

    private var cellData : TeamData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(data: TeamData) {
        cellData = data
        
        if let cellData = cellData {
            nameLabel.text = cellData.name
        }
    }
    
}
