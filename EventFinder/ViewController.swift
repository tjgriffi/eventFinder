//
//  ViewController.swift
//  EventFinder
//
//  Created by Terrance Griffith on 11/27/15.
//  Copyright © 2015 Terrance Griffith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var EventImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        return true
        
        
    }
    
    //MARK: UITextView Delegate
    
    
    //MARK: UIImagePickerController Delegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        //Dismiss the controller after it is cancelled
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Function that allows you to do something with the photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        //Use the original photo picked
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Set the image of the box to be the image selected
        EventImageView.image = selectedImage
        
        //Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    //MARK: Actions
    @IBAction func selectImageFromLibrary(sender: UITapGestureRecognizer) {
        
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        
        //Create a UIImagePickerController to help with picking the image to use for an event
        let imagePickerController = UIImagePickerController()
        
        //Sets up the phone/tablet's photo library to be the source of the photos
        imagePickerController.sourceType = .PhotoLibrary
        
        //Lets this ViewController know when the image is being selected
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    


}

