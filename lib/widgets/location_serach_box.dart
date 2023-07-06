import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_event.dart';
import 'package:integratingmaps/bloc/autocomplete/autocomplete_state.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, State) {
        if (State is AutocompleteLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (State is AutocompleteLoaded) {
          return Padding(
            padding: const EdgeInsets.all(3),
            child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Location',
                  suffixIcon: const Icon(Icons.search),
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  context
                      .read<AutocompleteBloc>()
                      .add(LoadAutocomplete(searchInput: value));
                }),
          );
        } else {
          return Text('Something Went Wrong');
        }
      },
    );
  }
}
