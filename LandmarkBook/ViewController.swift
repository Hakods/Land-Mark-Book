//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ahmet Hakan Altıparmak on 13.08.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()

    var chosenLandMarkName = ""
    var chosenLandMarkImages = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        landMarkNames.append("Pamukkale")
        landMarkNames.append("Efes Antik Kenti")
        landMarkNames.append("İzmir Saat Kulesi")
        landMarkNames.append("Anıtkabir")
        landMarkNames.append("Galata Kulesi")
        
        
        landMarkImages.append(UIImage(named:"pamukkale")!)
        landMarkImages.append(UIImage(named:"efes")!)
        landMarkImages.append(UIImage(named:"saatkulesi")!)
        landMarkImages.append(UIImage(named:"anitkabir")!)
        landMarkImages.append(UIImage(named:"galata")!)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImages = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"
        {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandMarkName
            destinationVC.selectedLandmarkImage = chosenLandMarkImages
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               landMarkNames.remove(at: indexPath.row)
               landMarkImages.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
           }
       }

}

