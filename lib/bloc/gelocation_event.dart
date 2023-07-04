import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:equatable/equatable.dart';

import 'package:geolocator/geolocator.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();
  @override
  List<Object?> get props => [];
}

class LoadGeolocation extends GeolocationEvent {
  LoadGeolocation();
}

class UpdateGeolocation extends GeolocationEvent {
  final Position position;
  UpdateGeolocation({required this.position});

  @override
  List<Object?> get props => [position];
}