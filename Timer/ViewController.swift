//
//  ViewController.swift
//  Timer
//
//  Created by Hiroshi Tanaka on 2017/03/15.
//  Copyright © 2017年 Hiroshi Tanaka. All rights reserved.
//

import UIKit
import Darwin
struct Step {
  var accm: Int = 60, ix: CGFloat = 5.0
  static let endPoint: CGFloat = 300.0
  
  static var step0 = {() -> Step in let s = 60, t = endPoint/CGFloat(s)
    return Step(accm: s, ix: t)}()
  static var step1 = {() -> Step in let s = 120, t = endPoint/CGFloat(s)
    return Step(accm: s, ix: t)}()
  static var step2 = {() -> Step in let s = 240, t = endPoint/CGFloat(s)
    return Step(accm: s, ix: t)}()
  static var step3 = {() -> Step in let s = 480, t = endPoint/CGFloat(s)
    return Step(accm: s, ix: t)}()
  static var step4 = {() -> Step in let s = 960, t = endPoint/CGFloat(s)
    return Step(accm: s, ix: t)}()
}



class ViewController: UIViewController {
  
  @IBOutlet weak var cardioView: CardioView!
//  let line = UIBezierPath()
  var ix: CGFloat = 0.0
  var cnt: Int = 0
  var idx_s: Int = 0 //step index
  let step = [Step.step0, Step.step1, Step.step2, Step.step3, Step.step4]

  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad")
    // Do any additional setup after loading the view, typically from a nib.
    cardioView.line.move(to: CGPoint(x: 0, y: 165))
    cardioView.line.lineWidth = step[0].ix
    cardioView.line.lineCapStyle = .round
    cardioView.line.lineJoinStyle = .round
  }
  override func viewDidLayoutSubviews() {
    
    //  ツールバーの配置。
//    var height = self.topLayoutGuide.length //  ステータスバーの高さを考慮する。
//    var frame = self.view.bounds
//    frame.origin.y += height
//    frame.size.height = 44
//    self.toolBar.frame = frame
//    height += frame.size.height
    _ = Timer.scheduledTimer(timeInterval: 0.2, target: self,
                         selector: #selector(ViewController.update(tm:)), userInfo: nil, repeats: true)
    print("viewDidLayoutSubviews")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
//  func update() {
  func update(tm: Timer) {
    idx_s = cnt2step(cnt)
    let iy: Int = Int(arc4random_uniform(30)) + 150
    cardioView.ar.append(iy)
    
    if [60, 120, 240, 480, 960].contains(where:{ $0 == cnt}) {
      cardioView.line.lineWidth = step[idx_s].ix
      cardioView.line.removeAllPoints()
      cardioView.line.move(to: CGPoint(x: 0, y: 165))
      ix = 0.0
//      var ix: CGFloat = 0.0
      Array(0..<cnt).forEach {iy in
        cardioView.line.addLine(to: CGPoint(x: ix,
                          y: CGFloat(cardioView.ar[iy])))
        ix += step[idx_s].ix
      }
    }
    cardioView.line.addLine(to: CGPoint(x: ix, y: CGFloat(iy)))
    ix += step[idx_s].ix
    cnt += 1
    cardioView.setNeedsDisplay()
    if cnt > 960 {
//      cardioView.transform = CGAffineTransform(scaleX: 0.5, y: 1.0)
      tm.invalidate()
    } else { print("cnt =", cnt) }
    
  }
  
  func cnt2step(_ cnt: Int) -> Int {
//    defer{cnt += 1}
    switch cnt {
    case  0...59 as ClosedRange: return 0
    case  60...119 as ClosedRange: return 1
    case  120...239 as ClosedRange: return 2
    case  240...479 as ClosedRange: return 3
    case  480...959 as ClosedRange: return 4
    default: return 4
    }
  }
  @IBAction func startHB(_ sender: Any) {
    print("OK")
  }
  @IBAction func stopHB(_ sender: Any) {
    print("NG")
  }
}
