//
//  ASPhotoGalleryCollectionViewController.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ASPhotoGalleryCollectionViewController: UICollectionViewController {

    var galleryModel: ASPhotoGalleryModel?
    var collectionViewDataSource: ASPhotoGalleryCollectionViewDataSource?
    var collectionViewDelegate: ASPhotoGalleryCollectionViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryModel = ASPhotoGalleryModel()
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
