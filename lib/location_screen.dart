import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_event.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_state.dart';

import 'package:integratingmaps/bloc/gelocation_state.dart';
import 'package:integratingmaps/bloc/geolocation_bloc.dart';
import 'package:integratingmaps/widgets/gmap.dart';
import 'package:integratingmaps/widgets/location_serach_box.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
              if (state is Geolocationloading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Geolocationloaded) {
                return GMap(
                  lat: state.position.latitude,
                  lng: state.position.longitude,
                );
              } else {
                return Text('something went wrong');
              }
            }),
          ),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        LocationSearchBox(),
                        BlocBuilder<AutocompleteBloc, AutocompleteState>(
                          builder: (context, State) {
                            if (State is AutocompleteLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (State is AutocompleteLoaded) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                height: 200,
                                color: State.autocomplete.length > 0
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.transparent,
                                child: ListView.builder(
                                    itemCount: State.autocomplete.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          State.autocomplete[index].description,
                                        ),
                                      );
                                    }),
                              );
                            } else {
                              return Text('SomeThing went Wrong');
                            }
                          },
                        )
                      ],
                    )),
                  ],
                ),
              )),
          Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFEAF00),
                        primary: Theme.of(context).primaryColor),
                    child: Text('SAVE')),
              ))
        ],
      ),
    );
  }
}

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({super.key});

//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   final Completer<GoogleMapController> controller = Completer();

//   static LatLng sourceLocation = const LatLng(37.3352, -122);
//   static LatLng destinationLocation = const LatLng(37.3342, -122.0660);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Location',
//         ),
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () => Navigator.of(context, rootNavigator: true).pop()),
//         automaticallyImplyLeading: true,
//       ),
//       body: GoogleMap(
//           initialCameraPosition:
//               CameraPosition(target: sourceLocation, zoom: 12),
//           markers: {
//             Marker(
//               markerId: const MarkerId("source"),
//               position: sourceLocation,
//             ),
//             Marker(
//               markerId: const MarkerId("destination"),
//               position: destinationLocation,
//             ),
//           }),
//     );
//   }
// }
