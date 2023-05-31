import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/config.dart' as config;

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => RecordState();
}

class RecordState extends State<Record> {
  dynamic list = [];
  dynamic uid = '';
  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _asyncMethod();
      });
    });
  }

  _asyncMethod() async {
    //read 함수ß
    uid = await storage.read(key: 'uid');
  }

  Future<String> loaddata1() async {
    var Logindata = {
      'uuid': uid,
    };
    Dio dio = new Dio();
    print(Logindata);
    print("${config.serverIP}");
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/route-result',
        queryParameters: Logindata,
      );

      // print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
        for (int i = 0; i < response.data.length; i++) {
          list.add(response.data[0]["route"][i]);
        }
        // "name", value: u)
        return "OK";
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
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
              child: SafeArea(
                  child: Column(children: [
            SizedBox(height: 16),
            Container(
                margin: EdgeInsets.only(left: 150),
                child: Row(children: [
                  Expanded(
                    child: ListTile(
                      title: Text('나의 기록',
                          style: GoogleFonts.getFont(
                            'Gowun Dodum',
                            textStyle:
                                TextStyle(fontSize: 20, color: Colors.black),
                          )),
                    ),
                  )
                ])),
            Container(
              height: 80,
              width: 380,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "검색어를 입력해주세요",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    //돋보기 아이콘
                    suffixIcon: IconButton(
                      onPressed: () {
                        print("돋보기 크기 클릭");
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: loaddata1(),
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
                          height: 970,
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              List<dynamic> data = list[index];
                              print(data);

                              // Map<dynamic, dynamic> data = list[index];
                              // print(data);
                              // String name = data['이름'];
                              return Container(
                                width: 360,
                                height: 130,
                                margin: EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.5),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 180),
                                            child: Icon(Icons.delete_outline),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, right: 180),
                                            child: Text("name"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, right: 150),
                                            child: Text("4.1 ~ 4.3"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 30, left: 80),
                                            child: Text("04.20  18:15저장"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ));
                  }
                }),
          ]))),
        ));
  }
}
//앱바로 만들던가 알아서