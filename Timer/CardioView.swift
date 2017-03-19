//
//  CardioView.swift
//  Timer
import UIKit
@IBDesignable
class CardioView: UIView {
  @IBInspectable var cornerRadius: CGFloat = 10.0
  let line = UIBezierPath()
  var ar: [Int] = []
  var cnt: Int = 0
  let string = "Heart Beat Transition"

  override func draw(_ rect: CGRect) {
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = (cornerRadius > 0)
    print("UIView#draw")
    line.stroke()
//    cnt += 1
//    print("cnt =", cnt)
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    let attrs = [NSFontAttributeName: UIFont(name: "Hiragino Sans", size: 24)!,
//    let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 24)!,
                 NSParagraphStyleAttributeName: paragraphStyle]
    let fmt: DateFormatter = DateFormatter()
    fmt.dateFormat = "yyyy年MM月dd日 \nHH時mm分ss秒"
    let t = fmt.string(from: Date())
    (string + "\n" + t)
      .draw(with: CGRect(x: 12, y: 12, width: 400, height: 200),
                             options: .usesLineFragmentOrigin,
                             attributes: attrs, context: nil)
  }
}
