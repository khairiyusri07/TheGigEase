import 'package:firebase_database/firebase_database.dart';

class User {
  late final int userId;
  late final String userName;
  late final String imageUrl;
  late final double JobRating;
  late final double EmployerRating;
  late final String userEmail;
  late final String userPhone;
  late final double walletBalance;

  User({
     required this.userId,
    required this.userName,
    required this.imageUrl,
    required this.JobRating,
    required this.EmployerRating,
    required this.userEmail,
    required this.userPhone,
    required this.walletBalance,

  });
  User.fromSnapshot(DataSnapshot snap) {
    userPhone = (snap.value as dynamic)["userPhone"];
    userName = (snap.value as dynamic)["userName"];
    userId = snap.key as int;
    userEmail = (snap.value as dynamic)["email"];
  }
}



// YOU - current user
final User currentUser1 = User(
  userId: 0,
  userName: 'Current User',
  imageUrl: 'assets/images/profilePic/greg.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
  userEmail: 'abhsd@sfb.com',
  userPhone: '0123456879',
  walletBalance: 0,
);

// USERS
final User greg = User(
  userId: 1,
  userName: 'Greg',
  imageUrl: 'assets/images/profilePic/greg.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@sfb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
final User james = User(
  userId: 2,
  userName: 'James',
  imageUrl: 'assets/images/profilePic/james.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@fb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
final User john = User(
  userId: 3,
  userName: 'John',
  imageUrl: 'assets/images/profilePic/john.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@fb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
final User olivia = User(
  userId: 4,
  userName: 'Olivia',
  imageUrl: 'assets/images/profilePic/olivia.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@fb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
final User sam = User(
  userId: 5,
  userName: 'Sam',
  imageUrl: 'assets/images/profilePic/sam.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@fb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
final User sophia = User(
  userId: 6,
  userName: 'Sophia',
  imageUrl: 'assets/images/profilePic/sophia.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@fb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
final User steven = User(
  userId: 7,
  userName: 'Steven',
  imageUrl: 'assets/images/profilePic/steven.jpg',
  JobRating : 0.0,
  EmployerRating : 0.0,
    userEmail: 'abhsd@fb.com',
    userPhone: '0123456879',
  walletBalance: 0,
);
