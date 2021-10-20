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

