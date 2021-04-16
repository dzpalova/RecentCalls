//
//  ViewController.swift
//  RecentCalls
//
//  Created by Daniela Palova on 16.04.21.
//

import UIKit

class RecentCallsTableController: UITableViewController {
    var callStore = CallStore()
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func editCalls(_ sender: UIBarButtonItem) {
        if !navigationItem.leftBarButtonItem!.isEnabled {
            navigationItem.leftBarButtonItem?.isEnabled = false
            navigationItem.leftBarButtonItem?.tintColor =  navigationItem.rightBarButtonItem!.tintColor
        } else {
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.leftBarButtonItem?.tintColor = .clear
        }
    }
    
    @IBAction func changeSegmentedControlValue(_ sender: UISegmentedControl) {
        segmentedControl.selectedSegmentIndex = sender.selectedSegmentIndex
        tableView.reloadData()
    }
    
    @IBAction func clearAll(_ sender: UIBarButtonItem) {
        callStore.allCalls.removeAll()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.barTintColor = tableView.backgroundColor
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentedControl.selectedSegmentIndex == 0 ?
            callStore.callsCount() : callStore.missedCallsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "callCell", for: indexPath) as! CallCell
        let call = segmentedControl.selectedSegmentIndex == 0 ?
            callStore.getCall(at: indexPath) : callStore.getMissedCall(at: indexPath)
        cell.setCell(with: call)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if segmentedControl.selectedSegmentIndex == 0 {
                let call = callStore.getCall(at: indexPath)
                callStore.removeCall(at: indexPath)
            } else {
                let call = callStore.getMissedCall(at: indexPath)
                callStore.removeMissedCall(at: indexPath)
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

