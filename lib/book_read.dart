import 'package:flutter/material.dart';

class BookRead extends StatelessWidget {
  const BookRead({Key? key}) : super(key: key);
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mattis ante porta dolor sodales, porttitor facilisis mauris porttitor. Nunc pharetra risus turpis, vel ornare nulla rutrum euismod. Suspendisse dui erat, scelerisque ut pellentesque ut, convallis ut leo. Suspendisse sodales odio diam, mollis pellentesque arcu eleifend sit amet. Vestibulum imperdiet in purus ut tincidunt. Mauris dolor urna, vestibulum sed varius ac, tempor id purus. Cras egestas vel nisi a cursus. Aenean non risus vehicula, ullamcorper nisi vitae, mattis ex. Ut gravida accumsan lacus, non ornare nulla interdum vel. Nunc ac dolor sed elit dapibus sagittis in id tortor. Phasellus ut dignissim quam. Aenean rhoncus, odio ut facilisis dictum, leo elit tincidunt justo, eu congue dolor urna eget lorem. Vivamus vel facilisis sapien, nec blandit urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam congue, lacus rutrum hendrerit scelerisque, velit dui venenatis nisl, sit amet ornare enim orci quis nisl. Cras malesuada dolor ut nulla scelerisque tempor. Donec euismod sagittis felis, id ultrices odio convallis non. Etiam neque dolor, porta quis fermentum non, interdum nec risus. In luctus eu tellus quis tempor. Ut hendrerit vulputate dui. Integer nulla erat, sollicitudin eget venenatis ut, ultricies in nisi. Sed feugiat elit ante. Pellentesque neque lectus, consequat cursus orci ac, dignissim posuere augue.";

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => {Navigator.pop(context)},
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 35,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.black,
                              size: 35,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 40, right: 20),
                      child: Text(
                        loremIpsum,
                        style: TextStyle(
                            fontSize: 20, letterSpacing: 1.0, height: 1.5),
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark),
                            label: Text(
                              "Notes",
                              style: TextStyle(fontSize: 24),
                            )),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(children: [
                            TextSpan(
                                text: "246/",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: "378",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700))
                          ])
                        ]))
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
