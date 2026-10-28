//
//  ViewController.swift
//  22_07_2026_CoreData_Demo
//
//  Created by Vishal Jagtap on 28/10/26.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insertEmployeeRecords()
    }
    
    func insertEmployeeRecords(){
        print("------inside insert employee record function-------")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let employeeEntityDescription = NSEntityDescription.entity(forEntityName: "Employee",
                                                        in: managedContext)
        
        let employeeObject1 = NSManagedObject(entity: employeeEntityDescription!,
                                           insertInto: managedContext)
        
        let employeeObject2 = NSManagedObject(entity: employeeEntityDescription!,
                                              insertInto: managedContext)
        
        let employeeObject3 = NSManagedObject(entity: employeeEntityDescription!,
                                              insertInto: managedContext)
        
        employeeObject1.setValue(12311, forKey: "empId")
        employeeObject1.setValue("Kirti", forKey: "empName")
        employeeObject1.setValue("Nevasa", forKey: "empCity")
        
        employeeObject1.setValue(12312, forKey: "empId")
        employeeObject1.setValue("Mayur", forKey: "empName")
        employeeObject1.setValue("Amravati", forKey: "empCity")
        
        employeeObject1.setValue(12313, forKey: "empId")
        employeeObject1.setValue("Omkar", forKey: "empName")
        employeeObject1.setValue("Pune", forKey: "empCity")
        
        for i in 1...3{
            let nsManagedObject1 = NSManagedObject(entity: employeeEntityDescription!,
                                                  insertInto: managedContext)
            
            nsManagedObject1.setValue("Employee \(i)", forKey: "empName")
            nsManagedObject1.setValue("Pune", forKey: "empCity")
            nsManagedObject1.setValue(i, forKey: "empId")
        }
        
        do{
            try managedContext.save()
        }catch{
            print("the changes not saved")
        }
    }
}
