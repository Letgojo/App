import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';

class TripYes_result extends StatefulWidget {
  const TripYes_result({super.key});

  @override
  State<TripYes_result> createState() => _TripYes_resultState();
}

class _TripYes_resultState extends State<TripYes_result> {
  final double _lat = 35.886779;
  final double _lng = 128.653534;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 302,
                  width: double.infinity,
                  child: Column(
                    children: [
                      KakaoMapView(
                        width: double.infinity,
                        height: 300,
                        kakaoMapKey: kakaoMapKey,
                        lat: 35.886779,
                        lng: 128.653534,
                        showMapTypeControl: true,
                        showZoomControl: true,
                        draggableMarker: true,
                        mapType: MapType.BICYCLE,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
