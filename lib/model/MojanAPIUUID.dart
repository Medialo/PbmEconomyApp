class MojangAPIUUID {
  final String _name;
  final String _id;

  String get name => _name;
  String get id => _id;

  MojangAPIUUID(
      this._name,
      this._id,
      );

  // void setFromJson(dynamic json) {
  //   _name = json["name"];
  //   _id = json["id"];
  // }

  factory MojangAPIUUID.fromJson(Map<String, dynamic> json) {
    return MojangAPIUUID(json["name"], json["id"]);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["id"] = _id;
    return map;
  }

}