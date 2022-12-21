//
//  ViewController.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

class BasicCellAnimalController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("There are \(ZooAnimal.classificationSections().count) animals classifications")
        dump(ZooAnimal.classificationSections())
        
    }
    

}

