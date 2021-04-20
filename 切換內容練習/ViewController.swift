//
//  ViewController.swift
//  切換內容練習
//
//  Created by 蔡佳穎 on 2021/4/19.
//

import UIKit

let lazyImages = ["seaOtter.JPG", "quokka.JPG", "stingray.JPG"]
let lazyLabels = ["醒醒啊", "要開心喔", "我好可愛"]
let pageNumberLabels = ["1", "2", "3"]

var selectIndex: Int = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    @IBOutlet weak var lazyLabel: UILabel!
    
    @IBOutlet weak var pageLabel: UILabel!
    
    @IBOutlet weak var pageDot: UIPageControl!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 59/255, green: 55/255, blue: 51/255, alpha: 1)
        animalImageView.layer.cornerRadius = 20
        animalImageView.clipsToBounds = true
        
        lazyLabel.text = lazyLabels[0]
        pageLabel.text = pageNumberLabels[0]
    }
    
    func sync() {
        animalImageView.image = UIImage(named: lazyImages[selectIndex])
        lazyLabel.text = lazyLabels[selectIndex]
        pageLabel.text = pageNumberLabels[selectIndex]
        pageDot.currentPage = selectIndex
        segment.selectedSegmentIndex = selectIndex
    }
    
    
    @IBAction func changePageDot(_ sender: UIPageControl) {
        selectIndex = sender.currentPage
        if pageDot.currentPage == 0 {
            selectIndex = 0
            sync()
        } else if pageDot.currentPage == 1 {
            selectIndex = 1
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        selectIndex = sender.selectedSegmentIndex
        if segment.selectedSegmentIndex == 0 {
            selectIndex = 0
            sync()
        } else if segment.selectedSegmentIndex == 1 {
            selectIndex = 1
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    

    @IBAction func lastButton(_ sender: UIButton) {
        selectIndex -= 1
        if selectIndex == 2 {
            
            sync()
        } else if selectIndex == 1 {
            sync()
        } else if selectIndex == 0 {
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        selectIndex += 1
        if selectIndex == 0 {
            sync()
        } else if selectIndex == 1 {
            sync()
        } else if selectIndex == 2 {
            sync()
        } else {
            selectIndex = 0
            sync()
        }
    }
    
    @IBAction func swipeChangePage(_ sender: UISwipeGestureRecognizer) {

        if sender.direction == .left {
            selectIndex += 1
            if selectIndex == 0 {
                sync()
            } else if selectIndex == 1 {
                sync()
            } else if selectIndex == 2 {
                sync()
            } else {
                selectIndex = 0
                sync()
            }
        } else if sender.direction == .right {
            selectIndex -= 1
            if selectIndex == 2 {
                sync()
            } else if selectIndex == 1 {
                sync()
            } else if selectIndex == 0 {
                sync()
            } else {
                selectIndex = 2
                sync()
            }
        }
        
    }
    
}

