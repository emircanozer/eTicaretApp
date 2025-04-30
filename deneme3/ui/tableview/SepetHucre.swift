//
//  SepetHucre.swift
//  deneme3
//
//  Created by Emircan Özer on 6.03.2024.
//

import UIKit

class SepetHucre: UITableViewCell {

    @IBOutlet var SepetView: UIImageView!
    
    
    @IBOutlet weak var labelisim: UILabel!
  
    @IBOutlet var labelFiyat: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    
    
    @IBAction func ButtonSepetOnayla(_ sender: Any) {
    }
}
