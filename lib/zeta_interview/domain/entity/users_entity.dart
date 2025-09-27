class UserEntity {
  List<Result> results;
  Info info;

  UserEntity({
    required this.results,
    required this.info,
  });

  Map<String, dynamic> toJson() => {
        "results": results.map((e) => e.toJson()).toList(),
        "info": info.toJson(),
      };
}

class Info {
  String seed;
  int results;
  int page;
  String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class Result {
  Gender gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  Result({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  Map<String, dynamic> toJson() => {
        "gender": gender == Gender.MALE ? "male" : "female",
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "dob": dob.toJson(),
        "registered": registered.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id.toJson(),
        "picture": picture.toJson(),
        "nat": nat,
      };
}

class Dob {
  DateTime date;
  int age;

  Dob({
    required this.date,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
      };
}

enum Gender { FEMALE, MALE }

class Id {
  String name;
  String? value;

  Id({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Street street;
  String city;
  String state;
  String country;
  dynamic postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  Map<String, dynamic> toJson() => {
        "street": street.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
      };
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  int number;
  String name;

  Street({
    required this.number,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  String offset;
  String description;

  Timezone({
    required this.offset,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
