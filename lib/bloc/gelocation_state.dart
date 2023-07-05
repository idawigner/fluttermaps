import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();
  @override
  List<Object?> get props => [];
}

class Geolocationloading extends GeolocationState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Geolocationloaded extends GeolocationState {
  final Position position;
  const Geolocationloaded({required this.position});

  @override
  List<Object?> get props => [position];
}

abstract class GeolocationError extends GeolocationState {}
