//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Wieniek Sliwinski on 3/30/17.
//  Copyright © 2017 Home User. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var posts: [NSDictionary] = []
  
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 240
    
    let url = URL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")
    let request = URLRequest(url: url!)
    let session = URLSession(
      configuration: URLSessionConfiguration.default,
      delegate:nil,
      delegateQueue:OperationQueue.main
    )
    
    let task : URLSessionDataTask = session.dataTask(
      with: request as URLRequest,
      completionHandler: { (data, response, error) in
        if let data = data {
          if let responseDictionary = try! JSONSerialization.jsonObject(
            with: data, options:[]) as? NSDictionary {
            //print("responseDictionary: \(responseDictionary)")
            // Recall there are two fields in the response dictionary, 'meta' and 'response'.
            // This is how we get the 'response' field
            let responseFieldDictionary = responseDictionary["response"] as! NSDictionary
            self.posts = responseFieldDictionary["posts"] as! [NSDictionary]
            self.tableView.reloadData()
          }
        }
    });
    task.resume()
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
    let post = posts[indexPath.row]
    if let photos = post.value(forKeyPath: "photos") as? [NSDictionary] {
      let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
      if let imageUrl = URL(string: imageUrlString!) {
        cell.photoImageView.setImageWith(imageUrl)
      }
    }
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
  }
}
