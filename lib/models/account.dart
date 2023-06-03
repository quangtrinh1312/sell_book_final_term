class Account {
  Account({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
  
  Account.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }
}

final accountInitList = [
  Account(username: 'truyen', password: '123456'),
  Account(username: 'trinh', password: '123456'),
  Account(username: 'dung', password: '123456'),
];
