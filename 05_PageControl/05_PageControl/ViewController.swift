//
//  ViewController.swift
//  05_PageControl
//
//  Created by 정건휘 on 31/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    
    let list = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]
    
    var fromTap = false
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        fromTap = true
        
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        listCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pager.numberOfPages = list.count
        pager.currentPage = 0
        pager.pageIndicatorTintColor = UIColor.lightGray
        pager.currentPageIndicatorTintColor = UIColor.black
        
        pager.defersCurrentPageDisplay = true
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = list[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        fromTap = false
        pager.updateCurrentPageDisplay()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !fromTap else { return }
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width / 2.0)
        let newPage = Int(x / width)
        if pager.currentPage != newPage {
            pager.currentPage = newPage
        }
    }
}


