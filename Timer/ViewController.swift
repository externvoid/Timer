//
//  ViewController.swift
//  Timer
//
//  Created by Hiroshi Tanaka on 2017/03/15.
//  Copyright © 2017年 Hiroshi Tanaka. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {
  
  @IBOutlet weak var cardioView: CardioView!
//  let line = UIBezierPath()
  var ix: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad")
    // Do any additional setup after loading the view, typically from a nib.
    cardioView.line.move(to: CGPoint(x: 0, y: 165))
    cardioView.line.lineWidth = 4
  }
  override func viewDidLayoutSubviews() {
    _ = Timer.scheduledTimer(timeInterval: 0.2, target: self,
                          selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    print("viewDidLayoutSubviews")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
//  func update() {
  func update(tm: Timer) {
    let iy: Int = Int(arc4random_uniform(30)) + 150
    cardioView.line.addLine(to: CGPoint(x: ix, y: iy))
    ix += 5
    cardioView.setNeedsDisplay()
    if ix > 300 {
//      cardioView.transform = CGAffineTransform(scaleX: 0.5, y: 1.0)
      tm.invalidate()
    } else { print("ix =", ix) }
    
  }
}
