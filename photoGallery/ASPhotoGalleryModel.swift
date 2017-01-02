//
//  ASPhotoGalleryModel.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit
import Photos

class ASPhotoGalleryModel: NSObject {
    var photosManager : ASPhotoManagement
    
    override init() {
        self.photosManager = ASPhotoManagement()
    }
    
    func getFetchResultsFromGallery () -> PHFetchResult<PHAsset> {
        return photosManager.getPhotosFromGallery()
    }
}
