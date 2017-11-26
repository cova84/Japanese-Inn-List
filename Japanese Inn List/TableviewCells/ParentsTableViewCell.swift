//
//  ParentsTableViewCell.swift
//  Expandable3
//
//  Created by MAC241 on 11/05/17.
//  Copyright © 2017 KiranJasvanee. All rights reserved.
//

import UIKit

class ParentsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageviewBackground: UIImageView!
    @IBOutlet weak var constraintLeadingLabelParent: NSLayoutConstraint!
    @IBOutlet weak var labelParentCell: UILabel!
    
    @IBOutlet weak var buttonState: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageviewBackground.layer.cornerRadius = 2.0
        imageviewBackground.layer.masksToBounds = true
    }
    
    func cellFillUp(indexParam: String, tupleCount: NSInteger) {
        if tupleCount == 1 {
            labelParentCell.text = "北アメリカ"
            imageviewBackground.backgroundColor = UIColor(red: 45.0/255.0, green: 138.0/255.0, blue: 139.0/255.0, alpha: 1.0)
//            constraintLeadingLabelParent.constant = 16
        }else{
            labelParentCell.text = "北アジア〜東アジア〜東南アジア"
            imageviewBackground.backgroundColor = UIColor(red: 217.0/255.0, green: 127.0/255.0, blue: 37.0/255.0, alpha: 1.0)
//            constraintLeadingLabelParent.constant = 78
        }
        labelParentCell.textColor = UIColor.white

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
