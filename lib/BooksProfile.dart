import 'package:audiobooks/book_section.dart';

import 'book_home.dart';
import 'package:flutter/material.dart';

class BookProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final KtitleStyle = TextStyle(
      fontSize: 20,
      color: Colors.grey,
      fontWeight: FontWeight.w700
    );
    final KSubtitleStyle = TextStyle(
        fontSize: 26,
        color: Colors.black,
        fontWeight: FontWeight.w700
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Home2.png'),
                fit: BoxFit.cover)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.93,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.83,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xfffff8ee),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1,
                          left: 20,
                          right: 20),
                      child: Column(
                        children: [
                          Text(
                            "Alice Heard",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffc44536),
                                    fontSize: 24),
                              )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              top: 10
                            ),
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Total Reads",
                                  style: KtitleStyle,
                                  ),
                                  Text("Favourites",
                                  style: KtitleStyle,),
                                  Text("Reviews",
                                  style: KtitleStyle,)
                                ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("127", style: KSubtitleStyle,),
                                    Text("83", style: KSubtitleStyle,),
                                    Text("47", style: KSubtitleStyle,),
                                  ],
                                )
                              ],
                            ),

                          ),
                          Expanded(child: Container(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20
                            ),
                            alignment: Alignment.bottomCenter,
                            child: BookSection(heading: "Continue Reading",),
                          ))
                        ],
                      ),
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.2,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/Amber.jfif", fit: BoxFit.fill,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
