//
//  ViewController.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 22/3/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPassword:UITextField?
    @IBOutlet var btn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        /*
        do{
            try Auth.auth().signOut()
        } catch{
        
        }
 */
      
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//           if user != nil{
//                self.performSegue(withIdentifier: "transitionLogin", sender: self)
//            }
//        }
        txtUser?.text = DataHolder.sharedInstance.sNickname
        DataHolder.sharedInstance.sNickname = "123456"
        txtPassword?.text = DataHolder.sharedInstance.sNickname
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLoginEvent(){
        print("Hola " + (txtUser?.text)!)
        
        Auth.auth().signIn(withEmail: (txtUser?.text)!, password: (txtPassword?.text)!) { (user, error) in
            if user != nil{
                let ruta =
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!);
                ruta?.getDocument { (document, error) in
                    if document != nil {
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                     
                    } else {
                        print(error!)
                    }
                }
                self.performSegue(withIdentifier: "transitionLogin", sender: self)
            }
            else{
                print("NO SE HA LOGEADO!")
                print(error!)
            }
        }
        
//        if txtUser?.text == "nacho" && txtPassword?.text == "galan" {
//            self.performSegue(withIdentifier: "transitionLogin", sender: self)
//        }
        
    }
    
    
    
}

