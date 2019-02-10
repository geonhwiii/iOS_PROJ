//
//  ViewController.swift
//  19_CoreData
//
//  Created by 정건휘 on 10/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        return app.persistentContainer.viewContext
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func createEntity(_ sender: Any) {
        guard let name = nameField.text else { return }
        guard let val = ageField.text, let age = Int(val) else { return }
        
        // entity를 생성하면 바로 저장소에 저장되는 것이 아닌, context에 임시 객체로 생성된다.
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        newEntity.setValue(name, forKey: "name")
        newEntity.setValue(age, forKey: "age")
        // 변경사항이 있는지 확인한다.
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                print(error)
            }
        }
        nameField.text = nil
        ageField.text = nil
    }
    @IBAction func readEntity(_ sender: Any) {
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        // 검색조건과 정렬방식을 지정하지 않았기 때문에 저장되어 있는 모든 데이터가 리턴됨. 없다면 빈 배열이 리턴됨.
        do {
            let list = try context.fetch(request)
            
            if let fisrt = list.first {
                // nameField에 nameAttribute에 저장되어 있는 값을 표시
                nameField.text = fisrt.value(forKey: "name") as? String
                // ageField에는 ageAttribute에 있는 값을 표시
                if let age = fisrt.value(forKey: "age") as? Int {
                    ageField.text = "\(age)"
                }
                // readEntity에서 읽어온 데이터를 저장
                editTarget = fisrt
            } else {
                print("Not found")
            }
        } catch {
            
        }
    }
    
    var editTarget: NSManagedObject?
    
    @IBAction func updateEntity(_ sender: Any) {
        guard let name = nameField.text else { return }
        guard let val = ageField.text, let age = Int(val) else { return }
        
        if let target = editTarget {
            target.setValue(name, forKey: "name")
            target.setValue(age, forKey: "age")
        }
        // context 저장
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                print(error)
            }
        }
        nameField.text = nil
        ageField.text = nil
    }
    @IBAction func deleteEntity(_ sender: Any) {
        if let target = editTarget {
            // context에서 삭제되지만 아직 저장소에선 삭제되지 않음. context를 저장해야 저장소에서도 실제로 삭제된다.
            context.delete(target)
            
            if context.hasChanges {
                do {
                    try context.save()
                    print("Saved")
                } catch {
                    print(error)
                }
            }
            nameField.text = nil
            ageField.text = nil
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

