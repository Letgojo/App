import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../config/config.dart' as config;
import 'package:google_places_for_flutter/google_places_for_flutter.dart';

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';

class TripYes_result extends StatefulWidget {
  const TripYes_result({super.key});

  @override
  State<TripYes_result> createState() => _TripYes_resultState();
}

class _TripYes_resultState extends State<TripYes_result> {
  late GoogleMapController mapController;

  final Set<Marker> markers = new Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<dynamic> list = [];

  Future<dynamic> loaddata() async {
    var Logindata = {
      "tourType": "자연관광",
      "city": "대구광역시",
      "district": "달서구",
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/tour',
        queryParameters: Logindata,
      );
      // print(response.data);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");
        for (int i = 0; i < response.data.length; i++) {
          list.add(response.data[i]);
        }
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 659.4,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: getmarkers(),
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(35.1938469, 129.1536102),
                  zoom: 12.0,
                ),
              ),
            ),
            // Container(
            //   child: SearchGooglePlacesWidget(
            //     apiKey: 'AIzaSyASCW6NUBnr3NYGyISC7MaaSvqRjqb4LsQ',
            //     // The language of the autocompletion
            //     language: 'ko',
            //     // The position used to give better recommendations. In this case we are using the user position
            //     radius: 30000,
            //     onSelected: (Place place) async {
            //       final geolocation = await place.geolocation;

            //       // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
            //       mapController.animateCamera(
            //           CameraUpdate.newLatLng(geolocation!.coordinates));
            //       mapController.animateCamera(
            //           CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
            //     },
            //     onSearch: (Place place) {},
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Set<Marker> getmarkers() {
    markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(35.1938469, 129.1536102),
        infoWindow: InfoWindow(title: '해운대구')));

    // loaddata()
    //     .then((data) => setState(() {
    //           data.forEach((data) {
    //             markers.add(Marker(
    //                 markerId: MarkerId(data['순위']),
    //                 position: LatLng(
    //                   double.parse(data['위도']),
    //                   double.parse(data['경도']),
    //                 ),
    //                 infoWindow: InfoWindow(title: data['관광지명'])));
    //           });
    //         }))
    //     .catchError((error) => print('error:$error'));

    // markers.add(

    return markers;
  }
}
