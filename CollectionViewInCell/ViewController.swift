//
//  ViewController.swift
//  CollectionViewInCell
//
//  Created by wannabewize on 2016. 6. 29..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class MainCell : UICollectionViewCell {
   @IBOutlet var label : UILabel!
   @IBOutlet var container : UIView!
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
   var childVC = [NSIndexPath : UIViewController]()
   
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 100
   }
   
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MAIN_CELL", forIndexPath: indexPath) as! MainCell
      
      let subVC = self.storyboard?.instantiateViewControllerWithIdentifier("EMBED_VC") as! EmbedCollectionViewController
      
      self.addChildViewController(subVC)
      // for Remove
      childVC[indexPath] = subVC
      
      print("ChildVC count : ", self.childViewControllers.count)
      
      cell.label.text = "MainCell \(indexPath.item)"
      subVC.view.frame.size = cell.container.frame.size
      cell.container.addSubview(subVC.view)
      
      return cell
   }
   
   func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
      // For remove child vc
      let vc = childVC[indexPath]
      vc?.removeFromParentViewController()
   }
}

