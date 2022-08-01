class User{
  String? Email;
  String? Username;
  String? Password;
  String? Firstname;
  String? Lastname;
  // String? _phonenumber;
  // String? address;
  String? phone;
  
  // String? country;

  User({
    this.Email,
    this.Username,
    this.Password,
    this.Firstname,
    this.Lastname,
   
    // this.address,
    this.phone,
    
    // this.country
    });

    //server's json data to dart object

    factory User.fromJson(Map<String, dynamic> json) => User(
      Email:json ["Email"],
      Username: json["Username"],
      Password: json["Password"],
      Firstname: json["Firstname"],
      Lastname: json["Lastname"],

      // address: json["address"],
      phone: json["PhoneNumber"],
     
      // country: json["country"],

    );
    //converting json data to dart object

    Map<String, dynamic> toJson() =>{
      "Email": Email,
      "Username": Username,
      "Password": Password,
      "Firstname": Firstname,
      "Lastname": Lastname,
      // "address": address,
      "PhoneNumber": phone,
      
      // "country" : country,


      
    };


}