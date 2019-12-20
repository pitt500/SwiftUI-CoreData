//
//  CoreDataManager.swift
//  SwiftUI-CoreData
//
//  Created by projas on 12/19/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  
  static let shared = CoreDataManager(context: NSManagedObjectContext.current)
  
  var context: NSManagedObjectContext
  
  private init(context: NSManagedObjectContext) {
    self.context = context
  }
  
  func saveOrder(name: String, type: String) {
    //let order = O
    let order = Order(context: self.context)
    order.name = name
    order.type = type
    
    do {
      try self.context.save()
    } catch let error as NSError {
      print(error)
    }
  }
}
