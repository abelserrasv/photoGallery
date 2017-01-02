//
//  ASPhotoGalleryCollectionViewController.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit

/**
 
 - A UIViewController shouldn’t have more than 130 lines of code.
 - Most of the code inside the view controller is related to its root UIView customization.
 - It should be responsible for hooking up the controller with its root UIView, for example, calling a controller’s method on an IBAction.
 - Things like UITableDataSource, UITableViewDelegate and other delegates shouldn’t be inside it. If they are, it’s impossible to test them.
 - The data model (ASPhotoGalleryModel in this class) should be defined in one separated class.
 
 */

class ASPhotoGalleryCollectionViewController: UICollectionViewController {

    var galleryModel: ASPhotoGalleryModel?
    var collectionViewDataSource: ASPhotoGalleryCollectionViewDataSource?
    var collectionViewDelegate: ASPhotoGalleryCollectionViewDelegate?
    var photosManager : ASPhotoManagement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photosManager = ASPhotoManagement()
        
        // Dependency injection design pattern (constructor injection).
        self.galleryModel = ASPhotoGalleryModel(self.photosManager!)
        
        if let photoGalleryModel = galleryModel {
            collectionViewDataSource = ASPhotoGalleryCollectionViewDataSource(collectionView: self.collectionView!, galleryModel: photoGalleryModel)
            collectionViewDelegate = ASPhotoGalleryCollectionViewDelegate(collectionView: self.collectionView!, galleryModel: photoGalleryModel)
        }
        collectionView?.dataSource = collectionViewDataSource
        collectionView?.delegate = collectionViewDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
}
