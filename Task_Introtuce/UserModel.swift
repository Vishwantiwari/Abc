//
//  UserModel.swift
//  Task_Introtuce
//
//  Created by Vishwan Tiwari on 13/05/21.
//

struct UserModel{
    var id : String?
    var Firstname : String?
    var Lastname : String?
    var Gender : String?
    var Hometown : String?
    var Dob : String?
    
    

    
    
    
    init(id:String?,Firstname: String?,Lastname: String?,Gender: String?,Hometown: String?, Dob: String?) {
        self.id = id
        self.Firstname = Firstname
        self.Lastname = Lastname
        self.Gender = Gender
        self.Hometown = Hometown
        self.Dob = Dob
    }


    
}
