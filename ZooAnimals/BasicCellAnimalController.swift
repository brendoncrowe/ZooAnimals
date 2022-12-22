//
//  ViewController.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

class BasicCellAnimalController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var animals = [ZooAnimal]() {
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
        animals = ZooAnimal.zooAnimals
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let animalDetailVC = segue.destination as? AnimalDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { fatalError("failed to get indexPath and AnimalDetailViewController") }
        let animal = animals
        animalDetailVC.animal = animal[indexPath.row]
    }
}

extension BasicCellAnimalController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        let animal = animals[indexPath.row]
        var cellContent = cell.defaultContentConfiguration()
        cellContent.image = UIImage(named: animal.imageNumber.description)
        cellContent.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        cellContent.text = animal.name
        cellContent.secondaryText = animal.origin
        cell.contentConfiguration = cellContent
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
