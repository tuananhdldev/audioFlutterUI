import 'package:audiobooks/book_data.dart';
import 'package:audiobooks/book_listen.dart';
import 'package:audiobooks/book_model.dart';
import 'package:audiobooks/book_read.dart';
import 'package:flutter/material.dart';



class BookDetails extends StatelessWidget {
   int? index = 0;
   String? section = "Continue Reading";
  BookDetails({this.index, this.section});

  @override
  Widget build(BuildContext context) {
    List<Book> booklist = [];
    if (section == "Continue Reading") {
      booklist = recentBooks;
    } else if (section == "Discovery More") {
      booklist = allBooks;
    }

    return Scaffold(

      backgroundColor: Color(0xfffff8ee),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SafeArea(
                child: Container(
              child: Column(
                children: [
                  HeaderNavBar(),
                   ImageCover(image: booklist[index!].coverImage ,),
                  Text('The Power',
                   style: TextStyle(
                       fontSize: 30,
                     fontWeight: FontWeight.w700
                   ),
                 ),
                  SizedBox(height: 8,),
                  Text('by Rhoda Byrne'
                    ,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    Text("4.0",
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.w200
                     ),
                    )

                  ],
                  ),
                  //text details
                  Expanded(
                      child: SingleChildScrollView(
                         child: Container(
                           padding: EdgeInsets.only(
                             top: 10,
                             left: 20,
                             right: 20
                           ),
                           child: Text(
                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tincidunt nisi vel lorem lobortis efficitur. Praesent ac turpis augue. Integer rutrum ac orci in ornare. Mauris a purus vitae felis tempor pellentesque ac vitae leo. Pellentesque tincidunt odio nec ligula pellentesque, sit amet lacinia turpis tempor. Quisque arcu nunc, consectetur scelerisque vehicula quis, accumsan et augue. Aliquam nec justo neque. Aenean quis lacus vel neque porta efficitur et eu mauris. Etiam tincidunt arcu purus, non gravida ex interdum quis. Etiam ipsum nisi, commodo vitae vehicula id, bibendum nec elit. Nullam et placerat sem. Nam eu condimentum quam. Praesent consectetur, nisi quis fermentum vulputate, mauris velit varius urna, non blandit nisl ante nec dolor. Nullam dui libero, ornare malesuada posuere dictum, maximus in eros. Aliquam vitae lectus dapibus, auctor lacus ut, faucibus urna. Phasellus cursus lectus ultricies, congue orci at, tempus massa.",
                             style: TextStyle(
                               fontSize: 20,
                               height: 1.5
                             ),

                           ),
                         ),

                      )

                  ),
                ],
              ),
            )
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient: new LinearGradient(colors: [
                  Color(0xffff8ee).withOpacity(0.1),
                  Colors.white.withOpacity(0.3),
                  Color(0xffff8ee).withOpacity(0.7),
                  Color(0xffff8ee).withOpacity(0.8),
                ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
                ),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                      ,color: Color(0xffc44536)
                    ),
                    child: TextButton(
                      onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>BookRead())),
                      child: Text("Read",
                      style: TextStyle(color: Colors.white
                      , fontWeight: FontWeight.w700,
                        fontSize: 20
                      )
                      )
                    ),
                  ),
                SizedBox(width: 30),
                  Container(
                    width: 150,
                    height: 50,
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100)
                        ,color: Color(0xffc44536)
                    ),
                    child: TextButton(
                        onPressed: () =>
                        {

                       print("listen"),
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              BooksListen(
                                index: index??1,
                                section: section??"Discovery More",
                              )

                          )
                        )},
                        child: Text("Listen",
                            style: TextStyle(color: Colors.white
                                , fontWeight: FontWeight.w700,
                                fontSize: 20
                            )
                        )
                    ), 
                  )

                ],
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

class ImageCover extends StatelessWidget {
  final String? image;

  const ImageCover({Key? key, this.image}) : super(key: key);


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
              image?? "assets/images/4.jfif",
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
                color: Colors.black,
                size: 35,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 35,
              ))
        ],
      ),
    );

  }
}

