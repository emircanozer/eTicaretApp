//
//  SepetYemekler.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import Foundation

class SepetUrunler : Codable {
    
    
    
    var sepetId : Int?
    var ad: String?
    var resim : String?
    var kategori : String?
    var marka : String?
    var fiyat :Int?
    var siparisAdeti :Int?
    var kullaniciAdi : String?
    
     init(sepetId: Int, ad: String, resim: String, kategori: String, marka: String, fiyat: Int, siparisAdeti: Int, kullaniciAdi: String) {
        self.sepetId = sepetId
        self.ad = ad
        self.resim = resim
        self.kategori = kategori
        self.marka = marka
        self.fiyat = fiyat
        self.siparisAdeti = siparisAdeti
        self.kullaniciAdi = kullaniciAdi
    }
    
    
    
   
    
}
