import 'package:flutter/material.dart';

import 'MenuItems.dart';

class MoneyMoveLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 29,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xfff8f8f8)
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(19, 0, 0, 0),
            child: Text("Avril 2019",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListTile(
          leading: MenuItems.transfer,
          title: Text("Prvl auto assurance"),
          subtitle: Text("Impot / Assurance "),
          trailing: Text("-500€"),
          onTap: () {

          },

        ),
        Divider(
          color: Color(0xffe5e5e5),
          thickness: 1,
          height: 1,
          indent: 71,
          endIndent: 20,
        )
      ],
    );
  }

}