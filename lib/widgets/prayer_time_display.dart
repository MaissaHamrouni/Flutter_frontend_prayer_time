
import 'package:flutter/material.dart';
import '../models/prayer_time.dart';

class PrayerTimeDisplay extends StatelessWidget {
  final PrayerTime prayerTime;

  PrayerTimeDisplay({required this.prayerTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPrayerTimeRow('Fajr', prayerTime.fajr),
          _buildPrayerTimeRow('Dhuhr', prayerTime.dhuhr),
          _buildPrayerTimeRow('Asr', prayerTime.asr),
          _buildPrayerTimeRow('Maghrib', prayerTime.maghrib),
          _buildPrayerTimeRow('Isha', prayerTime.isha),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeRow(String prayerName, String prayerTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            prayerTime,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
