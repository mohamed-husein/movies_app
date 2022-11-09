import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final int id;
  final String name;

  const Season({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}