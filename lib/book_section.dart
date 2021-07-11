

import 'package:audiobooks/book_details.dart';
import 'package:flutter/material.dart';

import 'book_data.dart';
import 'book_model.dart';

class BookSection extends StatelessWidget {
  final String? heading;
  BookSection({this.heading});
  @override
  Widget build(BuildContext context) {
    List<Book> booklist = [];
    if (heading == "Continue Reading") {
      booklist = recentBooks;
    } else if (heading == "Discovery More") {
      booklist = allBooks;
    }

    return Container(
      child: Column(
        children: [
          Text(
            heading!,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemBuilder: (ctx, i) => GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> BookDetails(index: i,section: heading,) ));
                  },
                  child: Row(
                    children: [
                     BookCard(booklist[i]) ,
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                itemCount: booklist.length,
                scrollDirection: Axis.horizontal,
              )),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget
{
  late final Book? book;
   BookCard(Book booklist)
   {
     this.book = booklist ;
   }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5,
                        offset: Offset(8, 8),
                        spreadRadius: 1,
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    book!.coverImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height:
                MediaQuery.of(context).size.height * 0.27,
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
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          book!.name!,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          book!.author!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }

}