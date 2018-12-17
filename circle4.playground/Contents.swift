

import UIKit
import PlaygroundSupport

class MyView:UIView{
    
    override func draw(_ rect: CGRect) {
        
        let path=UIBezierPath(ovalIn: rect)
        UIColor.red.setStroke(); //红色边界
        path.stroke()
        UIColor.yellow.setFill() //黄色填充
        path.fill()
        
    }
}

class MyViewController : UIViewController {
        
        override func loadView() {
            let view = UIView(frame:CGRect(x:0,y:0,width:400,height:1000))
            view.backgroundColor = .white
            let label = UILabel()
            label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
            
            label.text = "Hello World!"
            label.textColor = .black
            
            view.addSubview(label)
            
            let oval=MyView(frame:CGRect(x:100,y:500,width:150,height:100))
            
            
            oval.backgroundColor=UIColor.purple
            
            
            view.addSubview(oval)
            
            let circle = MyView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
            
            circle.backgroundColor = UIColor.clear
            
            view.addSubview(circle)
            
            
            
        }
}
        
        

