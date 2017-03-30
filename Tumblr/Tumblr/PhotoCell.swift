//
//  PhotoCell.swift
//  Tumblr
//
//  Created by Wieniek Sliwinski on 3/30/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

  
  @IBOutlet weak var photoImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
