//
//  DecisionViewController.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/26/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit
import os.log
import SafariServices

class DecisionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    var choseList: ChoseList?
    var modifiedList = false
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var choseLabel: UILabel!
    @IBOutlet weak var choseView: UIView!
    
    
    //MARK: Actions
    @IBAction func decisionButton(_ sender: Any) {
        let count = choseList?.list.count
        if count! > 0 {
            choseView.isHidden = false
            let randomNumber = Int(arc4random_uniform(UInt32(count!)))
            choseLabel.text = "\(choseList?.list[randomNumber] ?? "")"
        }
    }
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue){
        if let sourceVC = sender.source as? CreateItemViewController, let item = sourceVC.item {
            // Add a new item
            let newIndexPath = IndexPath(row: (choseList?.list.count)!, section: 0)
            
            choseList?.list.append(item)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            modifiedList = true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellName = choseList?.list[indexPath.row] ?? ""
        print(cellName)
        
        if !cellName.isEmpty {
            let words = cellName.split(separator: " ")
            var linkKeyword = ""
            for (i,v) in words.enumerated() {
                if i != words.count - 1 {
                    linkKeyword += v + "%20"
                }
                else {
                    linkKeyword += v
                }
            }
            print("Keyboard for link -> \(linkKeyword)")
            
            let s = "https://www.google.com/search?source=hp&ei=b4YEXKTEOIOt_Qba_o2QCQ&q=" + linkKeyword + "&btnK=Google+Search&oq=" + linkKeyword + "&gs_l=psy-ab.3..0i131j0j0i131l2j0j0i131j0j0i131j0j0i131.2865.3569..3690...0.0..0.306.1222.3j2j2j1....3..0....1..gws-wiz.....0._hD8AyjDPH4"
            
            let url = URL(string: s)
            let safariVC = SFSafariViewController(url: url!)
            present(safariVC,animated: true)
        }
        else {
            let url = URL(string: "https://www.google.com")
            let safariVC = SFSafariViewController(url: url!)
            present(safariVC,animated: true)
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
            modifiedList = true
        } else if editingStyle == .insert {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choseView.isHidden = true
        navigationItem.title = choseList?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    @IBAction func back(_ sender: Any) {
        if modifiedList {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "saveItemsInList"), object: nil)
        }
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
