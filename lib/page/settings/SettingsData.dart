
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../routes.dart';

class ActionButton {
  final String title;
  final String? subtitle;
  // final String slug;
  final IconData icon;
  final IconData iconRight;
  final VoidCallback? _action;

  const ActionButton(
      this.title,
      this.icon,
      this._action,
      {
        this.subtitle,
        this.iconRight = Icons.chevron_right,
        // this.action =  const () => {
        //
        // };
      }
      );

  void executeCallBack(){
    if(_action != null){
      _action!();
    }
  }

}

class SettingsData {

  static List<ActionButton> getSettingsActionButtons(BuildContext context) {
    return <ActionButton>[
      ActionButton(
          AppLocalizations.of(context)!.server,
          Icons.dns,
          null,
          subtitle: "Gérer votre liste de serveur"
      ),
      ActionButton(
        AppLocalizations.of(context)!.notification,
        Icons.notification_important,
        null,
      ),
      ActionButton(
        AppLocalizations.of(context)!.security,
        Icons.security,
        null,
      ),
      ActionButton(
        AppLocalizations.of(context)!.themesAndColors,
        Icons.palette,
        null,
      ),
      ActionButton(
        AppLocalizations.of(context)!.betaFunctionality,
        Icons.code,
        null,
      ),
      ActionButton(
        AppLocalizations.of(context)!.bugReport,
        Icons.bug_report,
        null,
      ),
      ActionButton(
        AppLocalizations.of(context)!.about,
        Icons.info,
        () => Navigator.of(context).pushNamed(Routes.meRoute_About),
      )
    ];
  }
}
