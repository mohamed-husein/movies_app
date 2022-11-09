import 'package:movies_app/tv/domain/entities/tv_videos.dart';

class TvVideosModel extends Videos {
  const TvVideosModel({
    required super.id,
    required super.key,
  });

  factory TvVideosModel.fromJson(Map<String, dynamic> json) {
    return TvVideosModel(
      id: json['id'],
      key: json['key'],
    );
  }
}
