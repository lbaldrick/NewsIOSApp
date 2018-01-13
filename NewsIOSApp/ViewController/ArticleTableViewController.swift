//
//  ArticleTableViewController.swift
//  NewsIOSApp
//
//  Created by Michael Lee Baldrick on 08/01/2018.
//  Copyright © 2018 Michael Lee Baldrick. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController, FilterToggledDelegate {
   
    let modelController: ArticleModelController
    
    var selectedSource: String?
    
    @IBOutlet weak var articleTableNavigation: UINavigationItem!
    
    
    required init?(coder aDecoder: NSCoder) {
        modelController = ArticleModelController()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        articleTableNavigation.title  = selectedSource ?? "IGN"
        modelController.getArticles(sourceId: selectedSource, completionHandler: { (articles) in
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelController.getArticleCount()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ArticleTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArticleTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ArticleTableViewCell.")
        }

        // Fetches the appropriate article for the data source layout.
        let article = self.modelController.getArticle(index: indexPath.row)
        
        self.tableView.rowHeight = 120

        cell.titleLabel.text = article.title
        cell.publishedAtLabel.text = article.publishedAt
        cell.descriptionLabel.text = article.description
        cell.newsLink = article.url
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sourceTableViewController = segue.destination as? SourceTableViewController {
            sourceTableViewController.delegate = self
        }
    }
    
    func filterToggled(with id: String) {
        self.selectedSource = id
        articleTableNavigation.title  = selectedSource ?? ""
        modelController.getArticles(sourceId: selectedSource, completionHandler: { (articles) in
            self.tableView.reloadData()
        })
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
