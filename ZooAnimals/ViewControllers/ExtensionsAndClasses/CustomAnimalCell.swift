//
//  CustomAnimalCell.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else { fatalError("animal cell could not be dequeued") }
        let animal = animals[indexPath.row]
        cell.configureCell(for: animal)
        return cell
    }
    
}

extension CustomCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
