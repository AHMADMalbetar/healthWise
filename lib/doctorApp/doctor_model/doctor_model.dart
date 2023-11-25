class Doctor_Model {
  String? name;
  String? phone;
  String? password;
  int? weight;
  int? height;
  String? gender;
  String? about;
  String? area;
  String? neighbourhood;
  String? street;
  String? latitude;
  String? longitude;
  List<Services>? services;
  List<Availabilities>? availabilities;

  Doctor_Model(
      {this.name,
        this.phone,
        this.password,
        this.weight,
        this.height,
        this.gender,
        this.about,
        this.area,
        this.neighbourhood,
        this.street,
        this.latitude,
        this.longitude,
        this.services,
        this.availabilities});

  Doctor_Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    weight = json['weight'];
    height = json['height'];
    gender = json['gender'];
    about = json['about'];
    area = json['area'];
    neighbourhood = json['neighbourhood'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    if (json['availabilities'] != null) {
      availabilities = <Availabilities>[];
      json['availabilities'].forEach((v) {
        availabilities!.add(Availabilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['password'] = password;
    data['weight'] = weight;
    data['height'] = height;
    data['gender'] = gender;
    data['about'] = about;
    data['area'] = area;
    data['neighbourhood'] = neighbourhood;
    data['street'] = street;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (availabilities != null) {
      data['availabilities'] =
          availabilities?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? name;
  int? price;

  Services({this.name, this.price});

  Services.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class Availabilities {
  String? day;
  String? from;
  String? to;
  double? duration;
  int? appointmentsNumber;

  Availabilities(
      {this.day, this.from, this.to, this.duration, this.appointmentsNumber});

  Availabilities.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    from = json['from'];
    to = json['to'];
    duration = json['duration'];
    appointmentsNumber = json['appointments_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['from'] = from;
    data['to'] = to;
    data['duration'] = duration;
    data['appointments_number'] = appointmentsNumber;
    return data;
  }
}