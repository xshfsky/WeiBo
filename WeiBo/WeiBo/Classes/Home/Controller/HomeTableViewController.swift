//
//  HomeTableViewController.swift
//  WeiBo
//
//  Created by Miller on 15/9/26.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if isLogin == false {
            visiterView?.setVisterViewInfo(true, imageNamed: "visitordiscover_feed_image_house", title: "关注一些人，回这里看看有什么惊喜")
            return
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(target: self, action: Selector("leftBtnClick:"), imageNamed: "navigationbar_friendattention")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(target: self, action: Selector("rightBtnClick:"), imageNamed: "navigationbar_pop")
        let titleBtn = TitleButton(type: UIButtonType.Custom)
        titleBtn.setTitle("自我修养  ", forState: UIControlState.Normal)
        titleBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        titleBtn.setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Normal)
        titleBtn.setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Selected)
        titleBtn.addTarget(self, action: Selector("titleBtnClick:"), forControlEvents: UIControlEvents.TouchDown)
        titleBtn.sizeToFit()
        self.navigationItem.titleView = titleBtn
    }

    func titleBtnClick(btn: UIButton) {
        btn.selected = !btn.selected
        YFLog(__FUNCTION__)
    }
    func leftBtnClick(btn: UIButton) {
        YFLog(__FUNCTION__)
    }
    
    func rightBtnClick(btn: UIButton) {
        YFLog(__FUNCTION__)
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
