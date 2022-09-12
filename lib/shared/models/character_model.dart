import 'package:mottu/shared/models/thumbnail_model.dart';

class CharacterModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;

  CharacterModel(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceURI;
    return data;
  }
}
