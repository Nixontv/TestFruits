//
//  AddItemViewController.swift
//  
//
//  Created by Nikita Velichko on 04/07/2019.
//

import UIKit
import DZNEmptyDataSet

class AddItemViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var addItemOutlet: UIButton!
    @IBOutlet weak var kgOutlet: UIButton!
    @IBOutlet weak var gramsOutlet: UIButton!
    @IBOutlet weak var caseOutlet: UIButton!
    @IBOutlet weak var customOutlet: UIButton!
    @IBOutlet weak var customTextField: UITextField!
    
    var arr:[String] = []
    var selectedKg = true
    var selectedGrams = false
    var selectedCase = false
    var selectedCustom = false
    
    override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    setRadiusAndBorder()
    kgOutlet.backgroundColor = .blue
    }
    
    @IBAction func addItemButton(_ sender: Any) {

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController{
            
            ViewController.fruitsArr.append(itemTextField.text ?? "")
            
            if selectedKg == true{
                ViewController.unitsArr.append("Kg")
            }
            if selectedGrams == true{
                ViewController.unitsArr.append("Grams")
            }
            if selectedCase == true{
                ViewController.unitsArr.append("Case")
            }
            if selectedCustom == true{
                ViewController.unitsArr.append(customTextField.text ?? "")
            }
            
            vc.navigationItem.hidesBackButton = true
        }
    }
    
    @IBAction func kgButton(_ sender: Any) {
        kgOutlet.backgroundColor = .blue
        gramsOutlet.backgroundColor = .clear
        caseOutlet.backgroundColor = .clear
        customOutlet.backgroundColor = .clear
        selectedKg = true
        selectedGrams = false
        selectedCase = false
        selectedCustom = false
    }
    
    @IBAction func gramsButton(_ sender: Any) {
        kgOutlet.backgroundColor = .clear
        gramsOutlet.backgroundColor = .blue
        caseOutlet.backgroundColor = .clear
        customOutlet.backgroundColor = .clear
        selectedKg = false
        selectedGrams = true
        selectedCase = false
        selectedCustom = false
    }
    
    @IBAction func caseButton(_ sender: Any) {
        kgOutlet.backgroundColor = .clear
        gramsOutlet.backgroundColor = .clear
        caseOutlet.backgroundColor = .blue
        customOutlet.backgroundColor = .clear
        selectedKg = false
        selectedGrams = false
        selectedCase = true
        selectedCustom = false
    }
    
    @IBAction func customButton(_ sender: Any) {
        kgOutlet.backgroundColor = .clear
        gramsOutlet.backgroundColor = .clear
        caseOutlet.backgroundColor = .clear
        customOutlet.backgroundColor = .blue
        selectedKg = false
        selectedGrams = false
        selectedCase = false
        selectedCustom = true
    }
    
    func setRadiusAndBorder(){
        addItemOutlet.layer.cornerRadius = 5
        kgOutlet.layer.cornerRadius = 5
        kgOutlet.layer.borderWidth = 1
        gramsOutlet.layer.cornerRadius = 5
        gramsOutlet.layer.borderWidth = 1
        caseOutlet.layer.cornerRadius = 5
        caseOutlet.layer.borderWidth = 1
        customOutlet.layer.cornerRadius = 5
        customOutlet.layer.borderWidth = 1
    }

}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
