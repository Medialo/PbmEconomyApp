class Account {
  String _uuid;
  String _bank;
  String _number;


  Account(this._uuid, this._bank, this._number);

  String get uuid => _uuid;

  String get bank => _bank;

  String get number => _number;
}