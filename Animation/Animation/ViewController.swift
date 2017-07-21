//
//  ViewController.swift
//  Animation
//
//  Created by Daniel Hjärtström on 2017-07-21.
//  Copyright © 2017 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var constant: CGFloat = 8.0
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var colorView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = self.view.bounds.size.width
        screenHeight = self.view.bounds.size.height
        
        colorView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth / constant, height: screenWidth / constant))
        
        colorView?.backgroundColor = UIColor.green
        
        colorView?.layer.borderWidth = 0.5
        colorView?.layer.borderColor = UIColor.black.cgColor
        
        self.view.addSubview(colorView!)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        animate()
        
    }
    
    func seconds(second: Double) -> Double {
    
        return second / totalDuration
        
    }
    
    var rounds: Int = 1
    let totalDuration = 12.0

    func animate(){
        
        let square = self.screenWidth / self.constant
        let iterations = CGFloat(rounds)
        
        UIView.animateKeyframes(withDuration: totalDuration, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: self.seconds(second: 3), animations: {
                
                self.colorView?.frame.origin.x += self.view.frame.maxX - (square * iterations)
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: self.seconds(second: 3), relativeDuration: self.seconds(second: 3), animations: {
                
                self.colorView?.frame.origin.y += self.view.frame.maxY - (square * iterations)
                
            })
            
            UIView.addKeyframe(withRelativeStartTime: self.seconds(second: 6), relativeDuration: self.seconds(second: 3), animations: {
                
                self.colorView?.frame.origin.x -= self.view.frame.maxX - (square * iterations)
                
            })
           
            UIView.addKeyframe(withRelativeStartTime: self.seconds(second: 9), relativeDuration: self.seconds(second: 3), animations: {
                
                self.colorView?.frame.origin.y -= self.view.frame.maxY - (square * iterations)
                
            })
       
        }, completion: { (completion) in
    
            if self.rounds == 3 {
                
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

