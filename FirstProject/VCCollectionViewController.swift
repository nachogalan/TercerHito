//
//  VCCollectionViewController.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 5/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class VCCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var colPrincipal:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                DataHolder.sharedInstance.arUsuarios=[]
                for document in querySnapshot!.documents {
                    
                    let nombre:Perfil = Perfil()
                    nombre.setMap(valores: document.data())
                    DataHolder.sharedInstance.arUsuarios.append(nombre)
                    
                    print("\(document.documentID) => \(document.data())")
                }
                print("------->>>>>> ",DataHolder.sharedInstance.arUsuarios.count)
                self.colPrincipal?.reloadData()
                self.refreshUI()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("CONSULTO CANTIDAD DDE FILAS A PINTAR")
        return DataHolder.sharedInstance.arUsuarios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "IDmiCelda1", for: indexPath) as! MiCelda2
        celda.lblNombre?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sNombre
        
        return celda
    }
    
    func refreshUI() {
        DispatchQueue.main.async(execute: {
            self.colPrincipal?.reloadData()
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
