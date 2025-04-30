//
//  AnasayfaViewModel.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import Foundation
import RxSwift


class AnasayfaViewModel {
    
  var  urepo  = UrunlerDaoRepository()
    
    var UrunlerListesi = BehaviorSubject<[Urunler]>(value: [Urunler]())
    
    init(){
        UrunlerListesi = urepo.UrunlerListesi
        urunleriYukle()
    }
    
    
    func urunleriYukle() {
        urepo.urunleriYukle()
       
        
    }
    
    func sepeteUrunEkle(ad:String, resim:String, fiyat:Int, siparisAdet:Int, kullaniciAdi:String){
        urepo.urunleriYukle()
    }
    
    
    
}
