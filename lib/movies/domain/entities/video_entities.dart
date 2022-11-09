import 'package:equatable/equatable.dart';

class VideosEntities extends Equatable
{
  final String id;
  final String key;

  const VideosEntities({required this.id,required this.key});

  @override
  List<Object?> get props => [id,key];
}