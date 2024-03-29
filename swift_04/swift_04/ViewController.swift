//
//  ViewController.swift
//  swift_04
//
//  Created by 俊祥 on 2019/7/6.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit
var todos = [ToDoItem]()


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = [ToDoItem(id: "1", image: "child-selected", title: "Go to Disney", date: dateFromString("2014-10-20")!),
                ToDoItem(id: "2", image: "shopping-cart-selected", title: "Cicso Shopping", date: dateFromString("2014-10-28")!),
                ToDoItem(id: "3", image: "phone-selected", title: "Phone to Jobs", date: dateFromString("2014-10-30")!),
                ToDoItem(id: "4", image: "travel-selected", title: "Plan to Europe", date: dateFromString("2014-10-31")!)]
        
        view.addSubview(todoTableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoTableView.reloadData()
    }
    
    // MARK - helper func
    func setMessageLabel(_ messageLabel: UILabel, frame: CGRect, text: String, textColor: UIColor, numberOfLines: Int, textAlignment: NSTextAlignment, font: UIFont) {
        messageLabel.frame = frame
        messageLabel.text = text
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = numberOfLines
        messageLabel.textAlignment = textAlignment
        messageLabel.font = font
        messageLabel.sizeToFit()
    }
    
    func setCellWithTodoItem(_ cell:JXTableViewCell,todo:ToDoItem)  {
        let imageView:UIImageView = cell.jx_imageView!
        let titleLabel:UILabel  = cell.jx_titleLabel!
        let dateLabel:UILabel = cell.jx_dateLabel!
        
        imageView.image = UIImage(named: todo.image)
        titleLabel.text = todo.title
        dateLabel.text = stringFromDate(todo.date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTodo" {
            let vc = segue.destination as! DetailViewContriller
            let indexPath = todoTableView.indexPathForSelectedRow
            if let indexPath = indexPath {
                vc.todo = todos[(indexPath as NSIndexPath).row]
            }
        }
    }
    
    private lazy var todoTableView:UITableView = {
        var table = UITableView(frame: self.view.frame, style: .grouped)
        table.register(JXTableViewCell.self, forCellReuseIdentifier: "todoCell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todos.count != 0 {
            return todos.count
        } else {
            let messageLabel:UILabel = UILabel()
            setMessageLabel(messageLabel, frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height), text: "No data is currently available.", textColor: UIColor.black, numberOfLines: 0, textAlignment: NSTextAlignment.center, font: UIFont(name:"Palatino-Italic", size: 20)!)
            
            self.todoTableView.backgroundView = messageLabel
            self.todoTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "todoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        setCellWithTodoItem(cell as! JXTableViewCell, todo: todos[(indexPath as NSIndexPath).row])
        return cell
    }
}

extension ViewController:UITableViewDelegate {
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        todoTableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todos.remove(at: (indexPath as NSIndexPath).row)
            todoTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: (destinationIndexPath as NSIndexPath).row)
        todos.insert(todo, at: (destinationIndexPath as NSIndexPath).row)
    }
}

