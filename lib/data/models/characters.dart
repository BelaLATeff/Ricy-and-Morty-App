import 'character_info.dart';
import 'character_results.dart';

class Character {
  CharacterInfo? info;
  List<CharacterResults>? results;

  Character({
    this.info,
    this.results,
  });
  Character.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null) ? CharacterInfo.fromJson(json['info']) : null;
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <CharacterResults>[];
      v.forEach((v) {
        arr0.add(CharacterResults.fromJson(v));
      });
      results = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (results != null) {
      final v = results;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['results'] = arr0;
    }
    return data;
  }
}
