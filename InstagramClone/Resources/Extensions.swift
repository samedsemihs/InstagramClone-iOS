//
//  Extensions.swift
//  InstagramClone
//
//  Created by Samed Semih Sürmeli on 11.03.2022.
//

import UIKit

extension UIView {
    
    //height, width, top, bottom, left, right
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    
}
