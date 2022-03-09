//
//  ImageGalleryView.swift
//  ImageGallery
//
//  Created by Cristina Mihaela on 08.03.2022.
//

import UIKit

class ImageGalleryView: UIView {

    

    var backgroundImage: UIImage? {
           didSet {
               setNeedsDisplay()
           }
       }
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }

}
