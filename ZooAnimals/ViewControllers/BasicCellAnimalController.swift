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
        title = "Zoo Animals"
        loadData()
    }
    
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }
}

