import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratingmaps/app_routes.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_event.dart';
import 'package:integratingmaps/bloc/gelocation_event.dart';
import 'package:integratingmaps/bloc/geolocation_bloc.dart';
import 'package:integratingmaps/repositories/geolocation/gelocation_repository.dart';
import 'package:integratingmaps/repositories/places/place_repository.dart';
import 'package:integratingmaps/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository()),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(LoadAutocomplete())),
        ],
        child: MaterialApp(
          title: 'Maps',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          initialRoute: AppRoutes.location,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
