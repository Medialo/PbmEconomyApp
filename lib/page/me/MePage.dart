import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("Paramètres"),
            ),
            // SliverList(
            //     delegate: SliverChildBuilderDelegate(
            //         (BuildContext bc, int index){
            //           return GestureDetector(
            //             onTap: () {
            //
            //             },
            //             child: ListTile(
            //                title: Text("eeee" + index.toString()),
            //             ),
            //           );
            //         },
            //       childCount: 15,
            //     ),
            // ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Serveur"),
                  leading: Icon(Icons.dns),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Notification"),
                  leading: Icon(Icons.notification_important),
                  trailing: Icon(Icons.keyboard_arrow_right),

                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Sécurité"),
                  leading: Icon(Icons.security),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Thèmes et couleurs"),
                  leading: Icon(Icons.palette),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Fonctionnalité beta"),
                  leading: Icon(Icons.code),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Rapport de bug"),
                  leading: Icon(Icons.bug_report),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("aboutPage");
                },
                child: ListTile(
                  title: Text("A propos"),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),

          ],
        )
    );
  }

  const MePage();
}