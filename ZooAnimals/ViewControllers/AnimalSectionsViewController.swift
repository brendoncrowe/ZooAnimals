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
    
}

extension AnimalSectionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else { fatalError("Could not dequeue animal cell")}
        let animal = animalSections[indexPath.section][indexPath.row]
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

