import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_webservice/places.dart';
import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class SearchLocality extends StatefulWidget {
  _SearchLocalityState createState() => _SearchLocalityState();
}

class _SearchLocalityState extends State<SearchLocality> {
  final places = new GoogleMapsPlaces(apiKey: "$kGoogleApiKey");

  PlacesSearchResponse? response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Search Location'),
        // iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Search your locality"),
              onChanged: (s) {
                if (s.length >= 3)
                  places.searchByText(s).then((value) {
                    if (mounted)
                      setState(() {
                        response = value;
                      });
                  });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Search Results",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: response == null
                  ? SizedBox(
                      width: double.maxFinite,
                      child: Center(child: Text("Waiting to search...")),
                    )
                  : response!.hasNoResults
                      ? Center(
                          child: Text("No Result"),
                        )
                      : ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (c, i) {
                              PlacesSearchResult r = response!.results[i];
                              return Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pop(context, r);
                                      },
                                      contentPadding: EdgeInsets.zero,
                                      subtitle: Text(
                                        "${r.formattedAddress}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      title: Text(
                                        "${r.name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: response!.results.length,
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
