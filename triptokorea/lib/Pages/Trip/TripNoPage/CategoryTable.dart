import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTable extends StatefulWidget {
  const CategoryTable({super.key});

  @override
  State<CategoryTable> createState() => CategoryTable_State();
}

class CategoryTable_State extends State<CategoryTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 45,
              padding: EdgeInsets.only(right: 350, top: 5),
              child: Text('분류1',
                  style: GoogleFonts.getFont('Gowun Dodum',
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/산/산1.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/산/산2.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/산/산3.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/산/산4.jpg'),
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(1)),
            Row(
              children: [
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/산/산5.jpeg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/산/산6.jpeg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/산/산7.jpeg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/산/산8.jpeg'),
                      fit: BoxFit.cover),
                ),
              ],
            ),
            Container(
              height: 45,
              padding: EdgeInsets.only(right: 350, top: 5),
              child: Text('분류2',
                  style: GoogleFonts.getFont('Gowun Dodum',
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            Row(
              children: [
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/바다/바다01.jpg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/바다/바다02.jpg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/바다/바다03.jpg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/바다/바다04.jpg')),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(1)),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/바다/바다05.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/바다/바다06.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/바다/바다07.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/바다/바다08.jpg'),
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              padding: EdgeInsets.only(right: 350, top: 5),
              child: Text('분류3',
                  style: GoogleFonts.getFont('Gowun Dodum',
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/도시/도시01.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/도시/도시02.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/도시/도시03.jpg'),
                        fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.all(1)),
                  Expanded(
                    child: Image(
                        image: AssetImage('assets/images/도시/도시04.jpg'),
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(1)),
            Row(
              children: [
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/도시/도시05.jpg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/도시/도시06.jpg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/도시/도시07.jpg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/도시/도시08.jpg'),
                      fit: BoxFit.cover),
                ),
              ],
            ),
            Container(
              height: 45,
              padding: EdgeInsets.only(right: 350, top: 5),
              child: Text('분류4',
                  style: GoogleFonts.getFont('Gowun Dodum',
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            Row(
              children: [
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/산/산1.jpg'),
                      fit: BoxFit.cover),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/산/산2.jpg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/산/산3.jpg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/산/산4.jpg')),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(1)),
            Row(
              children: [
                Expanded(
                  child: Image(image: AssetImage('assets/images/산/산5.jpeg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/산/산6.jpeg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(image: AssetImage('assets/images/산/산7.jpeg')),
                ),
                Padding(padding: EdgeInsets.all(1)),
                Expanded(
                  child: Image(
                      image: AssetImage('assets/images/산/산8.jpeg'),
                      fit: BoxFit.cover),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
