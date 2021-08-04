//
//  Extension.swift
//  instagram
//
//  Created by 박준영 on 2021/08/04.
//

import UIKit

extension UIView {
    
    public var width : CGFloat {
        return frame.size.width        //frame은 UIView의 프로퍼티, 그리고 CGRect구조체의 상속? 을 받고 있다.
    }
    public var height : CGFloat {
        return frame.size.height
    }
    public var top : CGFloat {
        return frame.origin.y           //origin은 CGRect의 프로퍼티이고 좌표임
    }
    public var bottom : CGFloat {
        return frame.origin.y + frame.size.height
    }
    public var left : CGFloat {
        return frame.origin.x
    }
    public var right : CGFloat {
        return frame.origin.x + frame.size.width
    }
}

