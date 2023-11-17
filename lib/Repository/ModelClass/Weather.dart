class Weather {
  Weather({
      this.location, 
      this.forecast,});

  Weather.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    forecast = json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
  Location? location;
  Forecast? forecast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (forecast != null) {
      map['forecast'] = forecast?.toJson();
    }
    return map;
  }

}

class Forecast {
  Forecast({
      this.items, 
      this.forecastDate, 
      this.nextUpdate, 
      this.source, 
      this.point, 
      this.fingerprint,});

  Forecast.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    forecastDate = json['forecastDate'];
    nextUpdate = json['nextUpdate'];
    source = json['source'];
    point = json['point'];
    fingerprint = json['fingerprint'];
  }
  List<Items>? items;
  String? forecastDate;
  String? nextUpdate;
  String? source;
  String? point;
  String? fingerprint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['forecastDate'] = forecastDate;
    map['nextUpdate'] = nextUpdate;
    map['source'] = source;
    map['point'] = point;
    map['fingerprint'] = fingerprint;
    return map;
  }

}

class Items {
  Items({
      this.date, 
      this.dateWithTimezone, 
      this.freshSnow, 
      this.snowHeight, 
      this.weather,
      this.sunHours, 
      this.rainHours, 
      this.temperature, 
      this.wind, 
      this.windchill, 
      this.snowLine, 
      this.astronomy,});

  Items.fromJson(dynamic json) {
    date = json['date'];
    dateWithTimezone = json['dateWithTimezone'];
    freshSnow = json['freshSnow'];
    snowHeight = json['snowHeight'];
    weather = json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    sunHours = json['sunHours'];
    rainHours = json['rainHours'];
    temperature = json['temperature'] != null ? Temperature.fromJson(json['temperature']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    windchill = json['windchill'] != null ? Windchill.fromJson(json['windchill']) : null;
    snowLine = json['snowLine'] != null ? SnowLine.fromJson(json['snowLine']) : null;
    astronomy = json['astronomy'] != null ? Astronomy.fromJson(json['astronomy']) : null;
  }
  String? date;
  String? dateWithTimezone;
  int? freshSnow;
  dynamic snowHeight;
  Weather? weather;
  int? sunHours;
  dynamic rainHours;
  Temperature? temperature;
  Wind? wind;
  Windchill? windchill;
  SnowLine? snowLine;
  Astronomy? astronomy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['dateWithTimezone'] = dateWithTimezone;
    map['freshSnow'] = freshSnow;
    map['snowHeight'] = snowHeight;
    if (weather != null) {
      map['weather'] = weather?.toJson();
    }

    map['sunHours'] = sunHours;
    map['rainHours'] = rainHours;
    if (temperature != null) {
      map['temperature'] = temperature?.toJson();
    }
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (windchill != null) {
      map['windchill'] = windchill?.toJson();
    }
    if (snowLine != null) {
      map['snowLine'] = snowLine?.toJson();
    }
    if (astronomy != null) {
      map['astronomy'] = astronomy?.toJson();
    }
    return map;
  }

}

class Astronomy {
  Astronomy({
      this.dawn, 
      this.sunrise, 
      this.suntransit, 
      this.sunset, 
      this.dusk, 
      this.moonrise, 
      this.moontransit, 
      this.moonset, 
      this.moonphase, 
      this.moonzodiac,});

  Astronomy.fromJson(dynamic json) {
    dawn = json['dawn'];
    sunrise = json['sunrise'];
    suntransit = json['suntransit'];
    sunset = json['sunset'];
    dusk = json['dusk'];
    moonrise = json['moonrise'];
    moontransit = json['moontransit'];
    moonset = json['moonset'];
    moonphase = json['moonphase'];
    moonzodiac = json['moonzodiac'];
  }
  String? dawn;
  String? sunrise;
  String? suntransit;
  String? sunset;
  String? dusk;
  String? moonrise;
  String? moontransit;
  String? moonset;
  int? moonphase;
  int? moonzodiac;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dawn'] = dawn;
    map['sunrise'] = sunrise;
    map['suntransit'] = suntransit;
    map['sunset'] = sunset;
    map['dusk'] = dusk;
    map['moonrise'] = moonrise;
    map['moontransit'] = moontransit;
    map['moonset'] = moonset;
    map['moonphase'] = moonphase;
    map['moonzodiac'] = moonzodiac;
    return map;
  }

}

class SnowLine {
  SnowLine({
      this.avg, 
      this.min, 
      this.max, 
      this.unit,});

  SnowLine.fromJson(dynamic json) {
    avg = json['avg'];
    min = json['min'];
    max = json['max'];
    unit = json['unit'];
  }
  dynamic avg;
  dynamic min;
  dynamic max;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avg'] = avg;
    map['min'] = min;
    map['max'] = max;
    map['unit'] = unit;
    return map;
  }

}

class Windchill {
  Windchill({
      this.min, 
      this.max, 
      this.avg,});

  Windchill.fromJson(dynamic json) {
    min = json['min'];
    max = json['max'];
    avg = json['avg'];
  }
  int? min;
  int? max;
  dynamic avg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min'] = min;
    map['max'] = max;
    map['avg'] = avg;
    return map;
  }

}

class Wind {
  Wind({
      this.unit, 
      this.direction, 
      this.text, 
      this.avg, 
      this.min, 
      this.max, 
      this.gusts, 
      this.significationWind,});

  Wind.fromJson(dynamic json) {
    unit = json['unit'];
    direction = json['direction'];
    text = json['text'];
    avg = json['avg'];
    min = json['min'];
    max = json['max'];
    gusts = json['gusts'] != null ? Gusts.fromJson(json['gusts']) : null;
    significationWind = json['significationWind'];
  }
  String? unit;
  String? direction;
  String? text;
  dynamic avg;
  int? min;
  int? max;
  Gusts? gusts;
  bool? significationWind;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unit'] = unit;
    map['direction'] = direction;
    map['text'] = text;
    map['avg'] = avg;
    map['min'] = min;
    map['max'] = max;
    if (gusts != null) {
      map['gusts'] = gusts?.toJson();
    }
    map['significationWind'] = significationWind;
    return map;
  }

}

class Gusts {
  Gusts({
      this.value, 
      this.text,});

  Gusts.fromJson(dynamic json) {
    value = json['value'];
    text = json['text'];
  }
  dynamic value;
  dynamic text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['text'] = text;
    return map;
  }

}

class Temperature {
  Temperature({
      this.min, 
      this.max, 
      this.avg,});

  Temperature.fromJson(dynamic json) {
    min = json['min'];
    max = json['max'];
    avg = json['avg'];
  }
  int? min;
  int? max;
  dynamic avg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min'] = min;
    map['max'] = max;
    map['avg'] = avg;
    return map;
  }

}



class Location {
  Location({
      this.code, 
      this.name, 
      this.timezone, 
      this.coordinates,});

  Location.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    timezone = json['timezone'];
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
  }
  String? code;
  String? name;
  String? timezone;
  Coordinates? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['timezone'] = timezone;
    if (coordinates != null) {
      map['coordinates'] = coordinates?.toJson();
    }
    return map;
  }

}

class Coordinates {
  Coordinates({
      this.latitude, 
      this.longitude,});

  Coordinates.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}