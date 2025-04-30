//
//  ViewController.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import UIKit
import Kingfisher


class Anasayfa: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var viewModel = AnasayfaViewModel()
    
    var UrunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        _ = viewModel.UrunlerListesi.subscribe(onNext: { liste in
            self.UrunlerListesi = liste
            self.collectionView.reloadData()
            
        })
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        
        collectionView.collectionViewLayout = tasarim
        
    }
    


}

extension Anasayfa : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        UrunlerListesi.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let urun = UrunlerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier:"yemeklerhucre" , for: indexPath) as! UrunlerHucre
        
        
        if let url = URL(string: "http://kasimadalan.pe.hu/urunler/resimler/\(urun.resim!)") {
            DispatchQueue.main.async {
                hucre.imageView.kf.setImage(with: url)
            }
        }
        
        hucre.labelfiyat.text = "\(urun.fiyat!) ₺"
        hucre.labelisim.text = urun.ad
        
        hucre.layer.cornerRadius = 10.0
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        
        
        return hucre
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = UrunlerListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: yemek)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun =  sender  as? Urunler {
                
                let gidilecekVC  = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
            
              
            }
        }
    }
}

