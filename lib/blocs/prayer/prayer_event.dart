

import 'package:equatable/equatable.dart';

abstract class PrayerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPrayerTime extends PrayerEvent {
  final double latitude;
  final double longitude;

  FetchPrayerTime(this.latitude, this.longitude);

  @override
  List<Object> get props => [latitude, longitude];
}
