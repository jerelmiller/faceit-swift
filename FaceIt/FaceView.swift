//
//  FaceView.swift
//  FaceIt
//
//  Created by Jerel Miller on 7/11/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class FaceView: UIView {
  var scale: CGFloat = 0.90
  
  private var skullRadius: CGFloat {
    return min(bounds.size.width, bounds.size.height) / 2 * scale
  }
  
  private var skullCenter: CGPoint {
    return CGPoint(x: bounds.midX, y: bounds.midY)
  }
  
  override func drawRect(rect: CGRect) {
    let skull = UIBezierPath(
      arcCenter: skullCenter,
      radius: skullRadius,
      startAngle: 0.0,
      endAngle: CGFloat(2 * M_PI),
      clockwise: true
    )
    
    skull.lineWidth = 5.0
    UIColor.blueColor().set()
    skull.stroke()
  }
}