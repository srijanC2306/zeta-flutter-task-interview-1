import 'package:flutter_test_cases/zeta_interview/domain/entity/users_entity.dart';

class UsersDto {
  final List<ResultDto> results;
  final InfoDto info;

  const UsersDto({required this.results, required this.info});

  factory UsersDto.fromJson(Map<String, dynamic> json) {
    return UsersDto(
      results: (json['results'] as List)
          .map((e) => ResultDto.fromJson(e))
          .toList(),
      info: InfoDto.fromJson(json['info']),
    );
  }
}

class InfoDto {
  final String seed;
  final int results;
  final int page;
  final String version;

  InfoDto({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory InfoDto.fromJson(Map<String, dynamic> json) => InfoDto(
        seed: json['seed'],
        results: json['results'],
        page: json['page'],
        version: json['version'],
      );
}

class ResultDto {
  final String gender;
  final NameDto name;
  final LocationDto location;
  final String email;
  final LoginDto login;
  final DobDto dob;
  final DobDto registered;
  final String phone;
  final String cell;
  final IdDto id;
  final PictureDto picture;
  final String nat;

  ResultDto({
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

  factory ResultDto.fromJson(Map<String, dynamic> json) => ResultDto(
        gender: json['gender'],
        name: NameDto.fromJson(json['name']),
        location: LocationDto.fromJson(json['location']),
        email: json['email'],
        login: LoginDto.fromJson(json['login']),
        dob: DobDto.fromJson(json['dob']),
        registered: DobDto.fromJson(json['registered']),
        phone: json['phone'],
        cell: json['cell'],
        id: IdDto.fromJson(json['id']),
        picture: PictureDto.fromJson(json['picture']),
        nat: json['nat'],
      );
}

class DobDto {
  final DateTime date;
  final int age;

  DobDto({required this.date, required this.age});

  factory DobDto.fromJson(Map<String, dynamic> json) => DobDto(
        date: DateTime.parse(json['date']),
        age: json['age'],
      );
}

class IdDto {
  final String name;
  final String? value;

  IdDto({required this.name, required this.value});

  factory IdDto.fromJson(Map<String, dynamic> json) => IdDto(
        name: json['name'],
        value: json['value'],
      );
}

class LocationDto {
  final StreetDto street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final CoordinatesDto coordinates;
  final TimezoneDto timezone;

  LocationDto({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) => LocationDto(
        street: StreetDto.fromJson(json['street']),
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postcode: json['postcode'],
        coordinates: CoordinatesDto.fromJson(json['coordinates']),
        timezone: TimezoneDto.fromJson(json['timezone']),
      );
}

class CoordinatesDto {
  final String latitude;
  final String longitude;

  CoordinatesDto({required this.latitude, required this.longitude});

  factory CoordinatesDto.fromJson(Map<String, dynamic> json) => CoordinatesDto(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}

class StreetDto {
  final int number;
  final String name;

  StreetDto({required this.number, required this.name});

  factory StreetDto.fromJson(Map<String, dynamic> json) => StreetDto(
        number: json['number'],
        name: json['name'],
      );
}

class TimezoneDto {
  final String offset;
  final String description;

  TimezoneDto({required this.offset, required this.description});

  factory TimezoneDto.fromJson(Map<String, dynamic> json) => TimezoneDto(
        offset: json['offset'],
        description: json['description'],
      );
}

class LoginDto {
  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  LoginDto({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        uuid: json['uuid'],
        username: json['username'],
        password: json['password'],
        salt: json['salt'],
        md5: json['md5'],
        sha1: json['sha1'],
        sha256: json['sha256'],
      );
}

class NameDto {
  final String title;
  final String first;
  final String last;

  NameDto({required this.title, required this.first, required this.last});

  factory NameDto.fromJson(Map<String, dynamic> json) => NameDto(
        title: json['title'],
        first: json['first'],
        last: json['last'],
      );
}

class PictureDto {
  final String large;
  final String medium;
  final String thumbnail;

  PictureDto({required this.large, required this.medium, required this.thumbnail});

  factory PictureDto.fromJson(Map<String, dynamic> json) => PictureDto(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail'],
      );
}


extension UsersDtoX on UsersDto {
  UserEntity toEntity() => UserEntity(
        results: results.map((e) => e.toEntity()).toList(),
        info: info.toEntity(),
      );
}

extension InfoDtoX on InfoDto {
  Info toEntity() => Info(
        seed: seed,
        results: results,
        page: page,
        version: version,
      );
}

extension ResultDtoX on ResultDto {
  Result toEntity() => Result(
        gender: gender == "male" ? Gender.MALE : Gender.FEMALE,
        name: name.toEntity(),
        location: location.toEntity(),
        email: email,
        login: login.toEntity(),
        dob: dob.toEntity(),
        registered: registered.toEntity(),
        phone: phone,
        cell: cell,
        id: id.toEntity(),
        picture: picture.toEntity(),
        nat: nat,
      );
}

extension DobDtoX on DobDto {
  Dob toEntity() => Dob(date: date, age: age);
}

extension NameDtoX on NameDto {
  Name toEntity() => Name(title: title, first: first, last: last);
}

extension LocationDtoX on LocationDto {
  Location toEntity() => Location(
        street: street.toEntity(),
        city: city,
        state: state,
        country: country,
        postcode: postcode,
        coordinates: coordinates.toEntity(),
        timezone: timezone.toEntity(),
      );
}

extension StreetDtoX on StreetDto {
  Street toEntity() => Street(number: number, name: name);
}

extension CoordinatesDtoX on CoordinatesDto {
  Coordinates toEntity() =>
      Coordinates(latitude: latitude, longitude: longitude);
}

extension TimezoneDtoX on TimezoneDto {
  Timezone toEntity() => Timezone(offset: offset, description: description);
}

extension LoginDtoX on LoginDto {
  Login toEntity() => Login(
        uuid: uuid,
        username: username,
        password: password,
        salt: salt,
        md5: md5,
        sha1: sha1,
        sha256: sha256,
      );
}

extension IdDtoX on IdDto {
  Id toEntity() => Id(name: name, value: value);
}

extension PictureDtoX on PictureDto {
  Picture toEntity() =>
      Picture(large: large, medium: medium, thumbnail: thumbnail);
}

