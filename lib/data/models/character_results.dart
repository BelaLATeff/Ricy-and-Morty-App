class CharacterResults {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  CharacterResultsOrigin? origin;
  CharacterResultsLocation? location;
  String? image;
  List<String?>? episode;
  String? url;
  String? created;

  CharacterResults({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });
  CharacterResults.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    status = json['status']?.toString();
    species = json['species']?.toString();
    type = json['type']?.toString();
    gender = json['gender']?.toString();
    origin = (json['origin'] != null)
        ? CharacterResultsOrigin.fromJson(json['origin'])
        : null;
    location = (json['location'] != null)
        ? CharacterResultsLocation.fromJson(json['location'])
        : null;
    image = json['image']?.toString();
    if (json['episode'] != null) {
      final v = json['episode'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      episode = arr0;
    }
    url = json['url']?.toString();
    created = json['created']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    if (episode != null) {
      final v = episode;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['episode'] = arr0;
    }
    data['url'] = url;
    data['created'] = created;
    return data;
  }

  toLowerCase() {}
}

class CharacterResultsLocation {
  String? name;
  String? url;

  CharacterResultsLocation({
    this.name,
    this.url,
  });
  CharacterResultsLocation.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class CharacterResultsOrigin {
  String? name;
  String? url;

  CharacterResultsOrigin({
    this.name,
    this.url,
  });
  CharacterResultsOrigin.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
