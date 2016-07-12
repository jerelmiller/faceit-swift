//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Jerel Miller on 7/12/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
  private let emotionalFaces: [String: FacialExpression] = [
    "angry": FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
    "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
    "worried": FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
    "mischievious": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin)
  ]
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let faceVC = segue.destinationViewController as? FaceViewController {
      if let identifier = segue.identifier {
        if let expression = emotionalFaces[identifier] {
          faceVC.expression = expression
        }
      }
    }
  }
}