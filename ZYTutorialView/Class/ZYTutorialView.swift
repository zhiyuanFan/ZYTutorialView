//
//  ZYTutorialView.swift
//  ZYTutorialView
//
//  Created by Jason Fan on 14/08/2017.
//  Copyright © 2017 QooApp. All rights reserved.
//

import UIKit
import SnapKit

class ZYTutorialView: UIView {

    
    var maskLayer: CAShapeLayer?
    var models: [TutorialModel]!
    var tapIndex: Int = 0
    var lineView: UIImageView?
    var titleLabel: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(models: [TutorialModel]) {
        self.init(frame: UIScreen.main.bounds)
        self.models = models
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        maskLayer = CAShapeLayer()
        maskLayer?.fillRule = kCAFillRuleEvenOdd
        maskLayer?.fillColor = UIColor.black.cgColor
        guard let firstModel = models.first else {
            fatalError("init(models:) has not been implemented")
        }
        setupHighlight(model: firstModel, isFirst: true)
        layer.mask = maskLayer
        
        setupSubViews(model: firstModel)
        
        setupGesture()
    }
    
    func setupSubViews(model: TutorialModel) {
        var imageNameStr: String
        var alignment: NSTextAlignment = .left
        switch model.towards! {
        case .up:
            imageNameStr = "upLine"
            alignment = .center
        case .down:
            imageNameStr = "downLine"
            alignment = .center
        case .left:
            imageNameStr = "leftLine"
        case .right:
            imageNameStr = "rightLine"
        case .leftDown:
            imageNameStr = "leftDownLine"
            alignment = .right
        case .rightDown:
            imageNameStr = "rightDownLine"
        }
        lineView = UIImageView()
        lineView?.image = getLineImage(imageName: imageNameStr)
        self.addSubview(lineView!)
        
        titleLabel = UILabel()
        titleLabel?.text = model.title!
        titleLabel?.textAlignment = alignment
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        self.addSubview(titleLabel!)
        
        setupUI(model: model)
    }
    
    func setupUI(model: TutorialModel) {
        
        let centerX = (model.centerPoint?.x)!
        let centerY = (model.centerPoint?.y)!
        let isCloseToLeft: Bool = centerX < UIScreen.main.bounds.size.width/2
        let vHeight: CGFloat = 90.0; let vWidth: CGFloat = 20.0
        let hHeight: CGFloat = 30;   let hWidth: CGFloat = 80.0
        var isRect: Bool
        var size: CGSize = CGSize.zero
        var radius: CGFloat = 0
        
        if let r = model.radius {
            isRect = false
            radius = r
        } else {
            isRect = true
            size = model.size!
        }
        
        let kSin30: CGFloat = 0.5, kCos30: CGFloat = 0.87
        let rectW = size.width, rectH = size.height
        
        switch model.towards! {
        case .up:
            lineView?.snp.makeConstraints({ (make) in
                if isRect {
                    make.top.equalTo(centerY-rectH/2-vHeight)
                    make.centerX.equalTo(centerX)
                } else {
                    make.top.equalTo(centerY-radius-vHeight)
                    make.left.equalTo(centerX-vWidth/2)
                }
                make.size.equalTo(CGSize(width: vWidth, height: vHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.centerX.equalTo(centerX)
                make.bottom.equalTo((lineView?.snp.top)!)
                if isCloseToLeft {
                    make.left.equalTo(10)
                } else {
                    make.right.equalTo(-10)
                }
            })
        case .down:
            lineView?.snp.makeConstraints({ (make) in
                if isRect {
                    make.top.equalTo(centerY+rectH/2)
                    make.centerX.equalTo(centerX)
                } else {
                    make.top.equalTo(centerY+radius)
                    make.left.equalTo(centerX-vWidth/2)
                }
                make.size.equalTo(CGSize(width: vWidth, height: vHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.top.equalTo((lineView?.snp.bottom)!)
                make.centerX.equalTo(centerX)
                if isCloseToLeft {
                    make.left.equalTo(10)
                } else {
                    make.right.equalTo(-10)
                }
            })
        case .left:
            lineView?.snp.makeConstraints({ (make) in
                if isRect {
                    make.left.equalTo(centerX-rectW/2-hWidth)
                    make.top.equalTo(centerY-rectH/2-hHeight)
                } else {
                    make.left.equalTo(centerX-radius*kSin30-hWidth)
                    make.top.equalTo(centerY-radius*kCos30-hHeight)
                }
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.right.equalTo((lineView?.snp.left)!).offset(-5)
                make.left.equalTo(10)
                make.centerY.equalTo((lineView?.snp.top)!).offset(5)
            })
        case .right:
            lineView?.snp.makeConstraints({ (make) in
                if isRect {
                    make.left.equalTo(centerX+rectW/2)
                    make.top.equalTo(centerY-rectH/2-hHeight)
                } else {
                    make.left.equalTo(centerX+radius*kSin30)
                    make.top.equalTo(centerY-radius*kCos30-hHeight)
                }
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo((lineView?.snp.right)!).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo((lineView?.snp.top)!).offset(5)
            })
            
        case .leftDown:
            lineView?.snp.makeConstraints({ (make) in
                if isRect {
                    make.left.equalTo(centerX-rectW/2-hWidth)
                    make.top.equalTo(centerY+rectH/2)
                } else {
                    make.left.equalTo(centerX-radius*kSin30-hWidth)
                    make.top.equalTo(centerY+radius*kCos30)
                }
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.right.equalTo((lineView?.snp.left)!).offset(-5)
                make.left.equalTo(10)
                make.centerY.equalTo((lineView?.snp.bottom)!).offset(-5)
            })
        case .rightDown:
            lineView?.snp.makeConstraints({ (make) in
                if isRect {
                    make.left.equalTo(centerX+rectW/2)
                    make.top.equalTo(centerY+rectH/2)
                } else {
                    make.left.equalTo(centerX+radius*kSin30)
                    make.top.equalTo(centerY+radius*kCos30)
                }
                make.size.equalTo(CGSize(width: hWidth, height: hHeight))
            })
            
            titleLabel?.snp.makeConstraints({ (make) in
                make.left.equalTo((lineView?.snp.right)!).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo((lineView?.snp.bottom)!).offset(-5)
            })
        }
    }
    
    func setupHighlight(model: TutorialModel, isFirst: Bool = false) {
        
        let beginPath = isFirst ? getMaskPath(UIBezierPath(roundedRect: CGRect(origin: model.centerPoint!, size: CGSize.zero) , cornerRadius: 0)) : nil
        var endPath: UIBezierPath
        var origin: CGPoint
        let centerX = (model.centerPoint?.x)!
        let centerY = (model.centerPoint?.y)!
        
        if let raduis = model.radius {
            origin = CGPoint(x: centerX-raduis, y: centerY-raduis)
            endPath = getMaskPath(UIBezierPath(roundedRect: CGRect(origin: origin, size: CGSize(width: raduis*2, height: raduis*2)), cornerRadius: raduis))
            maskLayer?.add(pathAnimation(0.25, beginPath: beginPath, endPath: endPath), forKey: nil)
        }
        
        if let size = model.size {
            origin = CGPoint(x: centerX-size.width/2, y: centerY-size.height/2)
            endPath = getMaskPath(UIBezierPath(roundedRect: CGRect(origin: origin, size: size), cornerRadius: 5))
            maskLayer?.add(pathAnimation(0.25, beginPath: beginPath, endPath: endPath), forKey: nil)
        }
    }
    
    
    fileprivate func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(tap:)))
        self.addGestureRecognizer(gesture)
    }
    
    func viewTapped(tap: UITapGestureRecognizer) {
        
        if tapIndex < models.count - 1 {
            tapIndex += 1
        } else {
            self.removeFromSuperview()
        }
        
        let model = models[tapIndex]
        setupHighlight(model: model)
        
        self.lineView?.removeFromSuperview()
        self.titleLabel?.removeFromSuperview()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
            self.setupSubViews(model: model)
        }
    }
    
    
    fileprivate func getMaskPath(_ path: UIBezierPath) -> UIBezierPath {
        return [path].reduce(UIBezierPath(rect: UIScreen.main.bounds)) {
            $0.append($1)
            return $0
        }
    }
    
    fileprivate func pathAnimation(_ duration: TimeInterval, beginPath: UIBezierPath?, endPath: UIBezierPath) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.66, 0, 0.33, 1)
        if let path = beginPath {
            animation.fromValue = path.cgPath
        }
        animation.toValue = endPath.cgPath
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        return animation
    }
    
    
    fileprivate func getLineImage(imageName: String) -> UIImage {
        let imageStr = "LineDirection.bundle/Images/\(imageName)"
        return UIImage(named: imageStr)!
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

