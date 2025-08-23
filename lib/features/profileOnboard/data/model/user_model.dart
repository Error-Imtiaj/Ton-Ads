
class UserModel {
  final String fullName;
  final String age;
  final String gender;
  final String number;

  const UserModel({
    required this.fullName,
    required this.age,
    required this.gender,
    required this.number,
  });

   // Convert to Map for Firestore
  Map<String, dynamic> toMap(){
    return {
      'FullName' : fullName,
      'age' : age,
      'gender' : gender,
      'number' : number
    };
  }

  // Convert from Firestore
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['FullName'] ?? '',
      age: map['age'] ?? '0',
      gender: map['gender'] ?? '',
      number: map['number'] ?? '',
    );
  }
}
