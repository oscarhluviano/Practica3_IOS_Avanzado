//
//  AddBViewController.swift
//  Practica3
//
//  Created by Oscar Hernandez on 08/04/22.
//

import UIKit
import CoreData

class AddBViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvInstructions: UITextView!
    
    
    
    @IBAction func addElement(_ sender: Any) {
        
        createDrink(name: tvName.text ?? "", ing: tvIngredients.text ?? "", instru: tvInstructions.text ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func createDrink(name: String, ing: String, instru: String){
        let newDrink = Drinks(context: context)
        newDrink.name = name
        newDrink.ingredients = ing
        newDrink.instructions = instru
        newDrink.image = "drink.png"
    }

}
