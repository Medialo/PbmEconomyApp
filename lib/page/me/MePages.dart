import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MePages extends StatelessWidget {

  final List<Widget> _widget = [];

  MePages(String title, List<Widget> widgets){
    _widget.add(CupertinoSliverNavigationBar(
      largeTitle: Text(title),
    ));
    _widget.addAll(widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: _widget,
      ),
    );
  }

  static final Widget about = MePages(
      "A propos titre",
      [

      ]
  );


  // Widget getListTile(){
  //
  //
  //   return  SliverToBoxAdapter(
  //     child: TextButton(
  //       onPressed: () {},
  //       child: ListTile(
  //         title: Text("Serveur"),
  //         leading: Icon(Icons.dns),
  //         trailing: Icon(Icons.keyboard_arrow_right),
  //       ),
  //     ),
  //   );
  //
  //
  // }

}
