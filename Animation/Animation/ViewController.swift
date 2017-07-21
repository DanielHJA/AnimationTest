//
//  ViewController.swift
//  Animation
//
//  Created by Daniel Hjärtström on 2017-07-21.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var constant: CGFloat = 10.0
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var colorView: UIView?
    var layer: CAShapeLayer = CAShapeLayer()
    var path: UIBezierPath = UIBezierPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = self.view.bounds.size.width
        screenHeight = self.view.bounds.size.height
        
        colorView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth / constant, height: screenWidth / constant))
        
        colorView?.backgroundColor = UIColor.green

        self.view.addSubview(colorView!)
        
    }

    override func viewDidAppear(_ animated: Bool) {
    
        layer = CAShapeLayer()
        layer.strokeColor = UIColor.green.cgColor
        layer.lineWidth = 60
        layer.fillColor = UIColor.clear.cgColor

        var path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.view.frame.maxX, y: 0))
        path.addLine(to: CGPoint(x: self.view.frame.maxX, y: self.view.frame.maxY))
        path.addLine(to: CGPoint(x: 0, y: self.view.frame.maxY))
        path.close()
            
        layer.path = path.cgPath
        var animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = Float(0.0)
        animation.toValue = Float(1.0)
        animation.duration = 20.0
        layer.add(animation, forKey: "myStroke")

        view.layer.addSublayer(layer)

        animate()
        
    }
    
    func seconds(second: Double) -> Double {
    
        return second / totalDuration
        
    }
    
    var rounds: Int = 0
    let totalDuration = 20.0

    func animate(){
        
        let square = self.screenWidth / self.constant
        let iterations = CGFloat(rounds)
        
        UIView.animateKeyframes(withDuration: totalDuration, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: self.seconds(second: 3), animations: {
                
                self.colorView?.frame.origin.x = self.view.frame.maxX - square - (square * iterations)
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: self.seconds(second: 3), relativeDuration: self.seconds(second: 7), animations: {
                
                self.colorView?.frame.origin.y = self.view.frame.maxY - square - (square * iterations)
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: self.seconds(second: 10), relativeDuration: self.seconds(second: 3), animations: {
                
                self.colorView?.frame.origin.x = 0 + (square * iterations)
                
            })
           
            UIView.addKeyframe(withRelativeStartTime: self.seconds(second: 13), relativeDuration: self.seconds(second: 7), animations: {
                
                self.colorView?.frame.origin.y = 0 + (square * iterations)
                
            })
       
        }, completion: { (completion) in
    
            if self.rounds == 8 {
                print("done")
                return
           
            } else {
            
                self.rounds += 1
                
                self.animate()
                
            
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

