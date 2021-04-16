//
//  CallStore.swift
//  RecentCalls
//
//  Created by Daniela Palova on 16.04.21.
//

import UIKit

enum TypeCall: String {
    case mobile
    case faceTimeAudio
    case other
}

class Call {
    var contactName: String
    var numCalls: Int
    var type: TypeCall
    var date: Date
    var isMissed: Bool
    
    init(contactName: String, numCalls: Int, type: TypeCall, date: Date, isMissed: Bool) {
        self.contactName = contactName
        self.numCalls = numCalls
        self.type = type
        self.date = date
        self.isMissed = isMissed
    }
}

class CallStore {
    var allCalls = [Call]()
    var missedCalls: [Call] {
        return allCalls.filter { $0.isMissed }
    }
    
    let arr = [
        ("Emi", 1, TypeCall.mobile, "1996.12.19", false),
        ("Svetli", 1, TypeCall.mobile, "1996.12.19", false),
        ("Miki", 1, TypeCall.faceTimeAudio, "1996.12.19", true),
        ("Mitko", 1, TypeCall.mobile, "1996.12.19", false),
        ("Gosho", 1, TypeCall.mobile, "1996.12.19", true),
        ("Emi", 1, TypeCall.mobile, "1996.12.19", false),
        ("Mitko", 1, TypeCall.faceTimeAudio, "1996.12.19", false),
        ("Gosho", 1, TypeCall.mobile, "1996.12.19", true),
        ("Emi", 1, TypeCall.mobile, "1996.12.19", false),
        ("Svetli", 1, TypeCall.mobile, "1996.12.19", false),
        ("Miki", 1, TypeCall.faceTimeAudio, "1996.12.19", true),
        ("Mitko", 1, TypeCall.mobile, "1996.12.19", false),
        ("Gosho", 1, TypeCall.mobile, "1996.12.19", true),
        ("Emi", 1, TypeCall.mobile, "1996.12.19", false),
        ("Mitko", 1, TypeCall.faceTimeAudio, "1996.12.19", false),
        ("Gosho", 1, TypeCall.mobile, "1996.12.19", true)
    ]
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy.MM.dd"
        for el in arr {
            let call = Call(contactName: el.0,
                            numCalls: el.1,
                            type: el.2,
                            date: dateFormatter.date(from: el.3)!,
                            isMissed: el.4)
            allCalls.append(call)
        }
    }
    
    func callsCount() -> Int {
        return allCalls.count
    }
    
    func getCall(at indexPath: IndexPath) -> Call {
        return allCalls[indexPath.row]
    }
    
    func missedCallsCount() -> Int {
        return missedCalls.count
    }
    
    func getMissedCall(at indexPath: IndexPath) -> Call {
        return missedCalls[indexPath.row]
    }
    
    func removeCall(at idx: IndexPath) {
        allCalls.remove(at: idx.row)
    }
    
    func removeMissedCall(at idx: IndexPath) {
        var count = 0
        for i in 0 ..< allCalls.count {
            if count == idx.row {
                allCalls.remove(at: i)
                break
            }
            if allCalls[i].isMissed {
                count += 1
            }
        }
    }
}
