//
//  FaceView.swift
//  FaceIt
//
//  Created by Jerel Miller on 7/11/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class FaceView: UIView {
  private struct Ratios {
    static let SkullRadiusToEyeOffset: CGFloat = 3
    static let SkullRadiusToEyeRadius: CGFloat = 10
    static let SkullRadiusToMouthWidth: CGFloat = 1
    static let SkullRadiusToMouthHeight: CGFloat = 3
    static let SkullRadiusToMouthOffset: CGFloat = 3
  }
  
  private enum Eye {
    case Left
    case Right
  }
  
  var scale: CGFloat = 0.90
  
  private var skullRadius: CGFloat {
    return min(bounds.size.width, bounds.size.height) / 2 * scale
  }
  
  private var skullCenter: CGPoint {
    return CGPoint(x: bounds.midX, y: bounds.midY)
  }
  
  override func drawRect(rect: CGRect) {
    UIColor.blueColor().set()
    pathForCircleCenteredAtPoint(skullCenter, withRadius: skullRadius).stroke()
    pathForEye(.Left).stroke()
    pathForEye(.Right).stroke()
  }
  
  private func pathForEye(eye: Eye) -> UIBezierPath {
    let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
    let eyeCenter = getEyeCenter(eye)
    
    return pathForCircleCenteredAtPoint(eyeCenter, withRadius: eyeRadius)
  }
  
  private func getEyeCenter(eye: Eye) -> CGPoint {
    let eyeOffset = skullRadius / Ratios.SkullRadiusToEyeOffset
    var eyeCenter = skullCenter
    eyeCenter.y -= eyeOffset
    
    switch eye {
    case .Left: eyeCenter.x -= eyeOffset
    case .Right: eyeCenter.x += eyeOffset
    }
    
    return eyeCenter
  }
  
  private func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius radius: CGFloat) -> UIBezierPath {
    let path = UIBezierPath(
      arcCenter: midPoint,
      radius: radius,
      startAngle: 0.0,
      endAngle: CGFloat(2 * M_PI),
      clockwise: true
    )
    
    path.lineWidth = 5.0
    
    return path
  }
}