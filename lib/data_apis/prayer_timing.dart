import 'package:assignment_two/data_apis/services/services_apis.dart';
import 'package:flutter/material.dart';

import 'MODEL/api_model.dart';


class ApiDashboard extends StatefulWidget {
  @override
  _ApiDashboardState createState() => _ApiDashboardState();
}

class _ApiDashboardState extends State<ApiDashboard> {
  final PrayerTimesService _prayerTimeService = PrayerTimesService();
  late Future<PrayerTime> _prayerTimeData;

  @override
  void initState() {
    super.initState();
    _prayerTimeData = _prayerTimeService.getPrayerTimeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      body: FutureBuilder<PrayerTime>(
        future: _prayerTimeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Extract date and time information
            String date = snapshot.data!.data.date.readable;
            String fajrTime = snapshot.data!.data.timings.fajr;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date: $date'),
                  Text('Fajr Time: $fajrTime'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


class PrayerTimesDetailPage extends StatelessWidget {
  final Datum selectedDate;

  PrayerTimesDetailPage(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times for ${selectedDate.date.readable}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fajr: ${selectedDate.timings.fajr}'),
            Text('Sunrise: ${selectedDate.timings.sunrise}'),
            Text('Dhuhr: ${selectedDate.timings.dhuhr}'),
            Text('Asr: ${selectedDate.timings.asr}'),
            Text('Sunset: ${selectedDate.timings.sunset}'),
            Text('Maghrib: ${selectedDate.timings.maghrib}'),
            Text('Isha: ${selectedDate.timings.isha}'),
            Text('Imsak: ${selectedDate.timings.imsak}'),
            Text('Midnight: ${selectedDate.timings.midnight}'),
            // Add more prayer times if needed
          ],
        ),
      ),
    );
  }
}

class PrayerTimesPage extends StatefulWidget {
  @override
  _PrayerTimesPageState createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  List<Datum> prayerData = [];
  final PrayerTimesService _prayerTimesService = PrayerTimesService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final PrayerTime prayerTime = await _prayerTimesService.getPrayerTimeData();

      setState(() {
        prayerData = prayerTime.data;
        print('Number of prayer data items: ${prayerData.length}');
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void onDateClick(Datum selectedDate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrayerTimesDetailPage(selectedDate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prayer Times Calendar"),
      ),
      body: FutureBuilder(
        future: _prayerTimesService.getPrayerTimeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error in fetching data, show an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data has been successfully fetched, display the ListView
            return ListView.builder(
              itemCount: prayerData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(prayerData[index].date.readable),
                  onTap: () => onDateClick(prayerData[index]),
                );
              },
            );
          }
        },
      ),
    );
  }}