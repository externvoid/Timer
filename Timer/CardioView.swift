//
//  CardioView.swift
//  Timer
import UIKit

class CardioView: UIView {
  let line = UIBezierPath()
  var cnt: Int = 0
  let string = "Heart Beat Transition"

  override func draw(_ rect: CGRect) {
    line.stroke()
    cnt += 1
    print("cnt =", cnt)
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 36)!,
                 NSParagraphStyleAttributeName: paragraphStyle]
    let fmt: DateFormatter = DateFormatter()
    fmt.dateFormat = "yyyy年MM月dd日 \nHH時mm分ss秒"
    let t = fmt.string(from: Date())
    (string + "\n" + t).draw(with: CGRect(x: 12, y: 12, width: 400, height: 200),
                             options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
  }
}
