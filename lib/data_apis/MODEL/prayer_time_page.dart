
import 'dart:convert';

PrayerTime prayerTimeFromMap(String str) => PrayerTime.fromMap(json.decode(str));

String prayerTimeToMap(PrayerTime data) => json.encode(data.toMap());

class PrayerTime {
  int code;
  String status;
  List<Datum> data;

  PrayerTime({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTime.fromMap(Map<String, dynamic> json) => PrayerTime(
    code: json["code"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Timings timings;
  Date date;
  Meta meta;

  Datum({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    timings: Timings.fromMap(json["timings"]),
    date: Date.fromMap(json["date"]),
    meta: Meta.fromMap(json["meta"]),
  );

  Map<String, dynamic> toMap() => {
    "timings": timings.toMap(),
    "date": date.toMap(),
    "meta": meta.toMap(),
  };
}

class Date {
  String readable;
  String timestamp;
  Gregorian gregorian;
  Hijri hijri;

  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  factory Date.fromMap(Map<String, dynamic> json) => Date(
    readable: json["readable"],
    timestamp: json["timestamp"],
    gregorian: Gregorian.fromMap(json["gregorian"]),
    hijri: Hijri.fromMap(json["hijri"]),
  );

  Map<String, dynamic> toMap() => {
    "readable": readable,
    "timestamp": timestamp,
    "gregorian": gregorian.toMap(),
    "hijri": hijri.toMap(),
  };
}

class Gregorian {
  String date;
  String format;
  String day;
  GregorianWeekday weekday;
  GregorianMonth month;
  String year;
  Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromMap(Map<String, dynamic> json) => Gregorian(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    weekday: GregorianWeekday.fromMap(json["weekday"]),
    month: GregorianMonth.fromMap(json["month"]),
    year: json["year"],
    designation: Designation.fromMap(json["designation"]),
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "format": format,
    "day": day,
    "weekday": weekday.toMap(),
    "month": month.toMap(),
    "year": year,
    "designation": designation.toMap(),
  };
}

class Designation {
  String abbreviated;
  String expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  factory Designation.fromMap(Map<String, dynamic> json) => Designation(
    abbreviated: json["abbreviated"],
    expanded: json["expanded"],
  );

  Map<String, dynamic> toMap() => {
    "abbreviated": abbreviated,
    "expanded": expanded,
  };
}

class GregorianMonth {
  int number;
  String en;

  GregorianMonth({
    required this.number,
    required this.en,
  });

  factory GregorianMonth.fromMap(Map<String, dynamic> json) => GregorianMonth(
    number: json["number"],
    en: json["en"],
  );

  Map<String, dynamic> toMap() => {
    "number": number,
    "en": en,
  };
}

class GregorianWeekday {
  String en;

  GregorianWeekday({
    required this.en,
  });

  factory GregorianWeekday.fromMap(Map<String, dynamic> json) => GregorianWeekday(
    en: json["en"],
  );

  Map<String, dynamic> toMap() => {
    "en": en,
  };
}

class Hijri {
  String date;
  String format;
  String day;
  HijriWeekday weekday;
  HijriMonth month;
  String year;
  Designation designation;
  List<String> holidays;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory Hijri.fromMap(Map<String, dynamic> json) => Hijri(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    weekday: HijriWeekday.fromMap(json["weekday"]),
    month: HijriMonth.fromMap(json["month"]),
    year: json["year"],
    designation: Designation.fromMap(json["designation"]),
    holidays: List<String>.from(json["holidays"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "format": format,
    "day": day,
    "weekday": weekday.toMap(),
    "month": month.toMap(),
    "year": year,
    "designation": designation.toMap(),
    "holidays": List<dynamic>.from(holidays.map((x) => x)),
  };
}

class HijriMonth {
  int number;
  String en;
  String ar;

  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });

  factory HijriMonth.fromMap(Map<String, dynamic> json) => HijriMonth(
    number: json["number"],
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toMap() => {
    "number": number,
    "en": en,
    "ar": ar,
  };
}

class HijriWeekday {
  String en;
  String ar;

  HijriWeekday({
    required this.en,
    required this.ar,
  });

  factory HijriWeekday.fromMap(Map<String, dynamic> json) => HijriWeekday(
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toMap() => {
    "en": en,
    "ar": ar,
  };
}

class Meta {
  double latitude;
  double longitude;
  String timezone;
  Method method;
  String latitudeAdjustmentMethod;
  String midnightMode;
  String school;
  Offset offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    timezone: json["timezone"],
    method: Method.fromMap(json["method"]),
    latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
    midnightMode: json["midnightMode"],
    school: json["school"],
    offset: Offset.fromMap(json["offset"]),
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
    "timezone": timezone,
    "method": method.toMap(),
    "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
    "midnightMode": midnightMode,
    "school": school,
    "offset": offset.toMap(),
  };
}

class Method {
  int id;
  String name;
  Params params;
  Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromMap(Map<String, dynamic> json) => Method(
    id: json["id"],
    name: json["name"],
    params: Params.fromMap(json["params"]),
    location: Location.fromMap(json["location"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "params": params.toMap(),
    "location": location.toMap(),
  };
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Params {
  int fajr;
  int isha;

  Params({
    required this.fajr,
    required this.isha,
  });

  factory Params.fromMap(Map<String, dynamic> json) => Params(
    fajr: json["Fajr"],
    isha: json["Isha"],
  );

  Map<String, dynamic> toMap() => {
    "Fajr": fajr,
    "Isha": isha,
  };
}

class Offset {
  int imsak;
  int fajr;
  int sunrise;
  int dhuhr;
  int asr;
  int maghrib;
  int sunset;
  int isha;
  int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromMap(Map<String, dynamic> json) => Offset(
    imsak: json["Imsak"],
    fajr: json["Fajr"],
    sunrise: json["Sunrise"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    maghrib: json["Maghrib"],
    sunset: json["Sunset"],
    isha: json["Isha"],
    midnight: json["Midnight"],
  );

  Map<String, dynamic> toMap() => {
    "Imsak": imsak,
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Maghrib": maghrib,
    "Sunset": sunset,
    "Isha": isha,
    "Midnight": midnight,
  };
}

class Timings {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;
  String firstthird;
  String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromMap(Map<String, dynamic> json) => Timings(
    fajr: json["Fajr"],
    sunrise: json["Sunrise"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    sunset: json["Sunset"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
    imsak: json["Imsak"],
    midnight: json["Midnight"],
    firstthird: json["Firstthird"],
    lastthird: json["Lastthird"],
  );

  Map<String, dynamic> toMap() => {
    "Fajr": fajr,
    "Sunrise": sunrise,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Sunset": sunset,
    "Maghrib": maghrib,
    "Isha": isha,
    "Imsak": imsak,
    "Midnight": midnight,
    "Firstthird": firstthird,
    "Lastthird": lastthird,
  };
}