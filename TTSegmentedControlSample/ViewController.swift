//
//  ViewController.swift
//  TTSegmentedControlSample
//
//  Created by Efraim Budusan on 10/8/17.
//  Copyright © 2017 Tapptitude. All rights reserved.
//

import UIKit
import TTSegmentedControl

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: TTSegmentedControl!
    
    var altControl: TTSegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        var segments = [TTSegment]()
        let s1 = TTSegment(title: "Never", image: UIImage(named: "never"))
        segments.append(s1)
        let s2 = TTSegment(title: "Sometimes", image: UIImage(named: "some"))
        segments.append(s2)
        let s3 = TTSegment(title: "Frequently", image: UIImage(named: "frequent"))
        segments.append(s3)
        let s4 = TTSegment(title: "Always", image: UIImage(named: "always"))
        segments.append(s4)
        let altControl = TTSegmentedControl(frame: CGRect(x: 0, y: 250, width: segmentedControl.frame.width, height: segmentedControl.frame.height), segments: segments)
        altControl.cornerRadius = 4.0
        self.view.addSubview(altControl)
        */
        segmentedControl.selectItemAt(index: 2, animated: false)
    
        segmentedControl.itemTitles = ["Never", "Sometimes", "Frequently", "Always"]
        
        altControl = TTSegmentedControl(frame: CGRect(x: 0, y: segmentedControl.frame.size.height + 200, width: segmentedControl.frame.size.width - 30, height: segmentedControl.frame.size.height))
        altControl!.itemTitles = ["Never", "Sometimes", "Frequently", "Always"]
        altControl!.cornerRadius = 8
        
        useImageInsideAttributes(image: UIImage(named: "never")!, atIndex: 0)
        useImageInsideAttributes(image: UIImage(named: "some")!, atIndex: 1)
        useImageInsideAttributes(image: UIImage(named: "frequent")!, atIndex: 2)
        useImageInsideAttributes(image: UIImage(named: "always")!, atIndex: 3)
        
        addImageInsideAttributes(image: UIImage(named: "never")!, atIndex: 0)
        addImageInsideAttributes(image: UIImage(named: "some")!, atIndex: 1)
        addImageInsideAttributes(image: UIImage(named: "frequent")!, atIndex: 2)
        addImageInsideAttributes(image: UIImage(named: "always")!, atIndex: 3)
        
        altControl!.frame = CGRect(x: 0, y: segmentedControl.frame.size.height + 200, width: segmentedControl.frame.size.width - 30, height: segmentedControl.frame.size.height)
        self.view.addSubview(altControl!)
        
        let button = UIButton(frame: CGRect(x: 0, y: 350, width: 100, height: segmentedControl.frame.size.height))
        button.setTitle("test", for: .normal)
        button.setTitleColor(.black, for: .normal)
        self.view.addSubview(button)
    }

    func addImageInsideAttributes(image: UIImage, atIndex: Int) {
        // ask segmented control to initialize all elements internally
        segmentedControl.layoutSubviews()
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        imageAttachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
        
        let attributes = segmentedControl.attributedDefaultTitles[atIndex].mutableCopy() as! NSMutableAttributedString
        attributes.append(NSAttributedString(string: "\n"))
        attributes.append(NSAttributedString(attachment: imageAttachment))
        
        let selectedAttributes = segmentedControl.attributedSelectedTitles[atIndex].mutableCopy() as! NSMutableAttributedString
        selectedAttributes.append(NSAttributedString(string: "\n"))
        selectedAttributes.append(NSAttributedString(attachment: imageAttachment))
        
        segmentedControl.changeAttributedTitle(attributes, selectedTile: selectedAttributes, atIndex: atIndex)
    }
    
    func useImageInsideAttributes(image: UIImage, atIndex: Int) {
        // ask segmented control to initialize all elements internally
        //segmentedControl.layoutSubviews()
        altControl!.layoutSubviews()
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        imageAttachment.bounds = CGRect(x: 0, y: -5, width: 25, height: 25)
        
        let attributes = NSAttributedString(attachment: imageAttachment)
        
        //segmentedControl.changeAttributedTitle(attributes, selectedTile: attributes, atIndex: atIndex)
        altControl!.changeAttributedTitle(attributes, selectedTile: attributes, atIndex: atIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        segmentedControl.noItemSelected = true
        segmentedControl.hasBounceAnimation = true
        
    }
    @IBAction func buttonAction(_ sender: Any) {
        segmentedControl.changeTitle("asdfasdfsdfsdffasdfsdf", atIndex: 2)
    
    }
    
}

