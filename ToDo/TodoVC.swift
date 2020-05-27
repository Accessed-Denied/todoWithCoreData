//
//  TodoVC.swift
//  ToDo
//
//  Created by MACBOOK on 12/05/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit
import CoreData

class TodoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoArray: [TodoItem] = [TodoItem]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigUI()
        // Do any additional setup after loading the view.
    }
    //MARK: - configUI
    private func ConfigUI() {
        tableView.register(UINib(nibName: "todoCell", bundle: nil), forCellReuseIdentifier: "todoCell")
        
        let fetchRequest: NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
        do {
            let todoArray = try AppDelegate.context.fetch(fetchRequest)
            self.todoArray = todoArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {}
    }

    //MARK: - addTaskBtnIsPressed
    @IBAction func addTaskBtnIsPressed(_ sender: UIBarButtonItem) {
        let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        vc.taskDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - TableView DataSource and Delegate Methods
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }

    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as? todoCell else {
            return UITableViewCell()
        }
        cell.taskLbl.text = todoArray[indexPath.row].title
        cell.countLbl.text = String(todoArray[indexPath.row].count)
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - TaskDelegate
extension TodoVC: TaskDelegate {
    func Task(todoItem: TodoItem) {
        todoArray.append(todoItem)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
