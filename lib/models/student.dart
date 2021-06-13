class Student {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String createdAt;
  int createdBy;
  String updatedAt;
  int updatedBy;

  Student(
      this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy);

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}