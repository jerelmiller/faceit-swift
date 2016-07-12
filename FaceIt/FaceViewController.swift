//
//  ViewController.swift
//  FaceIt
//
//  Created by Jerel Miller on 7/11/16.
//  Copyright © 2016 Jerel Miller. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
  var expression = FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile) {
    didSet { updateUI() }
  }
  @IBOutlet weak var faceView: FaceView! {
    didSet { updateUI() }
  }
  
  private var mouthCurvatures = [
    FacialExpression.Mouth.Frown: -1.0,
    .Grin: 0.5,
    .Smile: 1.0,
    .Smirk: -0.5,
    .Neutral: 0.0
  ]
  
  private var eyeBrowTilts = [
    FacialExpression.EyeBrows.Relaxed: 0.5,
    .Furrowed: -0.5,
    .Normal: 0.0
  ]
  
  private func updateUI() {
    drawEyes()
    drawMouth()
    drawEyeBrows()
  }
  
  private func drawEyes() {
    switch expression.eyes {
    case .Open: faceView.eyesOpen = true
    case .Closed: faceView.eyesOpen = false
    case .Squinting: faceView.eyesOpen = false
    }
  }
  
  private func drawMouth() {
    faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
  }
  
  private func drawEyeBrows() {
    faceView.eyebrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
  }
}