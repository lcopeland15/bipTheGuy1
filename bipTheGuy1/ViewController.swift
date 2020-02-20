//
//  ViewController.swift
//  bipTheGuy1
//
//  Created by Lily Copeland on 2/19/20.
//  Copyright © 2020 Lily Copeland. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //Mark Properties

    @IBOutlet weak var imageToView: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK:Functions
    func animateImage() {
        let bounds = self.imageToView.bounds
        let shrinkValue: CGFloat = 60
      
        //Shrink image by 60 pixels
        self.imageToView.bounds = CGRect(x: self.imageToView.bounds.origin.x + shrinkValue, y: self.imageToView.bounds.origin.y - shrinkValue, width: self.imageToView.bounds.width - shrinkValue, height: self.imageToView.bounds.height - shrinkValue)
        
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToView.bounds = bounds }, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
            } catch {
                print("Error: Data in \(soundName) couldn't be played as sound. ")
            }
        } else{
            print("Error: file\(soundName) didn't load")
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
    }
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil )
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

    //MARK : Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
            
        } else{
            showAlert(title: "Camera Not Available", message: "There is no camera available on this device.")
            
            
            }
        
        
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "wooshSound", audioPlayer: &audioPlayer)
        
    }
     
    
}

