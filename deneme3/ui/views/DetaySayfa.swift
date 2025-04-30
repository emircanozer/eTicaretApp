//
//  DetaySayfa.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import UIKit
import Kingfisher

class DetaySayfa: UIViewController {
    
    var urun : Urunler?
    
    var viewModel = DetaySayfaViewModel()
    
    @IBOutlet weak var LabelToplamFiyat: UILabel!
    @IBOutlet weak var labelAdet: UILabel!
    @IBOutlet weak var labelisim: UILabel!
    @IBOutlet weak var labelfiyat: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelAdet.text = "0"
        LabelToplamFiyat.text = "0"
        
        if let y = urun {
            
            labelisim.text = y.ad
            labelfiyat.text = "\(y.fiyat!) ₺"
            
            if let url = URL(string: "http://kasimadalan.pe.hu/urunler/resimler/\(y.resim!)") {
                DispatchQueue.main.async {
                    self.imageView.kf.setImage(with: url)
                }
                
            }
        }
        
        
        
    }
    
    
    @IBAction func ButtonMinus(_ sender: Any) {
        if let currentValue = Int(labelAdet.text!),currentValue > 0  {
            labelAdet.text = "\(currentValue - 1)"
            updateTotalPrice()
            
            
        }
    }
    
    
    @IBAction func ButtonPlus(_ sender: Any) {
        
        if let currentValue = Int(labelAdet.text!) {
            labelAdet.text = "\(currentValue + 1)"
            
            updateTotalPrice()
            
            
        }
    }
    
    
    
    @IBAction func ButtonSepeteEkle(_ sender: Any) {
        
        
            let y = urun
            
        if let ya = y!.ad,let yad = Int(labelAdet.text!),let image = y!.resim,let urun_fiyat = (y!.fiyat), let kategori = y!.kategori, let marka = y!.marka {
                
            viewModel.sepeteUrunEkleme(ad: ya,kategori: kategori,resim: image, marka: marka, fiyat: urun_fiyat, siparisAdet: yad, kullaniciAdi: "emircan_ozer")
                print("ürün eklendi")
            
            
            let alert = UIAlertController(title: " Sepet", message: "\(y!.ad!) Sepete Eklendi ✅ ", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Onayla", style: .default)
            alert.addAction(okAction)
            
            present(alert,animated: true,completion: nil)
            
   
            
        }
            
        
    }
    
    
    @IBAction func ButtonSepetim(_ sender: Any) {
        
        performSegue(withIdentifier: "toSepet", sender: nil)
        
        
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSepet" {
            if let veri = sender as? SepetUrunlerCevap {
                let gidilecekVC = segue.destination as! SepetSayfa
                gidilecekVC.veri = veri
            }
        }
    }
    
    
    
    
    func updateTotalPrice(){
        
        if let y = urun {
            
            if let adet = Int(labelAdet.text!) {
                
                if let ürünfiyati = (y.fiyat) {
                    
                    let toplamFiyat = adet * ürünfiyati
                    
                    LabelToplamFiyat.text = "\(toplamFiyat) ₺"
                    
                }
            }
        }
    }
}
                                                            
                                                                   


