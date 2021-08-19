import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/components/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/screens/locations/bloc/screen_locations_bloc.dart';
import 'package:rick_morty/screens/locations/bloc/screen_locations_event.dart';

import 'package:rick_morty/screens/locations/widgets/list_locations.dart';
import '../../theme/color_theme.dart';
import 'package:rick_morty/screens/locations/bloc/screen_locations_state.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/theme/color_theme.dart';

class ScreenLocations extends StatelessWidget {
  final bloc = ScreenLocationsBloc();
  @override
  Widget build(BuildContext context) {
    Function(String) event = (String text) {
      bloc.add(SearchScreenLocationsEvent(request:  text));
    };

    return BlocProvider(create: (BuildContext context) =>
    bloc
      ..add(LoadingScreenLocationsEvent()),
      child: BlocBuilder<ScreenLocationsBloc, ScreenLocationsState>(
        builder: (_, state) {
          if (state is LoadingScreenLocationsState) {
            return LoadingScreen();
          }
          if (state is DataScreenLocationsState) {
            return
              Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Search('Найти локацию', true,function: event,),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(60),
                    child: ListTile(
                      leading: Text('ВСЕГО ЛОКАЦИЙ: ${state.locationsList.length}',
                          style: Theme.of(context).textTheme.overline),
                    ),
                  ),
                ),
                body: ListLocations(state.locationsList)

              );
          }
          if (state is ErrorScreenLocationsState) {
            return const Icon(Icons.close, size: 200);
          }
          return const SizedBox();
        },
      ),
    );
  }
}



