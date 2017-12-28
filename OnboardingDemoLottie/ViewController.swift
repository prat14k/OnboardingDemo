//
//  ViewController.swift
//  OnboardingDemoLottie
//
//  Created by Prateek Sharma on 20/12/17.
//  Copyright © 2017 Prateek Sharma. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView : UIScrollView!
    lazy var animationView : LOTAnimationView! = {
        let view = LOTAnimationView(name: "walkthrough")
        view.frame = CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 400)
        view.clipsToBounds = false
        view.contentMode = .scaleAspectFill
        
        view.loopAnimation = true
    
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animationView)
        
        setupScrollView()
    }
    
    func setupScrollView(){
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 6, height: self.scrollView.frame.size.height)
        
        for i in 0...5 {
            let label = UILabel()
            label.text = "Page \(i)"
            label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
            label.sizeToFit()
            label.center.y = scrollView.bounds.size.height / 2
            label.center.x = view.frame.size.width * CGFloat(i) + view.center.x
            scrollView.addSubview(label)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        var progress = scrollView.contentOffset.x / (scrollView.contentSize.width - self.view.frame.size.width)
//        if progress > 1 {
//            progress = 1
//        }
    
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView.animationProgress = progress
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        animationView.play()
    }
    
}

