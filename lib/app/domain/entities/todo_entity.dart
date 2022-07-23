import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String title;
  final bool status;
  final String category;

  const TodoEntity({
    required this.title,
    required this.status,
    required this.category,
  });

  @override
  List<Object> get props => [
        title,
        status,
        category,
      ];
}
