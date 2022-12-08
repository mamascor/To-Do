# To-Do






### Display task and when they are done
<img src="Images/IMG_9C695111291B-1.jpeg" width="250" height="541">



<img src="Images/getTodo.jpeg" width="250" height="541">






> Initializing persistent container 

```

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
}

```
