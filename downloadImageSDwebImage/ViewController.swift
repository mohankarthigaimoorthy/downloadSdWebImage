//
//  ViewController.swift
//  downloadImageSDwebImage
//
//  Created by Mohan K on 14/02/23.
//

import UIKit
//import SideMenu
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var viewImg: UIImageView!
//
//    var sideMenuNC: SideMenuNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func sideMenuConfig() {
        
    }
    @IBAction func downloadTapped(_ sender: Any) {
        self.downloadImageFromURL()
    }
    
}

//extension ViewController: LeftMenuSelectionDelegate
//{
//
//}

extension ViewController {
    func downloadImageFromURL() {
        guard let imageUrl = urlTextField.text else {
            return
        }
        print (imageUrl)
        
        self.viewImg.load(imageFrom: imageUrl.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}

extension UIImageView {
    func load(imageFrom imageUrl: String, localImage: String = "emptyimg") {
        let emptyimg = UIImage(named: localImage)
        
        guard let imageURL = URL(string: imageUrl) else {
            self.image = emptyimg
return
        }
        sd_setImage(with: imageURL) {
            (downloadedImage, error, cacheType, url)
            in
            self.image = downloadedImage
        }
    }
}
