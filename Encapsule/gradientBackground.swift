//
//  ColorClass.swift
//  encapsuleTest
//
//  Created by Chow, Stephanie on 4/12/16.
//  Copyright © 2016 Encapsule Inc. All rights reserved.
//

import UIKit


extension CAGradientLayer {
    //Day Gradient
    func gradientColor() -> CAGradientLayer {
        let topColor = UIColor( red: (70/255.0), green: (99/255.0), blue: (145/255.0), alpha: 1)
        let bottomColor = UIColor( red: (222/255.0), green: (136/255.0), blue: (141/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0,1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
}


