//
//  ASPhotoGalleryCollectionViewDelegate.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit

class ASPhotoGalleryCollectionViewDelegate: NSObject {

    let photoGalleryModel: ASPhotoGalleryModel
    
    init(collectionView: UICollectionView, galleryModel: ASPhotoGalleryModel) {
        self.photoGalleryModel = galleryModel
        super.init()
        collectionView.delegate = self
    }
}

extension ASPhotoGalleryCollectionViewDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
}

extension ASPhotoGalleryCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect: CGRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let numberOfColumns : CGFloat = 4.0
        
        //Replace the divisor with the column count requirement. Make sure to have it in float.
        let cellWidth = (screenWidth - (numberOfColumns - 1)) / numberOfColumns
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
