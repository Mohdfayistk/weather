part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class FetchWeather extends WeatherEvent {
  final String text;
  FetchWeather({required this.text});
}