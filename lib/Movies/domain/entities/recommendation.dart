import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final int id;
  final String? backdropPath;

  const Recommendation({
    this.backdropPath,
    required this.id,
});
  @override
  List<Object?> get props =>[id,backdropPath];
}