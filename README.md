# PopCat

<br>

## 서비스 소개
유튜버 "개발자 라라" 님의 안드로이드 앱 PopCat을 아이폰에서도 사용하고 싶어서 만든 IOS 앱 입니다.


![um](https://user-images.githubusercontent.com/50768514/138035510-13d5dd3b-4c14-4cb1-8237-da11593fca98.jpg)

## POP

![POP](https://user-images.githubusercontent.com/50768514/138035513-e6a44709-035b-453d-b23c-4570a16a5029.jpg)

## 핵심 로직
---

```swift
//
//  ViewController.swift
//  PopCat
//
//  Created by 김준성 on 2021/01/20.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var popbtn: UIButton!
    var path = Bundle.main.path(forResource: "pop1.mp3", ofType: nil)!
    var count = 0
    var num = Int.random(in: 1...2)
    @IBOutlet weak var CatView: UIImageView!
    var soundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = UserDefaults.standard.integer(forKey: "countState")
        countLabel.text = ""
        countLabel.textColor = UIColor.white
        view.backgroundColor = UIColor.black
        
        CatView.animationImages = animatedImages(for: "catAni")
        CatView.image = CatView.animationImages?.first
    }
    
    @objc func touchToPop(gesture: UILongPressGestureRecognizer) {
        countLabel.text = String(count)
        
    }
    
    func animatedImages(for name: String) -> [UIImage] {
        var i = 0
        var images = [UIImage]()
        
        while let image = UIImage(named: "\(name)/\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
    @IBAction func touchdown(_ sender: Any) {
        CatView.image = CatView.animationImages?.last
    }
    
    @IBAction func touchup(_ sender: Any) {
        CatView.image = CatView.animationImages?.first
        countLabel.text = String(count)
        num = Int.random(in: 1...2)
        count += 1
        
        switch num {
        case 1:
            path = Bundle.main.path(forResource: "pop1.mp3", ofType: nil)!
        case 2:
            path = Bundle.main.path(forResource: "pop2.mp3", ofType: nil)!
        default:
            path = Bundle.main.path(forResource: "pop1.mp3", ofType: nil)!
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            soundEffect?.play()
        } catch {
            
        }
        UserDefaults.standard.set(count,forKey: "countState")
    }
    
}
