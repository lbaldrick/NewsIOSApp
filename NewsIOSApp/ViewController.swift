//
//  ViewController.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 29/12/2017.
//  Copyright © 2017 Michael Lee Baldrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var json: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeRequest(sender: UIButton) {
        Rest.get(url: "http://192.168.0.39:3003/news/all") { (any) in
            print(any!)
            self.json = any!
        }
    }
    
    @IBAction func showResult(sender: UIButton) {
        print(self.json!)
    }


}

