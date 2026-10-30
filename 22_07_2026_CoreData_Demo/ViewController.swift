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
//        insertEmployeeRecords()
        print("---------------")
        retriveEmployeeRecords()
        print("---------------")
//        deleteEmployeeRecord()
        print("---------------")
        retriveEmployeeRecords()
        print("---------------")
        updateAnEmployeeRecord()
        print("---------------")
        retriveEmployeeRecords()
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
    
    func retriveEmployeeRecords(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let employeeEntityDescription = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        fetchRequest.entity = employeeEntityDescription
        
        do{
            let fetchedRequestResults = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            let cntOfResults = fetchedRequestResults.count
            
            for i in 0...cntOfResults - 1{
                let eachEmployee = fetchedRequestResults[i]
                print(eachEmployee)
            }
        }catch{
            print("fetch request failed")
        }
        
        do{
            try managedContext.save()
        }catch{
            print("saving on context failed")
        }
    }
    
    func deleteEmployeeRecord(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let employeeEntityDescription = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        let predicate = NSPredicate(format: "empId == %@", NSNumber(integerLiteral: 1))
        
        fetchRequest.entity = employeeEntityDescription
        fetchRequest.predicate = predicate
        
        let fetchedRequestResults = try! managedContext.fetch(fetchRequest) as! [NSManagedObject]
        
        let employeeToDeleted = fetchedRequestResults[0]
        
        managedContext.delete(employeeToDeleted)
    
        do{
            try managedContext.save()
        }catch{
            print("employee object deleted")
        }
    }
    
    
    func updateAnEmployeeRecord(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        
        let employeeEntityDescirption = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        let predicateForUpdate = NSPredicate(format: "empId == %@", NSNumber(integerLiteral: 2))
        
        fetchRequest.entity = employeeEntityDescirption
        fetchRequest.predicate = predicateForUpdate
        
        do{
            let fetchRequestResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject]
            print(fetchRequestResults!)
            let cntResults = fetchRequestResults?.count
            print(cntResults!,"-------")
            let objectOfEmpToBeUpdated = fetchRequestResults![0]
            objectOfEmpToBeUpdated.setValue("Raj", forKey: "empName")
            objectOfEmpToBeUpdated.setValue("Koregoan", forKey: "empCity")
            objectOfEmpToBeUpdated.setValue(123333, forKey: "empId")
        }catch{
            print("fetch request failed")
        }
        
        do{
            try managedContext.save()
        }catch{
            print("saved failed")
        }
    }
}
