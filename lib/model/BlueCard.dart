import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueCard {
  final String name;
  final String number;
  late final BigInt balance;
  final Icon icon;
  final Color color;

  BlueCard(
      this.name,
      this.number,
      num balance,
      {
        this.icon = const Icon(Icons.account_balance),
        this.color = const Color(0xFF0D60B3),
      }){
    this.balance = BigInt.from(balance);
  }

  String getMoneyBal(){

    return "";
  }


}


