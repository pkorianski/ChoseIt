//
//  CreateItemViewController.swift
//  ChoseIt
//
//  Created by Patrick Korianski on 11/27/18.
//  Copyright © 2018 Patrick Korianski. All rights reserved.
//

import UIKit
import os.log

class CreateItemViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var itemtextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var item: String?
    
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the save button while editing
        saveButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the textfield's user input through delegate callbacks
        itemtextField.delegate = self
        
        // Enable save only if itemtextField has a value
        updateSaveButtonState()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        item = itemtextField.text ?? ""
    }
    
    
    
    //MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the save button if the text field is empty
        let text = itemtextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    
    
    
    
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
