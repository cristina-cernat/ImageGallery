//
//  ImageGalleryViewController.swift
//  ImageGallery
//
//  Created by Cristina Mihaela on 08.03.2022.
//

import UIKit

class ImageGalleryViewController: UIViewController, UIDropInteractionDelegate {



    @IBOutlet weak var dropZone: UIView! {
        didSet {
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
    }

    
    @IBOutlet weak var imageGalleryView: ImageGalleryView!


    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }

    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy) // copy from outside
    }

    var imageFetcher: ImageFetcher!

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher() { (url, image) in
            DispatchQueue.main.async {
                self.imageGalleryView.backgroundImage = image
            }
        }
        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = nsurls.first as? URL {
                self.imageFetcher.fetch(url)
            }

        }

        session.loadObjects(ofClass: UIImage.self) { images in
            if let image = images.first as? UIImage {
                self.imageFetcher.backup = image
            }

        }
    }
}
