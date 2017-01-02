//
//  ASPhotoGalleryModel.swift
//  photoGallery
//
//  Created by Abel Serra on 02/01/17.
//  Copyright © 2017 Abel Serra. All rights reserved.
//

import UIKit
import Photos

/**
 Understand the responsibility of each object. Once you know that, start thinking about the code. 
 In this class I'm using the Single Responsability Principle and the dependency injection design pattern. I see specially important the DI pattern in terms of testability.
 
 The Single Responsibility Principle. (SRP)
 - A class should have only one reason to change.

 Dependency injection offers a number of benefits, but some of the more important ones are:
 
 - Clear declaration of dependencies It becomes obvious what an object needs in order to operate, and dangerous hidden dependencies (like globals) disappear.
 - Easy customization When creating an object, it’s easy to customize parts of the object for specific scenarios.
 - Clear ownership Particularly when using constructor injection, the object ownership rules are strictly enforced — helping to build a directed acyclic object graph.
 - Testability More than anything else, dependency injection improves the testability of your objects. Because they can be created simply by filling in the initializer, no hidden dependencies need to be managed. Furthermore, it becomes simple to mock out the dependencies to focus your tests on the object being tested.
 */

class ASPhotoGalleryModel: NSObject {
    var photosManager : ASPhotoManagement?
    
    override init() {
    }
    
    // Dependencies Allocated During Initialization
    // The photoManager is created before the gallery model and passed in
    // as a parameter, and the caller can customize it if desired.
    convenience init(_ photoManager : ASPhotoManagement) {
        self.init()
        self.photosManager = photoManager;
    }
    
    func getFetchResultsFromGallery () -> PHFetchResult<PHAsset> {
        return self.photosManager!.getPhotosFromGallery()
    }
}
