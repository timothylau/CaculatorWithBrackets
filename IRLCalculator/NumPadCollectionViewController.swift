//
//  NumPadCollectionViewController.swift
//  IRLCalculator
//
//  Created by 刘立夫 on 06/04/2017.
//  Copyright © 2017 Taobao lnc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "button"
private var currentVerticalSizeClass: UIUserInterfaceSizeClass = UIUserInterfaceSizeClass.regular

class NumPadCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
      
      guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
        return
      }
      layout.minimumLineSpacing = 0
      layout.minimumInteritemSpacing = 0
      
      
      

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
  
  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    super.willTransition(to: newCollection, with: coordinator)
    currentVerticalSizeClass = newCollection.verticalSizeClass
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
      return
    }
    
    switch currentVerticalSizeClass {
    case .compact:
      flowLayout.itemSize = CGSize(width: view.frame.width/4, height: view.frame.height/5)
    default:
      flowLayout.itemSize = CGSize(width: view.frame.width/4, height: view.frame.height/5)
    }
  }

    // MARK: UICollectionViewDelegate

  
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
 

  
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

  
  
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
