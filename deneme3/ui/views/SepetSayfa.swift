//
//  SepetSayfa.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import UIKit
import Kingfisher

class SepetSayfa: UIViewController {
    
    var viewModel = SepetSayfaViewModel()
    
    var UrunlerListesiTwo = [SepetUrunler]()
    
    var veri : SepetUrunlerCevap?

    @IBOutlet var tableView: UITableView!
    @IBOutlet var labelToplamUcret: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        hesaplaVeGuncelleToplamFiyat()
        
        _ = viewModel.UrunlerListesiTwo.subscribe(onNext: { liste in
            
            self.UrunlerListesiTwo = liste
            DispatchQueue.main.async {
                self.hesaplaVeGuncelleToplamFiyat()
                self.tableView.reloadData()
               
                
            }
            
        })
        
        

       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        viewModel.sepettekiUrunleriGetir(kullaniciAdi: "emircan_ozer")
        hesaplaVeGuncelleToplamFiyat()
        
        
    }
    

   
    @IBAction func ButtonSepetOnayla(_ sender: Any) {
        
        let alert = UIAlertController(title: "Tebrikler 🥳", message: "Siparişiniz oluşturulmuştur ✅", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Onayla", style: .default)
        alert.addAction(okAction)
        
        present(alert,animated: true,completion: nil)
    }
    
    
    func hesaplaVeGuncelleToplamFiyat() {
        var toplamFiyat: Int = 0
        
        for urun in UrunlerListesiTwo {

            if let adet = urun.siparisAdeti, let fiyat = urun.fiyat {
                let urunFiyati = adet * fiyat
                toplamFiyat += urunFiyati
            }

        }
        
        // Sonuç olarak, toplamFiyat değişkeni tüm ürünlerin toplam fiyatını içerecektir.
        labelToplamUcret.text = "\(toplamFiyat) ₺"
    }
    
    
    
    
    
    
}


extension SepetSayfa : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UrunlerListesiTwo.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let urun = UrunlerListesiTwo[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepethucre", for: indexPath) as! SepetHucre
        
        hucre.labelFiyat.text = "\(urun.fiyat!) ₺"
        if let ad = urun.ad, let adet = urun.siparisAdeti {
            hucre.labelisim.text = "\(ad) - Adet: \(adet)"
        }

        
        if let adet = (urun.siparisAdeti), let fiyat = urun.fiyat {
            hesaplaVeGuncelleToplamFiyat()
            
        }
        
        
        
        if let url = URL(string:"http://kasimadalan.pe.hu/urunler/resimler/\(urun.resim!)") {
            DispatchQueue.main.async {
                hucre.SepetView.kf.setImage(with: url)
            }
        }
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            contextualAction, view, bool in
            
            let urun = self.UrunlerListesiTwo[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(urun.ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                self.viewModel.urunleriSil(sepetId: (urun.sepetId!), kullaniciAdi: "emircan_ozer")
                self.viewModel.sepettekiUrunleriGetir(kullaniciAdi: "emircan_ozer")
                    self.hesaplaVeGuncelleToplamFiyat()
                
             
              
                
          
            }
            self.hesaplaVeGuncelleToplamFiyat()
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        self.hesaplaVeGuncelleToplamFiyat()
        return UISwipeActionsConfiguration(actions: [silAction])
        
        
        
        
    }
}
