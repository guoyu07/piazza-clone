//
//  Cell.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 9/29/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class CellWrapper: NSObject {
    var cell: AnyObject
    var identifier = ""
    
    init(cell: AnyObject, identifier: String = "cell") {
        self.cell = cell
        self.identifier = identifier
    }
}
