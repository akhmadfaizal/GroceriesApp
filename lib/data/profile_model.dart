class DataProfile {
  List<Result>? results;
  Info? info;

  DataProfile({
    this.results,
    this.info,
  });

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );
}

class Info {
  String? seed;
  int? results;
  int? page;
  String? version;

  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );
}

class Result {
  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Registered? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        dob: Dob.fromJson(json["dob"]),
        registered: Registered.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromJson(json["id"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );
}

class Dob {
  DateTime? date;
  int? age;

  Dob({
    this.date,
    this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );
}

class Registered {
  DateTime? date;
  int? age;

  Registered({
    this.date,
    this.age,
  });

  factory Registered.fromJson(Map<String, dynamic> json) => Registered(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );
}

class Id {
  String? name;
  String? value;

  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  int? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
      );
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );
}

class Street {
  int? number;
  String? name;

  Street({
    this.number,
    this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  String? offset;
  String? description;

  Timezone({
    this.offset,
    this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
      );
}

class Login {
  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );
}
