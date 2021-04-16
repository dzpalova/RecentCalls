//
//  CallCell.swift
//  RecentCalls
//
//  Created by Daniela Palova on 16.04.21.
//

import UIKit

class CallCell: UITableViewCell {
    @IBOutlet var isMissedIcon: UIImageView!
    @IBOutlet var contactNameLabel: UILabel!
    @IBOutlet var numberMissedCallsLabel: UILabel!
    @IBOutlet var typeCallLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setCell(with call: Call) {
        contactNameLabel.text = call.contactName
        contactNameLabel.textColor = call.isMissed ? .red : .black
        
        let num = call.numCalls
        numberMissedCallsLabel.text = num > 1 ? "(\(num))" : ""
        
        typeCallLabel.text = call.type.rawValue
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateLabel.text = dateFormatter.string(from: call.date)
    }
}
