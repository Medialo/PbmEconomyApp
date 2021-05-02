import 'package:flutter/material.dart';

class RoundedSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RoundedSliderState();

}

class RoundedSliderState extends State<RoundedSlider>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            );
          },
      ),
    );
  }

}