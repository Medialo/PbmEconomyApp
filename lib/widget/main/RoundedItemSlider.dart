import 'package:flutter/material.dart';

// class RoundedItemSlider extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => RoundedItemSliderState();
// }
//
// class RoundedItemSliderState extends State<RoundedItemSlider>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text("rounded");
//   }
//
// }

class RoundedItemSlider extends StatelessWidget{

  RoundedItemSlider();

  static const double _margin = 34;
  static const double _circleSize = 150 - _margin * 2;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 150,
          margin: EdgeInsets.fromLTRB(10,_margin,10,15),
          child: GestureDetector(
            onLongPressStart: (details) {
              final SnackBar snackBar = SnackBar(
                content: Text("Nation Glory yellow blue red yesu ghouiergh z"),
                action: SnackBarAction(
                  label: "Modifier",
                  onPressed: () {

                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

            },
            child: Column(
              children: [
                Container(
                  height: _circleSize,
                  width: _circleSize,
                  margin: EdgeInsets.fromLTRB(0,0,0,15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://www.moneyvox.fr/i/media/03i/003631iea4.jpg'),
                      fit: BoxFit.cover
                    ),
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(300.0)),
                  ),

                ),
                Text("Banque",
                  maxLines: 1,
                  // softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}