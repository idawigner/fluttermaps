import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_bloc.dart';
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
              if (state is Geolocationloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Geolocationloaded) {
                return GMap(
                  lat: state.position.latitude,
                  lng: state.position.longitude,
                );
              } else {
                return const Text('something went wrong');
              }
            }),
          ),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        const LocationSearchBox(),
                        BlocBuilder<AutocompleteBloc, AutocompleteState>(
                          builder: (context, state) {
                            if (State is AutocompleteLoading) {
                              return const Center(
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
                              return const Text('SomeThing went Wrong');
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
                      backgroundColor: const Color(0xFFFEAF00),
                    ),
                    child: const Text('SAVE')),
              ))
        ],
      ),
    );
  }
}
