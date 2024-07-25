
class PrayerTime {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTime({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
      fajr: json['fajr'] as String,
      dhuhr: json['dhuhr'] as String,
      asr: json['asr'] as String,
      maghrib: json['maghrib'] as String,
      isha: json['isha'] as String,
    );
  }
}
