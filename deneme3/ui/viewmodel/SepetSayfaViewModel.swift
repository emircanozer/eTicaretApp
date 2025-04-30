//
//  SepetSayfaViewModel.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import Foundation
import RxSwift
import Alamofire

class SepetSayfaViewModel {
    
    var urepo = UrunlerDaoRepository()
    
    var  UrunlerListesiTwo = BehaviorSubject<[SepetUrunler]>(value: [SepetUrunler]())
    
    init(){
        
        UrunlerListesiTwo = urepo.UrunlerListesiTwo
        
        
    }
    
    func sepeteUrunEkleme(ad: String, resim: String,kategori:String, marka:String ,fiyat: Int, siparisAdet: Int, kullaniciAdi: String){
        urepo.sepeteUrunEkleme(ad: ad, resim: resim, kategori: kategori, fiyat: fiyat, marka: marka, siparisAdeti: siparisAdet, kullaniciAdi: "emircan_ozer")
    }
    
    func sepettekiUrunleriGetir(kullaniciAdi:String){
        urepo.sepettekiUrunleriGetir(kullaniciAdi: kullaniciAdi)
        
    }
    
    func urunleriSil(sepetId:Int,kullaniciAdi:String){
        
        urepo.urunleriSil(sepetId: sepetId, kullaniciAdi: kullaniciAdi)
      
        
        
        
    }
    
}
