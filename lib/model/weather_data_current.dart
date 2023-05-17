class WeaterDataCurrent{
  final Current current;
  WeaterDataCurrent({required this.current});

  factory WeaterDataCurrent.fromJson(Map<String, dynamic>json) => WeaterDataCurrent(current: Current.fromJson(json['current']));

}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        humidity: json['humidity'] as int?,
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  //from json
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  //to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
