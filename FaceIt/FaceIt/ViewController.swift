//
//  ViewController.swift
//  FaceIt
//
//  Created by Jeremy on 18/05/2017.
//  Copyright © 2017 zerogmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            updateUI()
        }
    }
   
    var expression = FacialExpression(eyes: .open, mouth: .grin) {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI()
    {
        switch expression.eyes {
        case .closed:
            faceView?.eyesOpen = false
        case .open:
            faceView?.eyesOpen = true
        case .squinting:
            faceView?.eyesOpen = false
        }
        
        faceView?.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.grin: 0.5, .frown: -1.0, .smile: 1.0, .neutral: 0.0, .smirk: -0.5]
}

