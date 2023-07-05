import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationState {}

class GeolocationLoading extends GeolocationState {}

class GeolocationLoaded extends GeolocationState {
  final Position position;

  GeolocationLoaded({required this.position});
}

class GeolocationError extends GeolocationState {
  final String message;

  GeolocationError({required this.message});
}
