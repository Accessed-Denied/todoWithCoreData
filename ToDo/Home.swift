//
//  ViewController.swift
//  ToDo
//
//  Created by MACBOOK on 07/05/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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

}

