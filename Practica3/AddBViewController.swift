//
//  AddBViewController.swift
//  Practica3
//
//  Created by Oscar Hernandez on 08/04/22.
//

import UIKit
import CoreData
import FirebaseAuth

class AddBViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var datos = [Drinks]()
    
    var plst = [[String:Any]]()
    
    @IBAction func btnLogout(_ sender: Any) {
        
        // TODO: Confirmar si de verdad quiere cerrar sesion
        let alert = UIAlertController(title: "", message: "Desea salir de la App?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "NO", style:.cancel, handler: nil))
        let btnNo = UIAlertAction(title: "SI", style:.destructive) { action in
            do {
                try Auth.auth().signOut()
                // Obtenemos una referencia al SceneDelegate:
                // Podria haber mas de una escena en iPad OS o en Mac OS
                let escena = UIApplication.shared.connectedScenes.first
                let sd = escena?.delegate as! SceneDelegate
                sd.cambiarVistaA("")
                self.performSegue(withIdentifier: "goLogin", sender: nil)
                print ("cerrar sesion")
            }
            catch {
                print("Error")
            }
        }
        alert.addAction(btnNo)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvInstructions: UITextView!
    
    
    
    @IBAction func addElement(_ sender: Any) {
        
        if tvName.text != "" && tvIngredients.text != "" && tvInstructions.text != ""{
            createDrink(name: tvName.text ?? "", ing: tvIngredients.text ?? "", instru: tvInstructions.text ?? "")
            tvName.text = ""
            tvIngredients.text = ""
            tvInstructions.text = ""
            let alertController = UIAlertController(title: "Éxito", message:
                    "Se agregó elemento", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alertController, animated: true, completion: nil)
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
        addElementsPlist()
        
        // Do any additional setup after loading the view.
    }
    
    func createDrink(name: String, ing: String, instru: String, img: String = "drink.png"){
        let newDrink = Drinks(context: context)
        newDrink.name = name
        newDrink.ingredients = ing
        newDrink.instructions = instru
        newDrink.image = img
        do{
            try context.save()
        }catch{
            
        }
    }
    
    func addElementsPlist(){
        do{
            datos = try context.fetch(Drinks.fetchRequest())
            if datos.count == 0 {
                obtenPlt()
                print("hola")
                print(plst.count)
                for i in 0..<(plst.count){
                        let dato = plst[i]
                    createDrink(name: (dato["name"] as? String) ?? "", ing: (dato["ingredients"] as? String) ?? "", instru: (dato["directions"] as? String) ?? "", img: (dato["image"] as? String) ?? "")
                }
            }
            print("exito")
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
