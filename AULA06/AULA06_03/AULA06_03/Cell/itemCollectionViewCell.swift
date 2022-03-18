//
//  itemCollectionViewCell.swift
//  AULA06_03
//
//  Created by SP11601 on 17/03/22.
//

import UIKit

class itemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    static let identifier = "itemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(image: String, label: String) {
        if let gameImagem = UIImage(named: image) {
            imageLogo.image = gameImagem
        }
        imageLabel.text = label
        
    }
}
