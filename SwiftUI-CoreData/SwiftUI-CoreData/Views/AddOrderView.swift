//
//  AddOrderView.swift
//  SwiftUI-CoreData
//
//  Created by projas on 12/19/19.
//  Copyright © 2019 projas. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
  
  @State var addOrderVM = AddOrderViewModel()
  
  var body: some View {
    NavigationView {
      Group {
        VStack {
          TextField("Enter name", text: self.$addOrderVM.name)
          Picker(selection: self.$addOrderVM.type, label: Text("")) {
            Text("Cappuccino").tag("cap")
            Text("Regular").tag("reg")
            Text("Expresso").tag("ex")
          }.pickerStyle(SegmentedPickerStyle())
          
          Button("Place Order") {
            self.addOrderVM.saveOrder()
          }.padding(8)
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(10)
        }
      }.padding()
      
        .navigationBarTitle("Add Order", displayMode: .large)
    }
  }
}

struct AddOrderView_Previews: PreviewProvider {
  static var previews: some View {
    AddOrderView()
  }
}
