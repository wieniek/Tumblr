//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Wieniek Sliwinski on 3/30/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
  
  @IBOutlet weak var detailsImageView: UIImageView!
  
  var photoURL: URL?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let url = photoURL {
      detailsImageView.setImageWith(url)
    }
  }  
}
