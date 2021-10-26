class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;

  User({this.id, this.name, this.email, this.phone, this.address, this.password});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'phone': phone, 'address': address, 'password': password};
  }

  String toString() {
    return "{ id: $id, name: $name, email: $email, phone: $phone, address: $address, password: $password}";
  }
}
