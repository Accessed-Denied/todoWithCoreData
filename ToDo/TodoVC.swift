//
//  TodoVC.swift
//  ToDo
//
//  Created by MACBOOK on 12/05/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class TodoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoArray: [String] = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - configUI
    private func ConfigUI() {
        tableView.register(UINib(nibName: "todoCell", bundle: nil), forCellReuseIdentifier: "todoCell")
    }

    //MARK: - addTaskBtnIsPressed
    @IBAction func addTaskBtnIsPressed(_ sender: UIBarButtonItem) {
        let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
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
