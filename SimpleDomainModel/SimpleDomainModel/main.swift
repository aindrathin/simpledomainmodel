//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String
    private let exchangeRate : [String : Int] = ["USD": 4, "GBP": 2, "EUR": 6, "CAN": 5]
    
    public func convert(_ to: String) -> Money {
        let fromRate = exchangeRate[currency]
        let toRate = exchangeRate[to]
        print("fromRate: \(String(describing: fromRate))")
        print("toRate: \(String(describing: toRate))")
        let newAmount = Int(Double(toRate!) / Double(fromRate!) * Double(amount))
        print("newAmount: \(newAmount)")
        return Money(amount: newAmount, currency: to)
    }
  
    public func add(_ to: Money) -> Money {
        let converted = convert(to.currency)
        return Money(amount: converted.amount + to.amount, currency: to.currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        let converted = convert(from.currency)
        return Money(amount: converted.amount - from.amount, currency: from.currency)
    }
}

////////////////////////////////////
// Job
//
open class Job {
    fileprivate var title : String
    fileprivate var type : JobType

    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
  
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
  
    open func calculateIncome(_ hours: Int) -> Int {
        switch type {
        case .Hourly(let amount):
            return Int(amount * Double(hours))
        case .Salary(let amount):
            return amount
        }
    }
  
    open func raise(_ amt : Double) {
        switch type {
        case .Hourly(let currAmount):
            let total = currAmount + amt
            type = JobType.Hourly(total)
        case .Salary(let currAmount):
            let total = currAmount + Int(amt)
            type = JobType.Salary(total)
        }
    }
}
/*
////////////////////////////////////
// Person
//
open class Person {
    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0

    fileprivate var _job : Job? = nil
    open var job : Job? {
        get { }
        set(value) {
        }
    }
  
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get { }
        set(value) {
        }
    }
  
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
  
    open func toString() -> String {
    }
}

////////////////////////////////////
// Family
//
open class Family {
    fileprivate var members : [Person] = []
  
    public init(spouse1: Person, spouse2: Person) {
    }
  
    open func haveChild(_ child: Person) -> Bool {
    }
  
    open func householdIncome() -> Int {
    }
}
*/




