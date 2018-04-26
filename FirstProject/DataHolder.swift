//
//  DataHolder.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 10/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class DataHolder: NSObject {

    static let sharedInstance:DataHolder = DataHolder()
    
    var fireStoreDB:Firestore?
    var miPerfil:Perfil = Perfil()
    var firStorage:Storage?
    var arUsuarios:[Perfil] = []
    var sNickname:String = "QWERTY@gmail.com"
    
    func initFireBase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
        
    }
    
    func descargarPerfiles(delegate:DataHolderDelegate){
       
        fireStoreDB?.collection("Perfiles").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaPerfilesCompleta!(blFin: false)
            } else {
                self.arUsuarios=[]
                for document in querySnapshot!.documents {
                    
                    let nombre:Perfil = Perfil()
                    nombre.setMap(valores: document.data())
                    self.arUsuarios.append(nombre)
                    
                    print("\(document.documentID) => \(document.data())")
                }
                print("------->>>>>> ",self.arUsuarios.count)
                delegate.DHDDescargaPerfilesCompleta!(blFin: true)
                //self.tbTablaChamp?.reloadData()
                //self.refreshUI()
                
                
                
            }
        }
      
    }

}


@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaPerfilesCompleta(blFin:Bool)
}


