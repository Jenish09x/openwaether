class HomeModel {
  String? base, name;
  int? id, code, dt, timezone, visibility;
  CoordModel? coord;
  List<WeatherModel>? weather = [];
  MainModel? main;
  WindModel? wind;
  CloudsModel? clouds;
  SysModel? sys;

  HomeModel(
      {this.base,
      this.visibility,
      this.dt,
      this.timezone,
      this.name,
      this.id,
      this.code,
      this.coord,
      this.weather,
      this.main,
      this.wind,
      this.clouds,
      this.sys});

  factory HomeModel.mapToModel(Map m1) {
    List l1 = m1['weather'];
    return HomeModel(
      id: m1['id'],
      main: MainModel.mapToModel(m1['main']),
      name: m1['name'],
      base: m1['base'],
      clouds: CloudsModel.mapToModel(m1['clouds']),
      code: m1['code'],
      coord: CoordModel.mapToModel(m1['coord']),
      dt: m1['dt'],
      sys: SysModel.mapToModel(m1['sys']),
      timezone: m1['timezone'],
      visibility: m1['visibility'],
      weather: l1.map((e) => WeatherModel.mapToModel(e)).toList(),
      wind: WindModel.mapToModel(m1['wind']),
    );
  }
}

class CoordModel {
  double? lon, lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.mapToModel(Map m1) {
    return CoordModel(
      lat: m1["lat"],
      lon: m1["lon"],
    );
  }
}

class WeatherModel {
  int? id;
  String? main, description, icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.mapToModel(Map m1) {
    return WeatherModel(
      id: m1['id'],
      main: m1["main"],
      description: m1['description'],
      icon: m1['icon'],
    );
  }
}

class MainModel {
  double? temp, feels_like, temp_min, temp_max;
  int? pressure, humidity;

  MainModel(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainModel.mapToModel(Map m1) {
    return MainModel(
      temp: m1['temp'],
      feels_like: m1['feels_like'],
      temp_min: m1['temp_min'],
      temp_max: m1['temp_max'],
      pressure: m1['pressure'],
      humidity: m1['humidity'],
    );
  }
}

class WindModel {
  double? speed;
  int? deg;

  WindModel({this.speed, this.deg});

  factory WindModel.mapToModel(Map m1) {
    return WindModel(
      speed: m1['speed'],
      deg: m1['deg'],
    );
  }
}

class CloudsModel {
  int? all;

  CloudsModel({this.all});

  factory CloudsModel.mapToModel(Map m1) {
    return CloudsModel(all: m1['all']);
  }
}

class SysModel {
  int? type, id, sunrise, sunset;
  String? country;

  SysModel({this.type, this.id, this.sunrise, this.sunset, this.country});

  factory SysModel.mapToModel(Map m1) {
    return SysModel(
      id: m1['id'],
      country: m1['country'],
      sunrise: m1['sunrise'],
      sunset: m1['sunset'],
      type: m1['type'],
    );
  }
}
