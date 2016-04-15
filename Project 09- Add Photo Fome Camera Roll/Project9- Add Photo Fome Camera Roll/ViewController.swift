//
//  ViewController.swift
//  Project9- Add Photo Fome Camera Roll
//
//  Created by 朱立焜 on 16/4/14.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Access the Camera Roll from within the App
// - Create Image Picker Controller
// - Handle a selected image in the Camera Roll
// - Control how the image is displayed to prevent stretching

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    let pickerController = UIImagePickerController()
    
    @IBAction func cameraButtonClicked(sender: UIBarButtonItem) {
        
        pickerController.sourceType = .PhotoLibrary
        self.navigationController?.presentViewController(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

