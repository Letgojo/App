import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_for_flutter/google_places_for_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class result extends StatefulWidget {
  const result({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Map<dynamic, dynamic> title;

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  List<Marker> _markers = [];

  void initState() {
    super.initState();
    addMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set.from(_markers),
                initialCameraPosition: CameraPosition(
                  target: LatLng(35.1614066, 129.1646875),
                  zoom: 14.0,
                ),
              ),
            ),
            Container(
              child: Text(
                "여행계획",
                textAlign: TextAlign.end,
                style: GoogleFonts.getFont('Gowun Dodum',
                    textStyle: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    Map<dynamic, dynamic> data = widget.title;
                    print("${data['route'][index]}");
                    return Container(
                      child: Column(
                        children: [
                          Text(
                            data['route'][index]['이름'],
                            style: GoogleFonts.getFont('Gowun Dodum',
                                textStyle: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    );
                  })),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.select_all))
          ],
        ),
      ),
    ));
  }

  void addMarker() {
    setState(() {
      for (int i = 0; i < widget.title['route'].length; i++) {
        _markers.add(Marker(
            markerId: MarkerId(widget.title['route'][i]['경도']),
            position: LatLng(double.parse(widget.title['route'][i]['위도']),
                double.parse(widget.title['route'][i]['경도']))));
      }
    });
  }
}
