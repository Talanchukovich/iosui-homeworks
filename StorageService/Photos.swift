//
//  Photos.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 25.10.2022.
//

import UIKit

public class Photos {
    
    public var photosName: [String] = {
        var photosName: [String] = []
        for i in 0...19 {
            photosName.append(String(i+1))
        }
        return photosName
    }()
    
    public init() {}
}
