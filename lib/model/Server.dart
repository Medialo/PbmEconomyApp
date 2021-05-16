class Server {
  String? _name;
  String? _address;
  String? _playerName;
  bool? _premium;
  String? _token;
  bool? _admin;

  String? get name => _name;
  String? get address => _address;
  String? get playerName => _playerName;
  bool? get premium => _premium;
  String? get token => _token;
  bool? get admin => _admin;

  Server({
      String? name,
      String? adress, 
      String? playerName, 
      bool? premium,
      String? token, 
      bool? admin}){
    _name = name;
    _address = adress;
    _playerName = playerName;
    _premium = premium;
    _token = token;
    _admin = admin;
}

  Server.fromJson(dynamic json) {
    _name = json["name"];
    _address = json["address"];
    _playerName = json["playerName"];
    _premium = json["premium"];
    _token = json["token"];
    _admin = json["admin"];
  }


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["address"] = _address;
    map["playerName"] = _playerName;
    map["premium"] = _premium;
    map["token"] = _token;
    map["admin"] = _admin;
    return map;
  }

}