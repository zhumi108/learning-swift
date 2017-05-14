//
//  ViewController.swift
//  Detector
//
//  Created by Jeremy on 14/05/2017.
//  Copyright © 2017 zerogmi. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detect()
    }

    func detect() {
        guard let personCIImage = CIImage(image: imageView.image!) else {
            return
        }
        
        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        let faces = faceDetector?.features(in: personCIImage)
        
        //将Core Image坐标转换为UIView坐标
        let ciImageSize = personCIImage.extent.size
        var transform = CGAffineTransform(scaleX: 1, y: -1)
        transform = transform.translatedBy(x: 0, y: -ciImageSize.height)
        
        
        for face in faces as! [CIFaceFeature] {
            print("found bounds are \(face.bounds)")
            
            //实现坐标转换
            var faceViewBounds = face.bounds.applying(transform)
            
            //计算实际的位置和大小
            let viewSize = imageView.bounds.size
            
            let scale = min(viewSize.width / ciImageSize.width, viewSize.height / ciImageSize.height)
            
            //人脸识别程序应用于原始图像上，而原始图像有着比 imageView 更高的分辨率, 因此需要计算出 imageView 中识别到的人脸的实际位置和尺寸
            let offsetX = (viewSize.width - ciImageSize.width * scale) / 2
            let offsetY = (viewSize.height - ciImageSize.height * scale) / 2
            faceViewBounds = faceViewBounds.applying(CGAffineTransform(scaleX: scale, y: scale))
            faceViewBounds.origin.x += offsetX
            faceViewBounds.origin.y += offsetY
            
            let faceBox = UIView(frame: faceViewBounds)
            faceBox.layer.borderColor = UIColor.red.cgColor
            faceBox.layer.borderWidth = 3.0
            faceBox.backgroundColor = UIColor.clear
            imageView.addSubview(faceBox)
            
            if face.hasLeftEyePosition {
                print("Left EyePosition are \(face.leftEyePosition)")
            }
            
            if face.hasRightEyePosition {
                print("Right EyePosition are \(face.rightEyePosition)")
            }
        }
    }
}

