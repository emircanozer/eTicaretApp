//
//  Yemekler.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import Foundation


class Urunler : Codable {
   
    
    var id : Int?
    var ad : String?
    var resim : String?
    var fiyat : Int?
    var kategori : String?
    var marka : String?
   
    
     init(id: Int, ad: String, resim: String, fiyat: Int, kategori: String, marka: String) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
        self.kategori = kategori
        self.marka = marka
    }
    
   
}
