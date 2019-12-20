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
    NavigationView {
      List {
        ForEach(self.orderListVM.orders, id: \.name) { order in
          HStack {
            Image(order.type)
              .resizable()
              .frame(width: 100, height: 100)
              .cornerRadius(10)
            
            Text(order.name)
              .font(.largeTitle)
              .padding([.leading], 10)
          }
        }
      }
      .navigationBarTitle("Orders", displayMode: .automatic)
      .navigationBarItems(trailing: Button("Add New Order"){
        
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
