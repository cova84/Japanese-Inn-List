//
//  Childs3rdStageTableViewCell.swift
//  Expandable3
//
//  Created by MAC241 on 11/05/17.
//  Copyright © 2017 KiranJasvanee. All rights reserved.
//

import UIKit

class Childs3rdStageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageviewBackground: UIImageView!

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var buttonState: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageviewBackground.layer.cornerRadius = 2.0
        imageviewBackground.layer.masksToBounds = true
    }

    func cellFillUp(indexParam: String, tupleCount: NSInteger) {
        
        if tupleCount == 5 {
            imageviewBackground.backgroundColor = UIColor(red: 11.0/255.0, green: 186/255.0, blue: 255.0/255.0, alpha: 1.0)
//            constraintLabelTitle.constant = 94
        }else if tupleCount == 6 {
            imageviewBackground.backgroundColor = UIColor(red: 11.0/255.0, green: 186/255.0, blue: 255.0/255.0, alpha: 1.0)
//            constraintLabelTitle.constant = 112
        }else if tupleCount == 7 {
            imageviewBackground.backgroundColor = UIColor(red: 11.0/255.0, green: 186/255.0, blue: 255.0/255.0, alpha: 1.0)
//            constraintLabelTitle.constant = 136
        }else{
            imageviewBackground.backgroundColor = UIColor(red: 255.0/255.0, green: 105.0/255.0, blue: 105.0/255.0, alpha: 1.0)
//            constraintLabelTitle.constant = 56
        }
        labelTitle.textColor = UIColor.white
        
        labelTitle.text = "ハムステッドグリーン・ゲストハウス"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
