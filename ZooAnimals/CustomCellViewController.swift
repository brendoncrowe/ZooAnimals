//
//  CustomCellViewController.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

class CustomCellViewController: UIViewController {
    
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

extension CustomCellViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else { fatalError("animal cell could not be dequeued") }
        let animal = animals[indexPath.row]
        cell.configureCell(for: animal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
