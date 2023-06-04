class Splash{
  Splash({this.loged, this.username});
  String? username;
  bool? loged;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'loged': loged,
    };
  }
  
  Splash.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    loged = json['loged'];
  }
}

final islogedInitList = [Splash(loged: false)];

