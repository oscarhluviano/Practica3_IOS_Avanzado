//
//  SignupViewController.swift
//  Practica3
//
//  Created by Oscar Hernandez on 11/06/22.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPswd: UITextField!
    
    
    @IBAction func Signup(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.txtEmail.text!, password: self.txtPswd.text!) { auth, error in
            if error != nil {
                print ("ocurrió un error \(error!.localizedDescription)")
            }else{
                self.performSegue(withIdentifier: "goLogin", sender: nil)
                print("Exito")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
