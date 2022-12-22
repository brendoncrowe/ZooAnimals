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
        didSet{
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
    


}
