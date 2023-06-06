import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Record/result.dart';
import '../../../config/config.dart' as config;

final storageRef = FirebaseStorage.instance.ref();

class CategoryTable extends StatefulWidget {
  const CategoryTable({super.key});

  @override
  State<CategoryTable> createState() => CategoryTable_State();
}

class CategoryTable_State extends State<CategoryTable> {
  var list = [];
  Future<dynamic> imageList() async {
    var Logindata = {};
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/vae/cluster-result',
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        // print(imageUrl);
        for (var i = 0; i < response.data.length; i++) {
          for (var j = 0; j < response.data[i].length; j++) {
            final spaceRef = await storageRef
                .child("original_new_img/${response.data[i][j]}");
            final imageUrl = await spaceRef.getDownloadURL();
            list.add(imageUrl);
          }
        }
        print(list);

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return list;
      } else {
        print(response.statusCode);
        print("2실패 ${response.statusCode}");
        return 'Fail';
      }
    } catch (e) {
      print(e);
      Exception(e);
    } finally {
      dio.close();
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: 670,
          child: Column(
            children: [
              FutureBuilder(
                  future: imageList(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                    if (snapshot.hasData == false) {
                      return CircularProgressIndicator();
                    }
                    //error가 발생하게 될 경우 반환하게 되는 부분
                    else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }
                    // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                    else {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 650,
                              padding: EdgeInsets.all(10),
                              child: GridView.builder(
                                  itemCount: list.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5,
                                          childAspectRatio: 5 / 5),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String link = list[index];
                                    return Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image.network(
                                              link,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })));
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
