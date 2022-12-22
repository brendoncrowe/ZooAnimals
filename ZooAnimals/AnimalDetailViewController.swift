//
//  AnimalDetailViewController.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/22/22.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalClassificationLabel: UILabel!
    @IBOutlet weak var animalOriginLabel: UILabel!
    @IBOutlet weak var animalInfo: UITextView!
    
    var animal: ZooAnimal?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let zooAnimal = animal else { fatalError("couldn't set animal object, check prepare for segue")}
        navigationItem.title = animal?.name
        animalImageView.image = UIImage(named: zooAnimal.imageNumber.description)
        animalClassificationLabel.text = zooAnimal.classification
        animalOriginLabel.text = zooAnimal.origin
        animalInfo.text = zooAnimal.info
    }
    
}
