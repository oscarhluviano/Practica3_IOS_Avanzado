//
//  ViewController.swift
//  Practica3
//
//  Created by OhLuvi on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var datos = Drinks()
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textV: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textV.isEditable = false
        
        let nombre = datos.name
        let ingredientes = datos.ingredients
        let instruc = datos.instructions
        let img = UIImage(named: (datos.image)!) ?? UIImage()
        

        textV.text = "Nombre: \(nombre!)\n \n" +
        "Ingredientes: \(ingredientes!)\n \n"
        + "Instrucciones: \(instruc!)"
        imageV.image = img
        
        
    }


}

