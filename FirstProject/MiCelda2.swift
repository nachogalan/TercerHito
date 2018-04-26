//
//  MiCelda2.swift
//  FirstProject
//
//  Created by IGNACIO GALAN DE PINA on 5/4/18.
//  Copyright © 2018 IGNACIO GALAN DE PINA. All rights reserved.
//

import UIKit

class MiCelda2: UICollectionViewCell {
    @IBOutlet var imgMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    var imagenDescargada:UIImage?
}
//func mostrarImagen(uri:String){
//    self.imgMain?.image = nil
//    // if(imagenDescargada==nil){
//    let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
//    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
//    gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
//        if error != nil {
//            // Uh-oh, an error occurred!
//        } else {
//            // Data for "images/island.jpg" is returned
//            //let image = UIImage(data: data!)
//            self.imagenDescargada = UIImage(data: data!)
//            self.imgMain?.image = self.imagenDescargada
//        }
//    }
//    //  }
//
//}
