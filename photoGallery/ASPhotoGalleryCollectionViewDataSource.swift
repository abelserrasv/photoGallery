//
//  ASPhotoGalleryCollectionViewDataSource.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "SMSGPhotoCellVC"

class ASPhotoGalleryCollectionViewDataSource: NSObject {
    let photosDisplayerModel: ASPhotoGalleryModel
    
    init(collectionView: UICollectionView, galleryModel: ASPhotoGalleryModel) {
        self.photosDisplayerModel = galleryModel
        super.init()
        collectionView.dataSource = self
    }
}

extension ASPhotoGalleryCollectionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosDisplayerModel.getFetchResultsFromGallery().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = photosDisplayerModel.getFetchResultsFromGallery()[indexPath.row]
        
        let finalRequestOptions = PHImageRequestOptions()
        
        let manager = PHImageManager.default()
        
        let initialRequestOptions = PHImageRequestOptions()
        initialRequestOptions.isSynchronous = true
        initialRequestOptions.resizeMode = .fast
        initialRequestOptions.deliveryMode = .fastFormat
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ASPhotoGalleryCollectionViewCell
        
        manager.requestImage(for: photoCell,
                             targetSize: PHImageManagerMaximumSize,
                             contentMode: .aspectFit,
                             options: finalRequestOptions) { (finalResult, _) in
                                cell.thumbnailImageView.image = finalResult
        }
        return cell
    }
}
