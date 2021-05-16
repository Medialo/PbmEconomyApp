import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pbmeconomyapp/model/BlueCard.dart';
import 'package:pbmeconomyapp/model/Payment.dart';
import 'package:pbmeconomyapp/widget/main/BlueCardSlider.dart';
import 'package:pbmeconomyapp/widget/main/MoneyMoveLine.dart';
import 'package:pbmeconomyapp/widget/main/RoundedItemSlider.dart';

import '../../AdHelper.dart';


//https://medium.com/flutter-community/flutter-sliverappbar-snap-those-headers-544e097248c0
class HomePage extends StatefulWidget{

  HomePage();

  final Color roundedColor = Color(0xFF9fc7d8);
  final List<BlueCard>? bcList = [BlueCard("Compte courant", "85465 4654 321435",12332.6),BlueCard("Null Bankkk", "054 64 65465 465 4",456.458)];
  final List<Payment>? payList = [Payment(DateTime(2021,1,5),"456","",null),Payment(DateTime(2021,2,5),"-456","",null),Payment(DateTime(2021,2,8),"-456","",null),Payment(DateTime(2021,2,8),"456","",null)];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  final _controller = ScrollController(
    initialScrollOffset: 0,//170
    keepScrollOffset: false,
  );

  void bcSlideUpdate(int i, BlueCard blueCard ){
    print("=================================>> cb index: $i");
  }

  void _snapAppBar(){
    const double _scrollDistance = 170;
    const int _duration = 200;
    if( _topSize != 0 && _controller.offset > 170){
      setState(() {
        _topSize = 0;
        _controller.jumpTo(_controller.offset-170);
      });
    }
    if(_topSize != 0 && _controller.offset > 0 && _controller.offset < _scrollDistance){
      final double snapOffset =
      _controller.offset / _scrollDistance > 0.1 ? _scrollDistance : 0;
      Future.microtask(() {
        _controller.animateTo(snapOffset, duration: Duration(milliseconds: _duration), curve: Curves.easeIn);
        Future.delayed(Duration(milliseconds: _duration),() => setState(() {
          _topSize = 0;
          _controller.jumpTo(0.01);
        }));

      });
      // setState(() {
      //   _topSize = 0;
      // });
    }
  }


  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {});
  }

  double _topSize = 0;

  void _topSizeResize() {
    if(_topSize == 0){
      setState(()  {
        _topSize = 170;
        _controller.jumpTo(_topSize);
      });
    }
  }


  @override
  void dispose() {
    _bannerAd.dispose();



    super.dispose();
  }

  @override
  void initState() {


    // TODO: Initialize _bannerAd
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }


  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {

    });
    return Container(
      //#9fc7d8
      color: Colors.white,
      child: RefreshIndicator(

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
                expandedHeight: _topSize - MediaQuery.of(context).padding.top,
                // snap: true,
                // floating: true,
              ),
              SliverToBoxAdapter(
                  child: GestureDetector(
                    // behavior: HitTestBehavior.translucent,
                    onPanDown: (e) {
                      _topSizeResize();
                      return;
                    },
                    child: Container(
                      color: Colors.red,//widget.roundedColor,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )
                        ),
                        child: BlueCardSlider(
                          widget.bcList!,
                          bcSlideItemFocus: (i, bc) => bcSlideUpdate(i, bc),
                        ),

                      ),
                    ),
                  )
              ),
              SliverToBoxAdapter(
                  child:
                  (() {
                    if (_isBannerAdReady)
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: _bannerAd.size.width.toDouble(),
                          height: _bannerAd.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd),
                        ),
                      );
                  }())
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index)
                    {
                      return MoneyMoveLine();
                    },
                    childCount: 2,
                  )
              ),
              SliverFillRemaining(
                hasScrollBody: true,
                fillOverscroll: true,
                child: Center(
                  child: Text("Aucun autre mouvement",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        onRefresh: _refreshData,
      ),
    );
  }
}