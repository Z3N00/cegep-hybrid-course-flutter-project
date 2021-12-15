class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Inderpreet Singh',
  imageUrl: 'assets/inder.jpg',
  isOnline: true,
);

// USERS
final User Inderpreet = User(
  id: 1,
  name: 'Inderpreet Singh',
  imageUrl: 'assets/inder.jpg',
  isOnline: true,
);
final User simar = User(
  id: 2,
  name: 'Simarjit singh',
  imageUrl: 'assets/simar.jpg',
  isOnline: true,
);
final User Aayush = User(
  id: 3,
  name: 'Aayush Sood',
  imageUrl: 'assets/user.jpg',
  isOnline: false,
);
final User Anmol = User(
  id: 4,
  name: 'Anmol Multani',
  imageUrl: 'assets/user.jpg',
  isOnline: false,
);
final User Sahil = User(
  id: 5,
  name: 'Sahil',
  imageUrl: 'assets/user.jpg',
  isOnline: true,
);
final User Kartik = User(
  id: 6,
  name: 'Kartik',
  imageUrl: 'assets/user.jpg',
  isOnline: false,
);
final User tejveer = User(
  id: 7,
  name: 'Tejveer Singh',
  imageUrl: 'assets/user.jpg',
  isOnline: false,
);
final User Daman = User(
  id: 8,
  name: 'Daman Behl',
  imageUrl: 'assets/user.jpg',
  isOnline: false,
);