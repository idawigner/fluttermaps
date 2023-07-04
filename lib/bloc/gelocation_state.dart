import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();
  @override
  List<Object?> get Props => [];
}

class Geolocationloading extends GeolocationState {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class Geolocationloaded extends GeolocationState {
  final Position position;
  Geolocationloaded({required this.position});

  @override
  List<Object?> get props => [position];
}

abstract class GeolocationError extends GeolocationState {}
