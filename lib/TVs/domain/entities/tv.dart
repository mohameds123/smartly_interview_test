import 'package:equatable/equatable.dart';

class Tv extends Equatable{
  final int id;
  final String backdropPath;
  final String originalName;

  const Tv({
    required this.id,
    required this.backdropPath,
    required this.originalName,
});

  @override
  List<Object?> get props => [id,backdropPath,originalName];
}