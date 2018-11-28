//
//  DecisionViewController.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/26/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit

class DecisionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var choseList: ChoseList?
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue){
        if let sourceVC = sender.source as? CreateItemViewController, let item = sourceVC.item {
            // Add a new item
            let newIndexPath = IndexPath(row: (choseList?.list.count)!, section: 0)
            
            choseList?.list.append(item)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let value = choseList?.list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DecisionTableViewCell else {
            fatalError("The dequeued cell is not an instance of DecisionTableViewCell")
        }
        cell.optionNameLabel.text = value
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (choseList?.list.count)!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            choseList?.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
