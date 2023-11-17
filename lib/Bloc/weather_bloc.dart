import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/api.dart';
import '../Repository/ModelClass/Weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  late Weather Weather1;
  AnimeApi animeApi = AnimeApi();
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        Weather1 = await animeApi.getAnime(event.toString());
        emit(WeatherLoaded());
      } catch (e) {
        print(e);
        emit(WeatherError());
    }});
  }
}
