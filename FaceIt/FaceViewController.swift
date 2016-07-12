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
  
  private func updateUI() {
    
  }
}