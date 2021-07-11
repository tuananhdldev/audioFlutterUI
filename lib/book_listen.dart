import 'dart:math';
import 'dart:ui';

import 'package:audiobooks/book_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'book_model.dart';

class BooksListen extends StatelessWidget {
  List<int> heights = [];
  List<Book> booklist = [];
  final int? index;
  final String? section;

  BooksListen({this.index, this.section});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < MediaQuery
        .of(context)
        .size
        .width / 9.3; i++) {
      heights.add(Random().nextInt(50));
    }

    if (section == "Continue Reading") {
      booklist = recentBooks;
    } else if (section == "Discovery More") {
      booklist = allBooks;
    }

    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    booklist[index??0].coverImage ?? "assets/images/1.jfif")
                , fit: BoxFit.cover
            )
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20
          ),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.1),
            child: SafeArea(
              child: Column(
                children: [
                  HeaderNavBar(),
                  ImageCover(image: booklist[index??0].coverImage),
                  Text('The Power',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                        ,color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text('by Rhoda Byrne'
                    ,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                        ,color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8,)
                  , Expanded(child:
                  Container(
                    padding: EdgeInsets.only(
                      right: 5,
                      left: 5
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xfffff8ee),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30)
                            , topRight: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Chapter 2"
                          , style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700
                          ),
                        )
                        , Column(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: EdgeInsets.only(
                                left: 15
                              ),
                              child:
                              ListView.builder(itemBuilder: (ctx, i) =>
                                  Bars(height: heights[i].toDouble(),
                                    color: i < heights.length / 2 ? Color(
                                        0xffc44536) :
                                    Colors.redAccent.withOpacity(0.5)
                                    ,
                                  )
                                , itemCount: heights.length,
                                scrollDirection: Axis.horizontal,

                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                               Text("01:11"

                               ),
                               Text("11:11")
                            ],

                            ),
                          ],
                        )
                    ,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           IconButton(onPressed: (){}, icon: Icon(Icons.menu))
                           ,
                           IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous)),
                           Container(
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Color(0xffc44536)
                               ),
                               child: IconButton(onPressed: (){},
                                   icon: Icon(Icons.pause
                                   ,color: Colors.white,
                                   )
                               )),
                           IconButton(onPressed: (){}, icon: Icon(Icons.skip_next))
                           ,IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))

                         ],
                       )
                      ],
                    ),
                  )

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ImageCover extends StatelessWidget {

  final String? image;
  ImageCover({this.image});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(
        bottom: 30,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 4,
                    offset: Offset(4, 4),
                    spreadRadius: 0.5,
                  ),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image??"assets/images/2.jfif",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                      Colors.black.withOpacity(0.4),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
          )
        ],
      ),
    );
  }
}
class HeaderNavBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
    );

  }
}
class Bars extends StatelessWidget {

  final double? height;
  final Color? color;
Bars({this.height, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 4,
      color: Color(0xfffff8ee),
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Center(child: Container(height: height,
      color: color,
        width: 4,
      ) ,),

    );
  }
}
