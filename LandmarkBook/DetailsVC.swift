//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Ahmet Hakan Altıparmak on 13.08.2024.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var landMarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landMarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
    

   

}
