//
//  AnimalCell.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalOriginLabel: UILabel!
    @IBOutlet weak var animalClassification: UILabel!
    
    func configureCell(for animal: ZooAnimal) {
        animalImageView.image = UIImage(named: animal.imageNumber.description)
        animalNameLabel.text = animal.name
        animalOriginLabel.text = animal.origin
        animalClassification.text = animal.classification
    }
    
    
}
