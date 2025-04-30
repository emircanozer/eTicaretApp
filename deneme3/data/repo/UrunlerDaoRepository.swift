//
//  YemeklerDaoRepository.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import Foundation
import RxSwift
import Alamofire


class UrunlerDaoRepository {
    
    var UrunlerListesi = BehaviorSubject<[Urunler]>(value: [Urunler]())
    
    var UrunlerListesiTwo = BehaviorSubject<[SepetUrunler]>(value: [SepetUrunler]())
    
    func urunleriYukle(){
        
        AF.request("http://kasimadalan.pe.hu/urunler/tumUrunleriGetir.php",method: .get).response { response in
            if let data = response.data {
                
                do {
                    
                    let cevap = try JSONDecoder().decode(UrunlerCevap.self, from: data)
                    if let liste = cevap.urunler {
                        self.UrunlerListesi.onNext(liste)
                    }
                    
                    
                }catch{
                    print(error.localizedDescription)
                    
                }
                
            }

            
            
        }
        
        
    }
    
    func sepeteUrunEkleme( ad:String,resim:String,kategori:String,fiyat:Int,marka:String,siparisAdeti:Int,kullaniciAdi:String){
        
        let params :Parameters = ["ad":ad,"resim":resim,"fiyat":fiyat,"siparisAdeti":siparisAdeti,"kullaniciAdi":kullaniciAdi,"marka":marka,"kategori":kategori]
        
        AF.request("http://kasimadalan.pe.hu/urunler/sepeteUrunEkle.php",method: .post,parameters: params).response { response in
            
            if let data = response.data {
                do{
                    
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                    
                }
            }
                
            
        }
        
    }
    
    func sepettekiUrunleriGetir(kullaniciAdi:String){
        
        let params :Parameters = ["kullaniciAdi":kullaniciAdi]
        
        AF.request("http://kasimadalan.pe.hu/urunler/sepettekiUrunleriGetir.php",method: .post,parameters: params).response { Response in
            
            if let data = Response.data {
                
                do{
                    
                    let cevap = try JSONDecoder().decode(SepetUrunlerCevap.self, from: data)
                    if let liste = cevap.urunler_sepeti {
                        self.UrunlerListesiTwo.onNext(liste)
                    }
                    
                    
                }catch{
                    print(error.localizedDescription)
                    
                }
                
                
                
            }
            
        }
    }
    
    func urunleriSil(sepetId:Int,kullaniciAdi:String){
        
        let params : Parameters = ["sepetId":sepetId,"kullaniciAdi":kullaniciAdi]
        
        AF.request("http://kasimadalan.pe.hu/urunler/sepettenUrunSil.php",method: .post,parameters: params).response { response in
            
            
            if let data = response.data {
                
                
                do{
                    
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    self.urunleriYukle()
                    
                    
                    
                    
                }catch{
                    print(error.localizedDescription)
                    
                }
            }
                
        }
        
        
    }
    
    
}

