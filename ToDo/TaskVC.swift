//
//  TaskVC.swift
//  ToDo
//
//  Created by MACBOOK on 12/05/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

protocol TaskDelegate {
    func Task(todoItem: TodoItem)
}

class TaskVC: UIViewController {
    
    var taskDelegate: TaskDelegate!
    var text = String()

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - cancelBtnIsPressed
    @IBAction func cancelBtnIsPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - saveBtnIsPressed
    @IBAction func saveBtnIsPressed(_ sender: UIBarButtonItem) {
        text = textView.text ?? ""
        let todoItem = TodoItem(context: AppDelegate.context)
        todoItem.title = text
        todoItem.count = 2
        taskDelegate.Task(todoItem: todoItem)
        AppDelegate.saveContext()
        self.navigationController?.popViewController(animated: true)
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
