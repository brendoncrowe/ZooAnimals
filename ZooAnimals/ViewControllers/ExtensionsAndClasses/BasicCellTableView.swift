//
//  TableView.swift
//  ZooAnimals
//
//  Created by Brendon Crowe on 12/21/22.
//

import UIKit

extension BasicCellAnimalController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        let animal = animals[indexPath.row]
        var cellContent = cell.defaultContentConfiguration()
        cellContent.image = UIImage(named: animal.imageNumber.description)
        cellContent.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        cellContent.text = animal.name
        cellContent.secondaryText = animal.origin
        cell.contentConfiguration = cellContent
        return cell
    }
}
