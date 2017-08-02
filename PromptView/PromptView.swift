//
//  PromptView.swift
//  PromptView
//
//  Created by TKang on 2017. 8. 2..
//  Copyright © 2017년 HisTools. All rights reserved.
//

import UIKit

class PromptView {
    public static func show(with text:String, centerPoint:CGPoint?, textColor: UIColor?, font: UIFont? ,backgroundColor: UIColor?, maxAlpha: CGFloat?, duration: TimeInterval?, presentingView : UIView , completion:(() -> ())?) {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        
        if let textColor = textColor {
            label.textColor = textColor
        } else {
            label.textColor = UIColor.white
        }
        if let backgroundColor = backgroundColor {
            label.backgroundColor = backgroundColor
        } else {
            label.backgroundColor = backgroundColor
        }
        if let font = font {
            label.font = font
        }
        
        label.alpha = 0
        presentingView.addSubview(label)
        
        var duration = duration
        if duration == nil {
            duration = 2.0
        }
        
        var centerPoint = centerPoint
        if centerPoint == nil {
            centerPoint = CGPoint(x: UIScreen.main.bounds.width/2.0, y: UIScreen.main.bounds.height/5.0)
        }
        
        let textSize = label.intrinsicContentSize
        let labelSize = CGSize(width: textSize.width + 20.0, height: textSize.height + 5.0)
        
        label.frame = CGRect(origin: CGPoint.zero, size: labelSize)
        label.center = centerPoint!
        
        UIView.animateKeyframes(withDuration: duration!, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/10, animations: {
                if let maxAlpha = maxAlpha {
                    label.alpha = maxAlpha
                } else {
                    label.alpha = 1.0
                }
            })
            UIView.addKeyframe(withRelativeStartTime: 1/10, relativeDuration: 8/10, animations: {
                
            })
            UIView.addKeyframe(withRelativeStartTime: 9/10, relativeDuration: 1/10, animations: {
                label.alpha = 0.0
            })
        }) { (finished) in
            label.removeFromSuperview()
            completion?()
        }
    }
}
