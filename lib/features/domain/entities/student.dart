class Student {
  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.address,
    this.gender,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String? phoneNumber;
  String? dateOfBirth;
  String? address;
  String? gender;
}
