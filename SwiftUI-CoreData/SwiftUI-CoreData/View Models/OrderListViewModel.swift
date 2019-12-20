//
//  OrderListViewModel.swift
//  SwiftUI-CoreData
//
//  Created by projas on 12/20/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class OrderListViewModel: ObservableObject {
  
  @Published var orders = [OrderViewModel]()
  
  init() {
    fetchAllOrders()
  }
  
  func fetchAllOrders() {
    self.orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
    print(orders)
  }
  
  func deleteOrder(_ orderVM: OrderViewModel) {
    CoreDataManager.shared.deleteOrder(name: orderVM.name)
    fetchAllOrders()
  }
  
}

class OrderViewModel {
  var name = ""
  var type = ""
  
  init(order: Order) {
    self.name = order.name ?? ""
    self.type = order.type ?? ""
  }
}
