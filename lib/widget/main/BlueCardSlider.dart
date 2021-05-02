import 'package:flutter/material.dart';
import 'package:pbmeconomyapp/model/BlueCard.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class BlueCardSlider extends StatefulWidget {
  final List<BlueCard> bcList;
  final Function(int i, BlueCard bc) bcSlideItemFocus;

  BlueCardSlider(this.bcList,{required this.bcSlideItemFocus, Key? key}) : super(key: key);

  // BlueCardSlider({
  //   List<BlueCardSliderItem> children = const <BlueCardSliderItem>[],
  //   Key? key,
  // }) : super(
  //     scrollDirection: Axis.horizontal,
  //     children: children,
  //     key: key
  // );
  @override
  State<StatefulWidget> createState() => BlueCardSliderState();
}

class BlueCardSliderState extends State<BlueCardSlider>{
  late final List<BlueCard> bcList;

  @override
  void initState() {
    super.initState();
    bcList = widget.bcList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200.0,
        child: ScrollSnapList(

          onItemFocus: (i) {
            widget.bcSlideItemFocus(i, bcList[i]);
          },
          itemSize: 320,
          itemCount: bcList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              height: 1000,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: bcList[index].color,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(bcList[index].name,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
                  //
                  //       ),
                  //       Text("n°"+bcList[index].number,
                  //         style: TextStyle( fontSize: 15, color: Colors.white),
                  //       ),
                  //     ],
                  //   ),
                  //   padding: EdgeInsets.fromLTRB(0, 0, 0, 35.0),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bcList[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),

                      ),
                      Container(
                        child: Text("LTC5"),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 35.0),
                    child: Text("n°"+bcList[index].number,
                      style: TextStyle( fontSize: 15, color: Colors.white),
                    ),),
                  Text("Total",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 19,
                      )
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      bcList[index].balance.toString()+" €",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        )
    );
  }
}

class BlueCardSliderItem extends StatelessWidget {
  final String name;
  final String number;
  final Icon icon;
  final Color color;

  BlueCardSliderItem({
    required this.name,
    required this.number,
    this.icon = const Icon(Icons.account_balance),
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("un text");
  }


}
