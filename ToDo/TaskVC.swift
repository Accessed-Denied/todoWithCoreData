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

        SetUp()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - SetUp
    private func SetUp() {
        text = textView.text ?? ""
        let todoItem = TodoItem(context: AppDelegate.context)
        todoItem.title = text
        todoItem.count = 1
        AppDelegate.saveContext()
    }
    
    //MARK: - cancelBtnIsPressed
    @IBAction func cancelBtnIsPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - saveBtnIsPressed
    @IBAction func saveBtnIsPressed(_ sender: UIBarButtonItem) {
        let todoItem = TodoItem(context: AppDelegate.context)
        todoItem.title = text
        todoItem.count = 1
        taskDelegate.Task(todoItem: todoItem)
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
