//
//  SentMemesTableViewController.swift
//  memekss
//
//  Created by Kathleen Stukenborg on 4/10/16.
//  Copyright © 2016 Kathleen Stukenborg. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableViewController: UITableViewController {
    
    var memes: [Meme]{
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
       
   // let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        
    }
    override func viewDidAppear(animated: Bool) {
        print("in viewDidAppear")
        self.tableView.reloadData()
        print("memes.count is \(memes.count)")
    }
    
    // MARK: Table View Data Source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (memes)
        return self.memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ViewCellTable")!
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText + " " + meme.bottomText
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.displayMeme  = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
  /*  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     
        if editingStyle == UITableViewCellEditingStyle.Delete {
        //memes.removeAtIndex(indexPath.row)
            appDelegate.memes.removeAtIndex(indexPath.row)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
       
        }*/
    
    
    
    

}