//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }

    func price() -> Int
}

class Item: SKU {
    var name = ""
    var priceEach = 0

    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return self.priceEach
    }
    
}

class Receipt {
    var scannedItems: [SKU] = []
    var totalAmt = 0

    func add(_ item: SKU) {
        self.scannedItems.append(item)
        self.totalAmt += item.price()
    }
    
    func output() -> String {
        var result = "Receipt:\n"
        
        for item in self.scannedItems {
            let dollars = Double(item.price()) / 100.0
            result += "\(item.name): $\(String(format: "%.2f", dollars))\n"
        }
        
        result += "------------------\n"
        let totalDollars = Double(total()) / 100.0
        result += "TOTAL: $\(String(format: "%.2f", totalDollars))"
        
        return result
    }
    
    func total() -> Int {
        return self.totalAmt
    }
    
    func items() -> [SKU] {
        return self.scannedItems
    }
}

class Register {
    var subtotalAmt = 0
    var receipt = Receipt()
    
    func subtotal() -> Int {
        return self.subtotalAmt
    }
    
    func total() -> Receipt {
        let finalReceipt = self.receipt
        self.receipt = Receipt()
        return finalReceipt
    }
    
    func scan(_ item: Item) {
        self.receipt.add(item)
        self.subtotalAmt += item.priceEach
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

