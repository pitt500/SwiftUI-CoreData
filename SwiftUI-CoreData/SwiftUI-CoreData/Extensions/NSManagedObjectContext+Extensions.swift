//
//  NSManagedObjectContext+Extensions.swift
//  SwiftUI-CoreData
//
//  Created by projas on 12/19/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
  static var current: NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
  }
}
