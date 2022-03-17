//
//  CustomCollectionViewCell.swift
//  Aula 06
//
//  Created by Aloc FL00030 on 14/03/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    static let identifier = "CustomCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var imageBlock: UIImageView!
    @IBOutlet weak var labelBlock: UILabel!
    
    func setup(imageSource: String, name: String) {
        if let image = UIImage(named: imageSource) {
            imageBlock.image = image
        }
        labelBlock.text = name
    }
}
