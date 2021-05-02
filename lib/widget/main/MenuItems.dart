import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItems {

  static const _incomeGreen = Color(0xff68ce7d);

  static final Widget income = Container(
    height: 40,
    width: 40,
    child: Icon(
      CupertinoIcons.arrow_down_left,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: _incomeGreen,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static final Widget transfer = Container(
    height: 40,
    width: 40,
    child: Icon(
      CupertinoIcons.arrow_up_right,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static final Widget payDay = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.request_quote,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget fine = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.gavel,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget swap = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.swap_horiz,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget store = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.store,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget healing = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.healing,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFFF0066),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget plane = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.flight,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF00C4FF),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget game = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.local_activity,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFE7DA00),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget victory = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.emoji_events,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFFFF100),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget achievement = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.celebration,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFFFA200),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  //contrat
  static final Widget done = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.done,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFFB9FF00),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget home = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.house,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF0083E8),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget rent = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.home_work,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF4DB0FF),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

  static final Widget sale = Container(
    height: 40,
    width: 40,
    child: Icon(
      Icons.point_of_sale,
      color: Colors.white,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF3AE257),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // border: Border.all(
      //   color: Colors.grey,
      // )
    ),
  );

}