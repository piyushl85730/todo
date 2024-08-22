import "package:equatable/equatable.dart";

//ignore:must_be_immutable
class Todo extends Equatable {
  Todo({
    this.id,
    this.uid,
    this.noteTitle,
    this.noteDescription,
    this.createdDate,
    this.updatedDate,
    this.isCompleted,
  });

  String? id;
  String? uid;
  String? noteTitle;
  String? noteDescription;
  String? createdDate;
  String? updatedDate;
  bool? isCompleted;

  @override
  List<Object?> get props => [
        id,
        uid,
        noteTitle,
        noteDescription,
        createdDate,
        updatedDate,
        isCompleted,
      ];
}
