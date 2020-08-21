//
//  Pickup.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class Pickup {
    
    let id, collectionType, confirmationCode, propertyId, status: String
    var readyDate: Date
    var pickupDate: Date?
    var cartonsById: [String] = []
    var notes: String?

    init?(dictionary: [String: Any]) {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"

        guard let id = dictionary["id"] as? String,
        let confirmationCode = dictionary["confirmationCode"] as? String,
        let collectionType = dictionary["collectionType"] as? String,
        let status = dictionary["status"] as? String,
        let property = dictionary["property"] as? [String: Any],
        let propertyId = property["id"] as? String,
        let readyDateString = dictionary["readyDate"] as? String,
        let readyDate = formatter.date(from: readyDateString) else {
            NSLog("Error unwrapping optional Pickup properties:")
            NSLog("\tID: \(String(describing: dictionary["id"])) ")
            NSLog("\tConfirmation Code: \(String(describing: dictionary["confirmationCode"])) ")
            NSLog("\tCollection Type: \(String(describing: dictionary["collectionType"])) ")
            NSLog("\tStatus: \(String(describing: dictionary["status"])) ")
            NSLog("\tReady Date: \(String(describing: dictionary["readyDate"])) ")
            NSLog("\tPickup Date: \(String(describing: dictionary["pickupDate"])) ")
            return nil
        }

        self.id = id
        self.propertyId = propertyId
        self.confirmationCode = confirmationCode
        self.collectionType = collectionType
        self.status = status
        self.readyDate = readyDate

        self.notes = dictionary["notes"] as? String

        if let pickupDateString = dictionary["pickupDate"] as? String {
            self.pickupDate = formatter.date(from: pickupDateString)
        }

        guard let cartons = dictionary["cartons"] as? [[String: Any]] else {
            return nil
        }

        for carton in cartons {
            if let id = carton["id"] as? String {
                self.cartonsById.append(id)
            }
        }

    }
    
}
