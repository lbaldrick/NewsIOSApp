//
//  SourceTableViewController.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 09/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation
import UIKit

class SourceTableViewController: UITableViewController {
    
    let modelController: SourceModelController
    
    var sources: [Source]?
    
    var selectedSources: [String]?
    
    required init?(coder aDecoder: NSCoder) {
        modelController = SourceModelController()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelController.getSources(completionHandler: { () in
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelController.sources?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SourceTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SourceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SourceTableViewCell.")
        }
        
        // Fetches the appropriate article for the data source layout.
        let source = modelController.sources?[indexPath.row]

        cell.id = source?.id
        cell.sourceButton.isOn = (modelController.selectedSources?.contains(cell.id ?? ""))!
        cell.sourceLabel.text = source?.name
        cell.onStateChange = { (id) in
            self.modelController.selectedSources = [id]
            self.tableView.reloadData()
            print("Switch with id \(id) toggled")
        }
        
        return cell
    }
}
