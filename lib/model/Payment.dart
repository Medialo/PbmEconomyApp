import 'package:intl/intl.dart';
import 'package:pbmeconomyapp/model/IAccountable.dart';

class Payment {
  DateTime _date;
  String _amount;
  String _detail;
  IAccountable? _from;

  DateTime get date => _date;
  String get amount => _amount;
  String get detail => _detail;
  IAccountable get from => _from!;

  Payment(this._date, this._amount, this._detail,this._from);

  static Payment fromJson(dynamic json) => Payment(json["date"], json["amount"], json["detail"], json["from"]);

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["amount"] = _amount;
    map["detail"] = _detail;
    return map;
  }

  String dateToString() {
    return DateFormat.yMd('fr_FR').format(this._date);
  }

  bool isNegative(){
    if(_amount.startsWith("-")){
      return false;
    } else {
      return true;
    }
  }

}