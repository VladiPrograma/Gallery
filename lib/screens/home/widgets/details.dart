import 'dart:io';

import 'package:gallery/config/log_msg.dart';
import 'package:gallery/gen/colors.gen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../gen/fonts.gen.dart';
import '../models/artist.dart';
import 'home.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.paint, Key? key}) : super(key: key);
  final Painting paint;
  static String routeName = "/paint";
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}


late AnimationController _controller;
late Animation<double> _translateAnimation;
double dInit = 300;
double dFinal = 0;
class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin{

  @override
  void initState(){
    _controller =  AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _translateAnimation = Tween<double>(begin: dInit, end: dFinal).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear)
    );
    waitPageAnimation();
    super.initState();
  }
  @override
  void dispose() async{
    _controller.dispose();
    super.dispose();
  }

  Future<void> waitPageAnimation() async{
    await Future.delayed(const Duration(milliseconds: 700));
    _controller.forward();
  }

  Future<bool> _onWillPop() async {
    _controller.reverse();
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
          backgroundColor: ColorName.white.withOpacity(0),
          body:  Stack(
              children: [
                Hero(  tag: widget.paint.imagePath,
                    child:Container( width: 100.w, height: 100.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                alignment: AlignmentDirectional.center,
                                image: Image.asset(widget.paint.imagePath).image,
                                colorFilter: ColorFilter.mode(ColorName.black.withOpacity(0.3), BlendMode.darken)
                            )
                        ))),
                SafeArea(
                    child: Column(
                      children: [
                        MenuTopBar(),
                        Spacer(),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child){
                              return Transform.translate(
                                  offset: Offset(0, _translateAnimation.value),
                                  child:  Container(width: 94.w, height: 20.h,
                                    decoration: BoxDecoration(
                                        color: ColorName.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft:Radius.circular(2.w),
                                            topRight: Radius.circular(2.w)
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 3.h),
                                        Text(widget.paint.name.replaceAll('\n', " "),
                                            style: TextStyle(
                                                fontSize: 8.w,
                                                color: ColorName.black.withOpacity(0.75)
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(5.w),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                CategoryBox(title: '1853', desc: 'Year'),
                                                Slash(),
                                                CategoryBox(title: 'Oil on canvas', desc: 'Medium'),
                                                Slash(),
                                                CategoryBox(title: '74 cm x 94 cm', desc: 'Dimensions'),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                              );
                            },
                        )
                      ],
                    )
                )
              ])
      ),
    );
  }
}

class Slash extends StatelessWidget {
  const Slash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('/',
        style: TextStyle(
            fontSize: 6.w,
            fontFamily: FontFamily.redHatMedium,
            fontStyle: FontStyle.italic,
            color: ColorName.black.withOpacity(0.2)
        ));
  }
}
class CategoryBox extends StatelessWidget {
  const CategoryBox({required this.title, required this.desc, Key? key}) : super(key: key);
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      Text(title,
          style: TextStyle(
              fontSize: 3.w,
              fontFamily: FontFamily.redHatBlack,
              color: ColorName.black.withOpacity(0.75)
          )),
      Text(desc,
          style: TextStyle(
              fontSize: 2.5.w,
              fontFamily: FontFamily.redHatMedium,
              color: ColorName.black.withOpacity(0.6)
          )),
    ]);
  }
}

