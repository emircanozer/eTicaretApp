//
//  DetaySayfaViewModel.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//


import Foundation
import RxSwift


class DetaySayfaViewModel {
    
    var urepo = UrunlerDaoRepository()
    
    
    
    
    
    func sepeteUrunEkleme(ad:String,kategori:String,resim:String,marka:String,fiyat:Int,siparisAdet:Int,kullaniciAdi:String){
        
        urepo.sepeteUrunEkleme(ad: ad, resim: resim, kategori: kategori, fiyat: fiyat, marka: marka, siparisAdeti: siparisAdet, kullaniciAdi: kullaniciAdi)
        
        
    }
    
    
    
}
