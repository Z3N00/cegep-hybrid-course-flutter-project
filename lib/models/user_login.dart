class User {

  final String name;
  final String password;


  User({

    required this.name,
    required this.password,

  });
}


final User currentUser = User(

  name: 'user1',
  password: 'qwerty123',

);