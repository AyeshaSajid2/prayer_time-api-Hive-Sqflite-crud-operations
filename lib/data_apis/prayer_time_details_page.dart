import 'package:flutter/material.dart';
import 'package:assignment_two/data_apis/prayer_time_page.dart';

class PrayerTimesDetailPage extends StatelessWidget {
  final Datum selectedDate;

  PrayerTimesDetailPage(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times for ${selectedDate.date.readable}'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildPrayerTimeBox('Fajr', selectedDate.timings.fajr),
            buildPrayerTimeBox('Sunrise', selectedDate.timings.sunrise),
            buildPrayerTimeBox('Dhuhr', selectedDate.timings.dhuhr),
            buildPrayerTimeBox('Asr', selectedDate.timings.asr),
            buildPrayerTimeBox('Sunset', selectedDate.timings.sunset),
            buildPrayerTimeBox('Maghrib', selectedDate.timings.maghrib),
            buildPrayerTimeBox('Isha', selectedDate.timings.isha),
            buildPrayerTimeBox('Imsak', selectedDate.timings.imsak),
            buildPrayerTimeBox('Midnight', selectedDate.timings.midnight),
          ],
        ),
      ),
    );
  }

  Widget buildPrayerTimeBox(String title, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
