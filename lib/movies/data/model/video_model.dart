import 'package:movies_app/movies/domain/entities/video_entities.dart';

class VideoModel extends VideosEntities {
  const VideoModel({required super.id, required super.key});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      key: json['key'],
    );
  }
}
