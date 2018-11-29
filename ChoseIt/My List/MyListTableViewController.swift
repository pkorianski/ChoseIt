//
//  MyListTableViewController.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/18/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit
import os.log

class MyListTableViewController: UITableViewController {
    
    //MARK: Properties
    //var lists = [String]()
    var lists = [ChoseList]()
    
    //MARK: Actions
    @IBAction func unwindToChoseList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? CreateListViewController, let list = sourceViewController.list {
            // Add a new list
            let newIndexPath = IndexPath(row: lists.count, section: 0)
            
            lists.append(list)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Load the sample list
        //loadLists()
        loadDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }
    
    private func loadDefaults() {
        
        let photo1 = UIImage(named: "restaurant_pic")
        let photo2 = UIImage(named: "movies_pic")
        let photo3 = UIImage(named: "food_pic")
        let photo4 = UIImage(named: "coin_pic")
        
        guard let default1 = ChoseList(name: "Restaurants", photo: photo1, list: ["Qdoba","McDonalds"]) else {
            fatalError("Unable to instantiate default1")
        }
        
        guard let default2 = ChoseList(name: "Movies & Shows", photo: photo2, list: ["Star Wars","Love Actually"]) else {
            fatalError("Unable to instantiate default2")
        }
        
        guard let default3 = ChoseList(name: "Food Recipes", photo: photo3, list: ["Mashed Potatoes","Ice cream"]) else {
            fatalError("Unable to instantiate default1")
        }
        
        guard let default4 = ChoseList(name: "Coin Toss", photo: photo4, list: ["Heads","Tails"]) else {
            fatalError("Unable to instantiate default1")
        }
        
        lists += [default1,default2,default3, default4]
        
    }
    
//    private func loadLists() {
//        let string1 = "Restaurants"
//        let string2 = "Movies & Shows"
//        let string3 = "Food Recipes"
//        lists += [string1,string2,string3]
//    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MyListTableViewCell"
        let list = lists[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyListTableViewCell else {
            fatalError("The dequeued cell is not an instance of MyListTableViewCell.")
        }
        
        //let list = lists[indexPath.row]
        cell.nameLabel.text = list.name
        cell.photoImageView.image = list.photo

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "ShowList":
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! DecisionViewController
            
            guard let selectedCell = sender as? MyListTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedList = lists[indexPath.row]
            vc.choseList = selectedList
            
        default:
            print("In Default")
        }
    }

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
