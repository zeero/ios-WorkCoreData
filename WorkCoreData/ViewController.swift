//
//  ViewController.swift
//  WorkCoreData
//
//  Created by 長崎 二郎 on 2016/01/02.
//  Copyright © 2016年 26wonders. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func fetchCoreData(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let fetchRequest = NSFetchRequest(entityName: "Employee")
        let predicate = NSPredicate(format: "id = %d", 1)
        fetchRequest.predicate = predicate
        
        do {
            let employees = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as! [Employee]
            for employee in employees {
                label.text = "\(employee.id!), \(employee.name!)"
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    @IBAction func update(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let fetchRequest = NSFetchRequest(entityName: "Employee")
        let predicate = NSPredicate(format: "id = %d", 1)
        fetchRequest.predicate = predicate
        
        do {
            let employees = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as! [Employee]
            for employee in employees {
                employee.name = "zeero"
            }
        } catch let error as NSError {
            print(error)
        }
        
        appDelegate.saveContext()
    }
    
    @IBAction func del(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let fetchRequest = NSFetchRequest(entityName: "Employee")
        let predicate = NSPredicate(format: "id = %d", 1)
        fetchRequest.predicate = predicate
        
        do {
            let employees = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as! [Employee]
            for employee in employees {
                appDelegate.managedObjectContext.deleteObject(employee)
            }
        } catch let error as NSError {
            print(error)
        }
        
        appDelegate.saveContext()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let employee = NSEntityDescription.insertNewObjectForEntityForName("Employee", inManagedObjectContext: appDelegate.managedObjectContext) as! Employee
        employee.id = 1
        employee.name = "Jiro"
        employee.desc = "Test"
        
        appDelegate.saveContext()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

