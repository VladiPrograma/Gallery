import 'package:animations/animations.dart';
import 'package:creator/creator.dart';
import 'package:gallery/gen/colors.gen.dart';
import 'package:gallery/screens/home/widgets/details.dart';
import 'package:gallery/utils/extensions/date_time.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../models/artist.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.white,
        body: Container( width: 100.w, height: 100.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: AlignmentDirectional.topEnd,
                image: Assets.images.vincentVanGogh.bg.image().image,
                colorFilter: ColorFilter.mode(ColorName.black.withOpacity(0.3), BlendMode.darken)
              )
            ),
            child: SafeArea(
                child: Column(
                  children: [
                    MenuTopBar(),
                    Header(),
                    Spacer(),
                    ListHeader(),
                    SizedBox( height: 43.h,
                    child: ParallaxList()),
                  ],
                )
        )));
  }
}

VanGogh _vanGogh = VanGogh.create();

class ParallaxList extends StatefulWidget {
   ParallaxList({Key? key}) : super(key: key);

  @override
  State<ParallaxList> createState() => _ParallaxListState();
}

late PageController _pageController;
class _ParallaxListState extends State<ParallaxList> {
  double pageOffset = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
          itemCount: _vanGogh.paintings.length,
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          itemBuilder: (context, i) {
            return  InkWell(
                    focusColor: ColorName.white.withOpacity(0),
                    highlightColor: ColorName.white.withOpacity(0),
                    splashColor: ColorName.white.withOpacity(0),
                    overlayColor: MaterialStateProperty.all(ColorName.white.withOpacity(0)),
                    hoverColor: ColorName.white.withOpacity(0),
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailScreen(paint: _vanGogh.paintings[i]);
                        },
                        transitionDuration: Duration(seconds: 1))
                      );
                    },
                    child: Stack(
                        children: [
                          Container(
                              height: 50.h,
                              width: 80.w,
                              margin: EdgeInsets.only(bottom: 4.h, right: 6.w),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorName.black.withOpacity(0.6),
                                        offset: const Offset(5, 10),
                                        blurRadius: 6
                                    )
                                  ]
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2.w),
                                  child:  Hero(
                                    tag: _vanGogh.paintings[i].imagePath,
                                    child: Image.asset(
                                      _vanGogh.paintings[i].imagePath,
                                      isAntiAlias: true,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(-pageOffset.abs() + i, 0),
                                    ),
                                  ))),
                          Positioned(
                              left: 4.w,
                              bottom: 10.w,
                              child: Text(_vanGogh.paintings[i].name,
                                  style: TextStyle(
                                      color: ColorName.white.withOpacity(0.85),
                                      fontSize: 4.w
                                  )))
                        ]),
            );
     }),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: SizedBox(width: 100.w, height: 5.h,
    child: Row(
    children: [
    Text('Highlight Paintings',
     style: TextStyle(
       fontSize: 5.w,
       fontWeight: FontWeight.w500,
       fontFamily: FontFamily.timesRegular,
       color: ColorName.white.withOpacity(0.9),
     )),
    const Spacer(),
    GestureDetector(
       onTap: (){ _pageController.animateToPage(
           _vanGogh.paintings.length-2,
           duration: const Duration(seconds: 1),
           curve: Curves.decelerate);
         },
       child: Text('More >',
       style: TextStyle(
         height: 2,
         fontSize: 3.w,
         fontFamily: FontFamily.timesRegular,
         color: ColorName.white.withOpacity(0.8),
     )))
    ]),
    ));
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vincent\nvan Gogh',
              style: TextStyle(
                color: ColorName.white.withOpacity(0.9),
                fontSize: 10.w,
                letterSpacing: 2,
              )),
          SizedBox(height: 2.h,),
          Text('${_vanGogh.birthDate.toStringDate()}-${_vanGogh.deathDate.toStringDate()}',
            style: TextStyle(
            color: ColorName.white.withOpacity(0.9),
            fontSize: 3.5.w,
            letterSpacing: 2,
            fontStyle: FontStyle.italic,
          )),
          SizedBox(height: 2.h,),
          Text(_vanGogh.description,
          style: TextStyle(
            color: ColorName.white.withOpacity(0.9),
            fontFamily: FontFamily.timesRegular,
            fontSize: 2.8.w,
            letterSpacing: 1.3,
            height: 0.4.w
          )),
        ],
      ),
    );
  }
}

class MenuTopBar extends StatelessWidget {
  const MenuTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: SizedBox(width: 100.w, height: 8.h,
    child: Row(
      children: [
        GestureDetector(
         onTap: (){
           Navigator.of(context).pop();
         },
         child: Icon(Icons.arrow_back_ios_new_sharp, color: ColorName.white, size: 5.w,)),
        Spacer(),
        GestureDetector(
         onTap: (){
         //@TODO
         },
         child: Icon(Icons.share_outlined, color: ColorName.white, size: 6.5.w)),
        SizedBox(width: 3.w,),
        GestureDetector(
         onTap: (){
         //@TODO
         },
         child: Icon(Icons.favorite_outline, color: ColorName.white, size: 6.5.w)),
      ])
    ));
  }
}
