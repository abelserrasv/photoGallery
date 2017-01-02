//
//  ASPhotoManagement.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit
import Photos

class ASPhotoManagement: NSObject {
    
    private(set) public var fetchResults: PHFetchResult<PHAsset>?
    
    override init() {
        super.init()
        self.fetchResults = self.getPhotosFromGallery()
    }
    
    func getPhotosFromGallery() -> PHFetchResult<PHAsset> {
        let allPhotosOptions = PHFetchOptions()
        
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        return PHAsset.fetchAssets(with: allPhotosOptions)
    }
    
}
