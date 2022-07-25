import 'package:todo_firebase/app/domain/entities/todo_entity.dart';

import '../../core/http/http.dart';

class FirebaseTodolistModel {
  final String title;
  final String category;
  final bool status;

  FirebaseTodolistModel({
    required this.title,
    required this.category,
    required this.status,
  });

  factory FirebaseTodolistModel.fromJson(Map json) {
    if (!json.containsKey('title') ||
        !json.containsKey('category') ||
        !json.containsKey('status')) {
      throw HttpError.invalidData;
    }

    return FirebaseTodolistModel(
      title: json['title'],
      category: json['category'],
      status: json['status'],
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(title: title, status: status, category: category);
  }
}
