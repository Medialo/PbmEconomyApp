import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'SettingsData.dart';

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text(AppLocalizations.of(context)!.parameters),
            ),
            // SliverToBoxAdapter(
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(Routes.meRoute_About);
            //     },
            //     child: ListTile(
            //       title: Text("A propos"),
            //       subtitle: Text("ee"),
            //       leading: Icon(Icons.info),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //     ),
            //   ),
            // ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final b = SettingsData.getSettingsActionButtons(context).elementAt(index);
                  return ListTile(
                    title: Text(b.title),
                    subtitle: b.subtitle == null ? null : Text(b.subtitle!) ,
                    leading: Icon(b.icon),
                    trailing: Icon(b.iconRight),
                    onTap: () {
                      b.executeCallBack();
                    },
                  );
                },
                childCount: SettingsData.getSettingsActionButtons(context).length,
              ),
            )
          ],
        )
    );
  }

  const SettingsPage();
}