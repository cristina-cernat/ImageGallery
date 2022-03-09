//
//  CollectionViewCell.swift
//  ImageGallery
//
//  Created by Cristina Mihaela on 09.03.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!

    static let identifier = "CollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with image: UIImage) {
        imageView.image = image
    }

    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
