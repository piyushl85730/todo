import "package:todo/feature/home/domain/entity/todo.dart";

//ignore:must_be_immutable
class TodoModel extends Todo {
  TodoModel({
    super.id,
    super.uid,
    super.noteTitle,
    super.noteDescription,
    super.isCompleted = false,
    super.createdDate,
    super.updatedDate,
  });

  factory TodoModel.fromMap(Map<String, dynamic> map) => TodoModel(
        id: map["id"],
        uid: map["uid"],
        noteTitle: map["noteTitle"],
        noteDescription: map["noteDescription"],
        createdDate: map["createdDate"],
        updatedDate: map["updatedDate"],
        isCompleted: map["isCompleted"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "uid": uid,
        "noteTitle": noteTitle,
        "noteDescription": noteDescription,
        "createdDate": createdDate,
        "updatedDate": updatedDate,
        "isCompleted": isCompleted,
      };

  TodoModel convertToModel(Todo todo) => TodoModel(
        id: todo.id,
        uid: todo.uid,
        noteTitle: todo.noteTitle,
        noteDescription: todo.noteDescription,
        createdDate: todo.createdDate,
        updatedDate: todo.updatedDate,
        isCompleted: todo.isCompleted,
      );
}
