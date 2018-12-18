//
//  Apps.swift
//  iOS_HW01
//
//  Created by Prerana Singh on 11/5/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//

import Foundation

class Apps{
    var title:String = ""
    var developer:String=""
    var imgSmallUrl:String=""
    var imgLargeUrl:String? 
    var price:String=""
    var releaseDate:String = ""
    var summary:String?
    var category:String = ""
    
    init(title:String,developer:String,imgSmallUrl:String,imgLargeUrl:String,price:String,releaseDate:String,summary:String,category:String) {
        self.title=title
        self.developer=developer
        self.imgSmallUrl=imgSmallUrl
        self.imgLargeUrl=imgLargeUrl
        self.price=price
        self.releaseDate = releaseDate
        self.summary = summary
        self.category = category
    }
    
    init() {}
    
    var description:String{
        return "\(title),\(developer),\(imgSmallUrl),\(String(describing: imgLargeUrl)),\(price),\(releaseDate),\(String(describing: summary)),\(category)"
    }
    
    
}
