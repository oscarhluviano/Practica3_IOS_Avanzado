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
    
    var datos = [Drinks]()
    
    var plst = [[String:Any]]()
    

    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvInstructions: UITextView!
    
    
    
    @IBAction func addElement(_ sender: Any) {
        
        if tvName.text != "" && tvIngredients.text != "" && tvIngredients.text != ""{
            createDrink(name: tvName.text ?? "", ing: tvIngredients.text ?? "", instru: tvInstructions.text ?? "")
            tvName.text = ""
            tvIngredients.text = ""
            tvInstructions.text = ""
            print("Record Added!")
        }else{
            let alertController = UIAlertController(title: "Error", message:
                    "Faltan datos", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        getAllItems()
        
        // Do any additional setup after loading the view.
    }
    
    func createDrink(name: String, ing: String, instru: String){
        let newDrink = Drinks(context: context)
        newDrink.name = name
        newDrink.ingredients = ing
        newDrink.instructions = instru
        newDrink.image = "drink.png"
        do{
            try context.save()
        }catch{
            
        }
    }
    
    func getAllItems(){
        do{
            datos = try context.fetch(Drinks.fetchRequest())
            if datos.count == 0 {
                print("hola")
            }
        }catch{
            print("error")
        }
    }
    
    func obtenPlt() {
            // encuentra la ubicación en tiempo de ejecución de un archivo agregado al proyecto
            if let rutaAlArchivo = Bundle.main.url(forResource: "Drinks", withExtension: "plist") {
                do {
                    let bytes = try Data(contentsOf: rutaAlArchivo)
                    let tmp = try PropertyListSerialization.propertyList(from: bytes, options: .mutableContainers, format:nil)
                    plst = tmp as! [[String:Any]]
                }
                catch {
                    // manejar el error
                    print (error.localizedDescription)
                }
            }
        }

}
