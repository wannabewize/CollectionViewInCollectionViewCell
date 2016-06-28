//
//  SubCollectionViewController.swift
//  CollectionViewInCell
//
//  Created by wannabewize on 2016. 6. 29..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SubCell : UICollectionViewCell {
   @IBOutlet var label : UILabel!
}

class EmbedCollectionViewController: UICollectionViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   
   override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 100
   }
   
   override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SUB_CELL", forIndexPath: indexPath) as! SubCell
      cell.label.text = "Embed Cell \(indexPath.item)"
      return cell
   }
}
