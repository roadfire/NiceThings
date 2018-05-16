//
//  UIView+loadNib.swift
//
//  Created by Dae Melchi on 9/27/17.
//

import Foundation
import UIKit

extension UIView {
    
    /** 
      Loads instance from nib with the same name. 

      To use: 
         1. Create `class YourView: UIView`
         2. Create YourView.xib
         3. Populate YourView.xib with one UIView. Set the class on the UIView to YourView.
         4. In code call `YourView().loadNib()` to instantiate your view.
    */
    func loadNib<T: UIView>() -> T {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! T
    }
}
