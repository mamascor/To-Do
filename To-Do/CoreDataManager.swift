//
//  CoreDataManager.swift
//  To-Do
//
//  Created by Marco Mascorro on 12/6/22.
//

import Foundation
import CoreData


class CoreDataManager {
    
    let persistenceContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    
    private init(){
        persistenceContainer = NSPersistentContainer(name: "TodoModel")
        persistenceContainer.loadPersistentStores { desc, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func saveTodoItem(title: String){
        let todoItem = Todo(context: persistenceContainer.viewContext)
        
        todoItem.title = title
        todoItem.isDone = false
        do {
            try persistenceContainer.viewContext.save()
            print("Task was saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func getAllTodoItems() -> [Todo] {
        
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
        
    }
    
    func updateStatus() {
        do {
            try persistenceContainer.viewContext.save()
        } catch {
            persistenceContainer.viewContext.rollback()
        }
    }
    
    
}
