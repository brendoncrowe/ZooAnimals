//
//  AnimalSectionsViewController.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

class AnimalSectionsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var animalSections = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()

    }
    
    func loadData() {
        animalSections = ZooAnimal.classificationSections()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let animalDetailVC = segue.destination as? AnimalDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { fatalError("failed to get indexPath and AnimalDetailViewController") }
        let animal = animalSections[indexPath.section][indexPath.row]
        animalDetailVC.animal = animal
    }
    
}

extension AnimalSectionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // alternate left and right image cells based on even or odd modulo remainder
        
        var cell: AnimalCell!
        
        if indexPath.section % 2 == 0 { // checking for even
            guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? AnimalCell else { fatalError("couldn't dequeue a rightImageCell ") }
            cell = animalCell
        } else { // checking for odd
            guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? AnimalCell else { fatalError("couldn't dequeue a leftImageCell") }
            cell = animalCell
        }
        // get animal at the indexPath
        let animal = animalSections[indexPath.section][indexPath.row]
        
        // configure the cell using the animal object retrieved above
        cell.configureCell(for: animal)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSections[section].first?.classification
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

