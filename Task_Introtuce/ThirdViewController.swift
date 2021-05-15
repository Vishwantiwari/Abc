//
//  ThirdViewController.swift
//  Task_Introtuce
//
//  Created by Vishwan Tiwari on 12/05/21.
//

import UIKit
import Firebase
class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate{
    var refUsers : DatabaseReference!


@IBOutlet weak var tableUsers: UITableView!
   
        var UsersList :[UserModel] = []
    
        override func viewDidLoad() {

            super.viewDidLoad()
            tableUsers.tableFooterView = UIView.init(frame: .zero)
            tableUsers.dataSource = self
        refUsers = Database.database().reference().child("Users");
        
        refUsers.observe(DataEventType.value, with: { [self](DataSnapshot) in
            if(DataSnapshot.childrenCount>0){
                self.UsersList.removeAll()
                
                for Users in DataSnapshot.children.allObjects as![DataSnapshot] {
                    let UserObject = Users.value as?[String: String]
                    let Firstname = UserObject! ["FirstName"]
                    let Lastname = UserObject!["Lastname"]
                    let id = UserObject! ["id"]
                    let Gender = UserObject! ["Gender"]
                    let Dob = UserObject! ["DateofBirth"]
                    let Hometown = UserObject! ["HomeTown"]
                    
                    
                    let User = UserModel( id: id as! String?, Firstname: Firstname as! String? , Lastname: Lastname as! String? ,Gender: Gender as! String?, Hometown: Hometown as! String?, Dob:Dob as! String?)
                    self.UsersList.insert(User, at:0)
                
                    tableUsers.reloadData()
        
                }
            }
                }
                
        )}
        
    
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UsersList.count
        
    }
    
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        let User: UserModel
        
        User = UsersList[indexPath.row]
        cell.Firstname.text = User.Firstname
        cell.Lastname.text = User.Lastname
        cell.Gender.text = User.Gender
        cell.Dob.text = User.Dob
        cell.Hometown.text = User.Hometown
        return cell
        
}


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = UsersList[indexPath.row]
        let alertController = UIAlertController(title:"Delete?"  , message: "Are you sure you want to delete this data", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete", style: .default){(_)in deleteUser(id: user.id!)
        }
        alertController.addAction(deleteAction)
        present(alertController, animated: true, completion: nil)
        
        func deleteUser(id: String){
        refUsers.child(id).setValue(nil)
    }
        
    }
    
    
}

