//
//  ViewController.swift
//  segmentControl
//
//  Created by Preeteesh Remalli on 13/01/19.
//  Copyright © 2019 Preeteesh Remalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SPSegmentControlCellStyleDelegate, SPSegmentControlDelegate{

    @IBOutlet weak var segmentView: SPSegmentedControl!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        segmentView?.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        segmentView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        segmentView?.indicatorView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        segmentView?.styleDelegate = self
        segmentView?.delegate = self
        segmentView.layer.cornerRadius = segmentView.frame.height/2
        segmentView.clipsToBounds = true
        
        //first segment control
        let xFirstCell = self.createCell(
            text: "Go"
        )
        let xSecondCell = self.createCell(
            text: "Set"
        )
        let xThirdCell = self.createCell(
            text: "Submitt"
        )

        for cell in [xFirstCell, xSecondCell, xThirdCell] {
            cell.layout = .onlyText
            self.segmentView.add(cell: cell)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func createCell(text: String) -> SPSegmentedControlCell {
        let cell = SPSegmentedControlCell.init()
        cell.label.text = text
        cell.label.font = UIFont(name: "Avenir-Medium", size: 13.0)!
        return cell
    }
    
    func selectedState(segmentControlCell: SPSegmentedControlCell, forIndex index: Int) {
        SPAnimation.animate(0.1, animations: {
            self.showView(index: index)
        })
        
        UIView.transition(with: segmentControlCell.label, duration: 0.1, options: [.transitionCrossDissolve, .beginFromCurrentState], animations: {
            segmentControlCell.label.textColor = UIColor.white
        }, completion: nil)
    }
    
    func normalState(segmentControlCell: SPSegmentedControlCell, forIndex index: Int) {
        SPAnimation.animate(0.1, animations: {
        })
        
        UIView.transition(with: segmentControlCell.label, duration: 0.1, options: [.transitionCrossDissolve, .beginFromCurrentState], animations: {
            segmentControlCell.label.textColor = UIColor.gray
        }, completion: nil)
    }
    
    func indicatorViewRelativPosition(position: CGFloat, onSegmentControl segmentControl: SPSegmentedControl) {

    }
    func showView(index : Int) {
        if index == 0 {
            self.viewOne.isHidden = false
            self.viewTwo.isHidden = true
            self.viewThree.isHidden = true
        }else if index == 1 {
            self.viewTwo.isHidden = false
            self.viewOne.isHidden = true
            self.viewThree.isHidden = true
        }else if index == 2 {
            self.viewThree.isHidden = false
            self.viewOne.isHidden = true
            self.viewTwo.isHidden = true
        }
    }
}

