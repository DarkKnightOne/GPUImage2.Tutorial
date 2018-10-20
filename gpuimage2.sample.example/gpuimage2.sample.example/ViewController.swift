//
//  ViewController.swift
//  gpuimage2.sample.example
//
//  Created by zhang.wenhai on 2018/10/20.
//  Copyright © 2018 com.niupai. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    
    private var input: PictureInput!
    private var output: RenderView!
    private var filter: SaturationAdjustment!
    
    
    private var image: UIImage = {
        let imgPath = Bundle.main.path(forResource: "sample", ofType: "jpg")!
        return UIImage(contentsOfFile: imgPath)!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        input = PictureInput(image: image)
        output = RenderView(frame: view.bounds)
        view.addSubview(output)
        
        filter = SaturationAdjustment()
        filter.saturation = 10.0
        input.addTarget(filter)
        filter.addTarget(output)
        input.processImage()
    }
}


