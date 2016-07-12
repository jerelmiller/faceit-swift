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
    didSet {
      addPinchGestureRecognizer()
      addSwipeUpGestureRecognizer()
      addSwipeDownGestureRecognizer()
      updateUI()
    }
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
  
  func increaseHappiness() {
    expression.mouth = expression.mouth.happierMouth()
  }
  
  func decreaseHappiness() {
    expression.mouth = expression.mouth.sadderMouth()
  }
  
  @IBAction func toggleEyes(recognizer: UITapGestureRecognizer) {
    if recognizer.state == .Ended {
      switch expression.eyes {
      case .Open: expression.eyes = .Closed
      case .Closed: expression.eyes = .Open
      case .Squinting: break
      }
    }
  }
  
  private func updateUI() {
    updateEyes()
    updateMouth()
    updateEyeBrows()
  }
  
  private func updateEyes() {
    switch expression.eyes {
    case .Open: faceView.eyesOpen = true
    case .Closed: faceView.eyesOpen = false
    case .Squinting: faceView.eyesOpen = false
    }
  }
  
  private func updateMouth() {
    faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
  }
  
  private func updateEyeBrows() {
    faceView.eyebrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
  }
  
  private func addPinchGestureRecognizer() {
    faceView.addGestureRecognizer(
      UIPinchGestureRecognizer(
        target: faceView,
        action: #selector(FaceView.changeScale(_:))
      )
    )
  }
  
  private func addSwipeUpGestureRecognizer() {
    let happierSwipeGestureRecognizer = UISwipeGestureRecognizer(
      target: self,
      action: #selector(FaceViewController.increaseHappiness)
    )
    happierSwipeGestureRecognizer.direction = .Up
    
    faceView.addGestureRecognizer(happierSwipeGestureRecognizer)
  }
  
  private func addSwipeDownGestureRecognizer() {
    let sadderSwipeGestureRecognizer = UISwipeGestureRecognizer(
      target: self,
      action: #selector(FaceViewController.decreaseHappiness)
    )
    sadderSwipeGestureRecognizer.direction = .Down
    
    faceView.addGestureRecognizer(sadderSwipeGestureRecognizer)
  }
}