//
//  Employee+CoreDataProperties.swift
//  WorkCoreData
//
//  Created by 長崎 二郎 on 2016/01/02.
//  Copyright © 2016年 26wonders. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Employee {

    @NSManaged var id: NSNumber?
    @NSManaged var name: String?
    @NSManaged var desc: String?
    @NSManaged var created: NSDate?

}
