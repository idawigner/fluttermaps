// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:integratingmaps/models/place_autocomplete_model.dart';
import 'package:integratingmaps/repositories/places/base_place_repository.dart';

class PlacesRepository extends BasePlacesRepository {
  final String key = 'AIzaSyDz3Fbc6zKlMTxRzov3dfCeS6dAjO_H3Zw';
  final String types = 'geocode';

  get place => null;

  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }
}
