//
//  CustomTableViewCell.swift
//  AULA11_Network
//
//  Created by SP11601 on 21/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(imageURL: String, name: String, company: String) {
        userImage.loadImage(from: imageURL)
        nameLabel.text = name
        companyLabel.text = company
    }

}
