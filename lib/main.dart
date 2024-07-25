import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'blocs/prayer/prayer_bloc.dart';
import 'blocs/prayer/prayer_event.dart';
import 'blocs/prayer/prayer_state.dart';
import 'widgets/prayer_time_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PrayerBloc(),
        child: PrayerHomePage(),
      ),
    );
  }
}

class PrayerHomePage extends StatefulWidget {
  @override
  _PrayerHomePageState createState() => _PrayerHomePageState();
}

class _PrayerHomePageState extends State<PrayerHomePage> {
  late PrayerBloc _prayerBloc;

  @override
  void initState() {
    super.initState();
    _prayerBloc = BlocProvider.of<PrayerBloc>(context);
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('La permission de localisation est refusée');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    _prayerBloc.add(FetchPrayerTime(position.latitude, position.longitude));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heures de Prière'),
      ),
      body: BlocBuilder<PrayerBloc, PrayerState>(
        builder: (context, state) {
          if (state is PrayerInitial) {
            return Center(child: Text('Chargement...'));
          } else if (state is PrayerLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PrayerLoaded) {
            return PrayerTimeDisplay(prayerTime: state.prayerTime);
          } else if (state is PrayerError) {
            return Center(child: Text('Erreur: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
