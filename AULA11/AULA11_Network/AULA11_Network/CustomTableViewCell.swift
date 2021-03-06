//
//  CustomTableViewCell.swift
//  AULA11_Network
//
//  Created by SP11601 on 21/03/22.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
    }

    func setup(imageURL: String, name: String, company: String) {
        
        // userImage.loadImage(from: imageURL)
        
        let url = URL(string: imageURL)
        
        userImage.kf.setImage(with: url)
        nameLabel.text = name
        companyLabel.text = company
    }

}
