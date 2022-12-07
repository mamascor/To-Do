//
//  ViewController.swift
//  To-Do
//
//  Created by Marco Mascorro on 12/6/22.
//

import UIKit

let reusableCell = "reusableCell"

enum taskStatus: String {
    case done = "Task is done."
    case inProgress = "Task is still in progress."
     
}

class ViewController: UITableViewController {
    
    
    lazy var addButton: UIButton = {
       
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(handleAddTask), for: .touchUpInside)
        button.tintColor = .label
        
        
        return button
    }()
   
    
    private var Tasks = [Todo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    let codeDM = CoreDataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationControllerConfig()
        tableViewConfig()
        fetchTodoTaskItems()
        
    }
    
    //MARK: - Selectors
    
    @objc func handleAddTask(){
       
        let alert = UIAlertController(title: "Add a task", message: "Add a task to do", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            let task = alert.textFields![0]
            
            if let text = task.text {
                
        
                    
                self.codeDM.saveTodoItem(title: text.capitalized)
               
                DispatchQueue.main.async {
                    self.fetchTodoTaskItems()
                }
               
            }
        }))
        
        
        present(alert, animated: true)
        
        
        
     
        
    }

    
    //MARK: - Helpers
    
    private func tableViewConfig(){
        tableView.register(TodoTaskCell.self, forCellReuseIdentifier: reusableCell)
        tableView.separatorStyle = .none
    
    }
    
    private func navigationControllerConfig(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    func fetchTodoTaskItems() {
        self.Tasks = CoreDataManager.shared.getAllTodoItems()
        tableView.reloadData()
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath) as! TodoTaskCell
        cell.TitleView.text = Tasks[indexPath.row].title?.capitalized
        if let first = Tasks[indexPath.row].title?.capitalized.first {
            cell.initialTitleView.text = "\(first)"
        }
        cell.isDoneView.text = Tasks[indexPath.row].isDone ? taskStatus.done.rawValue : taskStatus.inProgress.rawValue
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Tasks[indexPath.row].isDone = true
        codeDM.updateStatus()
        tableView.reloadData()
    }
    
    
}


