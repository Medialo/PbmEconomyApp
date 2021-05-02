import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pbmeconomyapp/model/MojanAPIUUID.dart';
import 'package:pbmeconomyapp/page/home/HomePage.dart';
import 'package:pbmeconomyapp/page/me/MePage.dart';
import 'package:pbmeconomyapp/page/me/MePages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//https://github.com/flutter/gallery
//https://medium.muz.li/top-10-banking-app-ui-design-case-study-41ebc45ded1c
//https://rondesign.agency/?utm_source=dribbble
//https://medium.com/flutter-community/credit-card-slider-flutter-1edec451103a
//https://dribbble.com/shots/14668396-Sign-Up-Mobile-Form/attachments/6364652?mode=media
//https://dribbble.com/shots/6803518-Banking-App-Home-Insights
//

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,/* set Status bar color in Android devices. */
        statusBarIconBrightness: Brightness.dark,/* set Status bar icons color in Android devices.*/
        statusBarBrightness: Brightness.dark)/* set Status bar icon color in iOS. */
    );

    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "addFirstServer": (c) => AddFirstServer(),
        "home": (c) => MyHomePage(),

        "aboutPage": (c) => MePages.about,
      },
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PBM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text("Economy",
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text("beta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0,100,0,0),
                      child: RichText(

                        text: TextSpan(

                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,

                            ),
                            children: [
                              TextSpan(
                                text: "Bienvenue sur ",
                              ),
                              TextSpan(
                                  text: "My PbmEconomy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                text: ", votre nouvelle gestion de simulation d'économie de serveur Minecraft ",
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // OutlinedButton(
                    //   onPressed: () {
                    //
                    //   },
                    //   child: Text("eee"),
                    // ),
                    Row(
                      children: [
                        Expanded(
                            flex: 7,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed("addFirstServer");
                              },
                              child: Text("Connexion"),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.all(29)),

                              ),
                            )
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 3,
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              child: Icon(Icons.qr_code_scanner),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.all(25)),

                              ),
                            )
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("home");
                      },
                      child: Text("Demo"),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }

}

class AddFirstServer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddFirstServerState();
}

class AddFirstServerState extends State<AddFirstServer> {

  Future<MojangAPIUUID> fetchUUID(String name) async {
    final response = await http.get(Uri.https('https://api.mojang.com/users/profiles/minecraft/', name));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MojangAPIUUID.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<MojangAPIUUID> _uuid;
  bool _crack = false;
  String _serverIP = "";
  String _serverName = "";
  String _playerName = "";
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bienvenue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Ajouter votre premier serveur pour commencer à utiliser My PbmEconomy",
                      style: TextStyle(
                          color: Colors.black38
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Entrer l'adresse du serveur",
                          hintText: "mc.hypixel.net"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Entrer un nom pour ce serveur",

                        hintText: "Hypixel",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _serverName = value;
                        });
                      },
                    ),
                    if(_serverName.isNotEmpty)
                      SwitchListTile(
                        title: Text("$_serverName est il un serveur cracké ?"),
                        // subtitle: Text("eee"),
                        value: _crack,
                        onChanged: (value) {
                          setState(() {
                            _crack = value;
                          });
                        },
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Entrer votre pseudo in-game",

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 4) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _playerName = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()){

                                }
                              },
                              child: Text("Ajouter"),
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Simplifiez vous la vie avec un QR code !"),
                    Text("Faite /pbmeco <command>"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed("addFirstServer");
                              },
                              child: Icon(Icons.qr_code_scanner),
                            )
                        )
                      ],
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: UnderlineInputBorder(),
                    //     labelText: "Votre uuid",
                    //   ),
                    //   readOnly: true,
                    // )

                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final List<Widget> pages = <Widget>[
    HomePage(),
    Text("todo"),
    Text("todo entreprise"),
    MePage(),
  ];

  int _selectedIndex = 0;


  void _onItemTapped(int i){
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      color: Color(0xFF9fc7d8),
      // color: Theme.of(context).scaffoldBackgroundColor,

      child: SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   // Here we take the value from the MyHomePage object that was created by
            //   // the App.build method, and use it to set our appbar title.
            //   title: Text(widget.title!),
            // ),
            body: pages.elementAt(_selectedIndex),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: _incrementCounter,
            //   tooltip: 'Increment',
            //   child: Icon(Icons.add),
            // ), // This trailing comma makes auto-formatting nicer for build methods.
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.build),
                    label: 'Tets'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance),
                    label: 'Entreprise'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_sharp),
                    label: 'Moi'
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          )
      ),
    );
  }
}
