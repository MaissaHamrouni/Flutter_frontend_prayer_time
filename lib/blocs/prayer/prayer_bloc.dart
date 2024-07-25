
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'prayer_event.dart';
import 'prayer_state.dart';
import '../../models/prayer_time.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  PrayerBloc() : super(PrayerInitial()) {
    // Register an event handler for the FetchPrayerTime event
    on<FetchPrayerTime>((event, emit) async {
      emit(PrayerLoading());

      try {
        // Construct the URL using the user's latitude and longitude
// Get the current date in yyyy-MM-dd format
        String currentDate = DateTime.now().toIso8601String().split('T').first;

// Construct the URL with the date, latitude, and longitude
        String url = 'http://YourIpAddress:8080/prayer-times?date=$currentDate&latitude=${event.latitude}&longitude=${event.longitude}';



        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final prayerTime = PrayerTime.fromJson(data);
          emit(PrayerLoaded(prayerTime));
        } else {
          emit(PrayerError('Failed to fetch prayer times.'));
        }
      } catch (e) {
        emit(PrayerError('Error: ${e.toString()}'));
      }
    });
  }
}
