import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api extends ChangeNotifier {
  void api(
    String email,
    String password,
    String name,
    String userName,
    String phoneNume,
  ) async {
    // var goJson = FormData.fromMap({
    //   'email': email,
    //   'password': password,
    //   'name': name,
    //   'userName': userName,
    //   'phoneNume': phoneNume,
    // });
    var goJson = {
      'email': email,
      'password': password,
      'name': name,
      'userName': userName,
      'phoneNum': phoneNume,
    };
    Dio dio = new Dio();

    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        'http://wslconnect.iptime.org:50020/sign_up',
        data: goJson,
      );
      print(goJson);
      print(response.data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonBody =
            json.decode(response.data); // http와 다른점은 response 값을 data로 받는다.
        // jsonBody를 바탕으로 data 핸들링
        print("성공");
      } else {
        // 200 안뜨면 에러
        print("실패");
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
  }

  void login(String email1, String password1) async {
    var Login = {
      'email': email1,
      'password': password1,
    };
    Dio dio = new Dio();

    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        'http://wslconnect.iptime.org:50020/login',
        data: Login,
      );
      print(Login);
      print(response.data);
      print(response.statusCode);
      notifyListeners();
      if (response.statusCode == 200) {
        final jsonBody =
            json.decode(response.data); // http와 다른점은 response 값을 data로 받는다.
        // jsonBody를 바탕으로 data 핸들링

        print("성공");
      } else {
        // 200 안뜨면 에러
        print("실패");
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
  }
}

void upload(String title, String content, base64Image) async {
  var uploadcase = {
    'email': "test119@naver.com",
    'userName': 'koko',
    'title': title,
    'content': content,
    'imageBinary': base64Image,
  };

  Dio dio = new Dio();
  print("실행중");
  dio.options.headers['content-Type'] = 'application/json';
  print(uploadcase);
  try {
    var response = await dio.post(
      'http://wslconnect.iptime.org:50020/board/post',
      data: uploadcase,
    );
    print(uploadcase);
    print(response.data);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonBody =
          json.decode(response.data); // http와 다른점은 response 값을 data로 받는다.
      // jsonBody를 바탕으로 data 핸들링
      print("성공");
    } else {
      // 200 안뜨면 에러
      print("실패");
    }
  } catch (e) {
    Exception(e);
  } finally {
    dio.close();
  }
}

void Upload(String title, String content) async {
  var uploadcase2 = {
    'email': "test119@naver.com",
    'userName': 'koko',
    'title': title,
    'content': content,
  };

  Dio dio = new Dio();
  print("실행중");

  print(uploadcase2);
  dio.options.headers['content-Type'] = 'application/json';
  try {
    var response = await dio.post(
      'http://wslconnect.iptime.org:50020/board/post',
      data: uploadcase2,
    );
    print(uploadcase2);
    print(response.data);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonBody =
          json.decode(response.data); // http와 다른점은 response 값을 data로 받는다.
      // jsonBody를 바탕으로 data 핸들링
      print("성공");
    } else {
      // 200 안뜨면 에러
      print("실패");
    }
  } catch (e) {
    Exception(e);
  } finally {
    dio.close();
  }
}
