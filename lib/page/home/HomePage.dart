import 'package:flutter/material.dart';
import 'package:pbmeconomyapp/model/BlueCard.dart';
import 'package:pbmeconomyapp/model/Payment.dart';
import 'package:pbmeconomyapp/widget/main/BlueCardSlider.dart';
import 'package:pbmeconomyapp/widget/main/MenuItems.dart';
import 'package:pbmeconomyapp/widget/main/RoundedItemSlider.dart';


//https://medium.com/flutter-community/flutter-sliverappbar-snap-those-headers-544e097248c0
class HomePage extends StatefulWidget{

  HomePage();

  final Color roundedColor = Color(0xFF9fc7d8);
  final List<BlueCard>? bcList = [BlueCard("MedialoBank", "85465 4654 321435",14654644.6),BlueCard("Null Bankkk", "054 64 65465 465 4",456.458)];
  final List<Payment>? payList = [Payment(DateTime(2021,1,5),"456","",null),Payment(DateTime(2021,2,5),"-456","",null),Payment(DateTime(2021,2,8),"-456","",null),Payment(DateTime(2021,2,8),"456","",null)];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{

  final _controller = ScrollController(
    initialScrollOffset: 170,
    keepScrollOffset: false,
  );


  void bcSlideUpdate(int i, BlueCard blueCard ){
    print("=================================>> cb index: $i");
  }


  void _snapAppBar(){
    const double scrollDistance = 170;
    if(_controller.offset > 0 && _controller.offset < scrollDistance){
      final double snapOffset =
      _controller.offset / scrollDistance > 0.1 ? scrollDistance : 0;
      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //#9fc7d8
      color: Colors.white,
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          _snapAppBar();
          return false;
        },
        child: CustomScrollView(
          controller: _controller,
          // physics: BouncingScrollPhysics(),
          physics: AlwaysScrollableScrollPhysics(),
          slivers:[
            SliverAppBar(
              // foregroundColor: widget.roundedColor,
              toolbarHeight: 0.0,
              backgroundColor: widget.roundedColor,
              pinned: false,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: RoundedItemSlider(),
              ),

              expandedHeight: 170 - MediaQuery.of(context).padding.top,
              // snap: true,
              // floating: true,
            ),
            SliverToBoxAdapter(


              child: Container(
                color: widget.roundedColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        // onVerticalDragUpdate: (details) {
                        //   if(details.delta.dy > 0.0){
                        //     print("=================>" + details.toString());
                        //   } else {
                        //
                        //   }
                        // },
                        child: BlueCardSlider(
                          widget.bcList!,
                          bcSlideItemFocus: (i, bc) => bcSlideUpdate(i, bc),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index)
                  {
                    return Column(
                      children: [
                        if(true)
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
                          leading: MenuItems.rent,
                          title: Text("Bonjour"),
                          subtitle: Text("Restaurant"),
                          trailing: Text("+500€"),
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
                  },
                  childCount: 2,
                )
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              fillOverscroll: true,
              child: Center(
                child: Text("Aucun mouvements",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}