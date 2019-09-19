//
//  ViewController.swift
//  TestFruits
//
//  Created by Nikita Velichko on 04/07/2019.
//  Copyright © 2019 Nikita Velichko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static var fruitsArr: [String] = []
    static var unitsArr: [String] = []
    
    @IBOutlet weak var fruitsTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toogleTableView()
        addBarButton()
        print(ViewController.fruitsArr)
    }
   
    
    @IBAction func addItemAction(_ sender: Any) {
    }
    
    func toogleTableView(){
        if ViewController.fruitsArr.count == 0 {
            fruitsTableView.isHidden = true
            emptyView.isHidden = false
        }else{
            fruitsTableView.isHidden = false
            emptyView.isHidden = true
            fruitsTableView.reloadData()
        }
    }
    
    func addBarButton(){
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionAdd))
        navigationItem.leftBarButtonItem = addButtonItem
    }
    
    @objc func actionAdd(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "newViewController") as! AddItemViewController
        navigationController?.pushViewController(newViewController, animated: true)
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.fruitsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kCell", for: indexPath) as! TableViewCell
        cell.fruitLabel.text = ViewController.fruitsArr[indexPath.row]
        cell.unitLabel.text = ViewController.unitsArr[indexPath.row]
        return cell
    }
    
    
}

