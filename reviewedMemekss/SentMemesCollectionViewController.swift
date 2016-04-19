//
//  SentMemesCollectionViewController.swift
//  memekss
//
//  Created by Kathleen Stukenborg on 4/9/16.
//  Copyright © 2016 Kathleen Stukenborg. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController : UICollectionViewController {
    
   
   // let allMemes = [Meme]()
    //let allMemes = Meme.allMemes
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
   
    override func viewDidAppear(animated: Bool) {
       print("In viewDidAppear of SentMemesCollectoinViewController")
        self.collectionView?.reloadData()
        print("memes.count is \(memes.count)")

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
        print (memes)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SentMemesViewCell", forIndexPath: indexPath) as! SentMemesViewCell
        let meme = memes[indexPath.item]
        let imageView = UIImageView(image: meme.memedImage)
        cell.backgroundView = imageView
        
        return cell
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("memes.count is  \(memes.count)")
        return memes.count
    }
    
       override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.displayMeme = memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }


    
}
