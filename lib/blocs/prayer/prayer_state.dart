
import 'package:equatable/equatable.dart';
import '../../../models/prayer_time.dart';

abstract class PrayerState extends Equatable {
  @override
  List<Object> get props => [];
}

class PrayerInitial extends PrayerState {}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final PrayerTime prayerTime;

  PrayerLoaded(this.prayerTime);

  @override
  List<Object> get props => [prayerTime];
}

class PrayerError extends PrayerState {
  final String message;

  PrayerError(this.message);

  @override
  List<Object> get props => [message];
}
