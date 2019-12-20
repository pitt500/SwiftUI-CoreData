//
//  ContentView.swift
//  SwiftUI-CoreData
//
//  Created by projas on 12/19/19.
//  Copyright © 2019 projas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var orderListVM: OrderListViewModel
  
  init() {
    self.orderListVM = OrderListViewModel()
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
