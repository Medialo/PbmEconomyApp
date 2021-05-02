import 'package:flutter/cupertino.dart';

class AccountData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AccountDataState();
}

class AccountDataState extends State<AccountData>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(

            );
          },
      ),
    );
  }

}