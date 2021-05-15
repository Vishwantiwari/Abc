//
//  SecondViewController.swift
//  Task_Introtuce
//
//  Created by Vishwan Tiwari on 12/05/21.
//

import UIKit
import Firebase
import FirebaseDatabase
class SecondViewController: UIViewController, UIImagePickerControllerDelegate &
UINavigationControllerDelegate {



    
     let storageref = Storage.storage().reference()
    private var refUsers = Database.database().reference()
    @IBOutlet weak var Firstname: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Lastname: UITextField!
    @IBOutlet weak var Dob: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Hometown: UITextField!
    @IBOutlet weak var State: UITextField!
    @IBOutlet weak var Country: UITextField!
    @IBOutlet weak var labelmessage: UILabel!
    
    @IBAction func ButtonAddUser(_ sender: UIButton) {
        addUser()
    }
    
    @IBAction func ButtonUploadImage(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as?
                UIImage
        else{
            return
            
        }
        guard let imageData = image.pngData() else {return}
        
            storageref.child("images/file.png").putData(imageData, metadata: nil,completion: {_, error in
                guard error == nil else{
                    print("Failed to upload");
                    return
                    
                }
                self.storageref.child("images/file.png").downloadURL(completion:{ url,error in
                    guard url == url , error == nil else {
                                                                     return
                                                                     }
                let urlString = url?.absoluteString
                    print("Download Url: \(urlString)")
                    UserDefaults.standard.set(urlString, forKey: "url")
            })
        })
    }
    
    
    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
}
   
    
      override func viewDidLoad() {
        refUsers=Database.database().reference().child("Users");
        
    
      }
    
    
    func addUser() {
        let key = refUsers.childByAutoId().key
        let user = ["id":key,"FirstName":Firstname.text! as String,"Lastname":Lastname.text! as String,"DateofBirth":Dob.text! as String,"Gender":Gender.text! as String,"HomeTown":Hometown.text! as String,"State":State.text! as String,"Country":Country.text! as String, "PhoneNumber":Phone.text! as String,]
        
        refUsers.child(key!).setValue(user)
        labelmessage.text = "User Added Successfully"
    }

}
