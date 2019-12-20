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
  
  private func fetchOrder(name: String) -> Order? {
    var orders: [Order] = []
    
    let request: NSFetchRequest<Order> = Order.fetchRequest()
    request.predicate = NSPredicate(format: "name == %@", name)
    
    do {
      orders = try self.context.fetch(request)
    } catch let error as NSError {
      print(error)
    }
    
    return orders.first
  }
  
  func getAllOrders() -> [Order] {
    var orders: [Order] = []
    
    let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
    
    do {
      orders = try self.context.fetch(orderRequest)
    } catch let error as NSError {
      print(error)
    }
    
    return orders
  }
  
  func saveOrder(name: String, type: String) {
    let order = Order(context: self.context)
    order.name = name
    order.type = type
    
    do {
      try self.context.save()
    } catch let error as NSError {
      print(error)
    }
  }
  
  func deleteOrder(name: String) {
    do {
      if let order = fetchOrder(name: name) {
        self.context.delete(order)
        try self.context.save()
      }
    } catch let error as NSError {
      print(error)
    }
  }
  
}
