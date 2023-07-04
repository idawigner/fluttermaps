import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:integratingmaps/bloc/gelocation_event.dart';
import 'package:integratingmaps/bloc/gelocation_state.dart';
import 'package:integratingmaps/repositories/geolocation/gelocation_repository.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;
  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(Geolocationloading());

  Stream<GeolocationState> mapEventToState(
    GeolocationEvent event,
  ) async* {
    if (event is LoadGeolocation) {
      yield* _mapLoadGeolocationToState();
    } else if (event is UpdateGeolocation) {
      yield* __mapUpdateGeolocationToState(event);
    }
  }

  Stream<GeolocationState> _mapLoadGeolocationToState() async* {
    _geolocationSubscription?.cancel();
    final Position position = await _geolocationRepository.getCurrentLocation();
    add(UpdateGeolocation(position: position));
  }

  Stream<GeolocationState> __mapUpdateGeolocationToState(
      UpdateGeolocation event) async* {
    yield Geolocationloaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
