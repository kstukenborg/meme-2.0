//
//  SentMemesCollectionViewController.swift
//  memekss
//
//  Created by Kathleen Stukenborg on 4/9/16.
//  Copyright © 2016 Kathleen Stukenborg. All rights reserved.
//

import Foundation
import UIKit
import Darwin
//This class handles the sent memes that are stored in a collection grid.
class SentMemesCollectionViewController : UICollectionViewController {
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    @IBAction func exitApplicaton(sender: AnyObject) {
        exit(0)
    }
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2*space)) / 3.0
        let height = (self.view.frame.size.height - ( 2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, height)
        
    }
   
    override func viewDidAppear(animated: Bool) {
        collectionView?.reloadData()
        navigationController?.navigationBarHidden = false

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SentMemesViewCell", forIndexPath: indexPath) as! SentMemesViewCell
        let meme = memes[indexPath.item]
        let imageView = UIImageView(image: meme.memedImage)
        cell.backgroundView = imageView
        return cell
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
       override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.displayMeme = memes[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
    }


    
}
