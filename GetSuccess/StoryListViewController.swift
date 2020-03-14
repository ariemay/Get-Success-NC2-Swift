//
//  StoryListViewController.swift
//  GetSuccess
//
//  Created by Arie May Wibowo on 13/03/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import UIKit

class StoryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    let stories: [[String]] = [["Elon Musk", "Tesla and SpaceX Founder"], ["Steve Jobs", "Apple Founder"]]
    let personalStories: [Persons] = [.elonmusk, .stevejobs]
    let personalImage: [UIImage] = [#imageLiteral(resourceName: "elonmusk"), #imageLiteral(resourceName: "stevejobs")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexItem = self.tableview.indexPathForSelectedRow {
            let destination = segue.destination as! StoryDetailViewController
            destination.name = stories[indexItem.row][0]
            destination.image = personalImage[indexItem.row]
            destination.content = personalStories[indexItem.row].rawValue
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storylist", for: indexPath)
        cell.textLabel?.text = stories[indexPath.row][0]
        cell.detailTextLabel?.text = stories[indexPath.row][1]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailStory", sender: self)
    }


}
