//
//  SourceTableViewCell.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 09/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import Foundation
import UIKit

class SourceTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var sourceButton: UISwitch!
    
    var id: String?
    
    var onStateChange: ((String) -> Void)?
    
    
    @IBAction func toogleState(_ sender: Any) {
        if self.onStateChange != nil && self.id != nil {
            self.onStateChange!(self.id!)
        }
    }
}
