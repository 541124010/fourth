import UIKit


//: Playground - noun: a place where people can play

import UIKit

let fileManager=FileManager.default
let view=UIView(frame:CGRect(x:0,y:0,width:400,height:400))
var docPath=fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.path
let file=docPath.appending("/image")
print(file)
if !fileManager.fileExists(atPath: file){
    do{
        try fileManager.createDirectory(atPath: file, withIntermediateDirectories: true, attributes: nil)
        print("create sucees")
        
    }catch{
        print(error)
    
    }
    
}
else{
    let image=file.appending("/bd.png")
    //docPath.appendingPathComponent("bd.png")
    //print(docPath)
    if fileManager.fileExists(atPath: image){
        do{
            let data = try Data(contentsOf:URL(fileURLWithPath:image))//file适用于路径 string 适用于文件
            let img=UIImage(data:data)
            let imageView=UIImageView(image:img)
            imageView.frame=CGRect(x:0,y:100,width:400,height:300)
            view.addSubview(imageView)
            
        }catch{
            print(error)
        }
    }
    else{  //若不存在，则从网络下载一个图片并保存为图片文件
        let url=URL(string:"http://img.xmfish.com/attachment/Mon_1602/81_1549342_d0f3cfc4f8e18dc.jpg")!
//        try fileManager.createDirectory(atPath: docPath, withIntermediateDirectories: true, attributes: nil)
        do{
            let data=try Data(contentsOf:url)
            try data.write(to:URL(fileURLWithPath:image))
            print("文件不存在，已成功创建文件")
        }catch{
            
            print("wrong")
            print(error)
            
            
        }
    }
}
