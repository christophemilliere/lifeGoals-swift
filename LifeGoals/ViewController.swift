//
//  ViewController.swift
//  LifeGoals
//
//  Created by Christophe on 21/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let _goalManager = GoalManager()

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var ui_goalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui_goalTextField.delegate = self
        
        tableview.delegate = self
        tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let goalText = ui_goalTextField.text, let goalIndex = _goalManager.addGoal(wihText: goalText) {
            
            tableview.insertRows(at: [IndexPath(row: goalIndex, section: 0)], with: .automatic)
            textField.text = nil
        }
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = nil
        textField.resignFirstResponder()
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _goalManager.getGoalCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goal-cell", for: indexPath)
        cell.textLabel?.text = _goalManager.getGoal(atIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        _goalManager.removeGoal(atIndex: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }


}

