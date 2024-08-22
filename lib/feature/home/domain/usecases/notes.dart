import "package:equatable/equatable.dart";
import "package:todo/core/shared/domain/usecases/usecase.dart";
import "package:todo/core/utils/generic_typedefs.dart";
import "package:todo/feature/home/domain/entity/todo.dart";
import "package:todo/feature/home/domain/repositories/home_repository.dart";

class FetchNotesUC implements UseCase<List<Todo>, NoParams> {
  FetchNotesUC({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  EitherDynamic<List<Todo>> call(NoParams params) => homeRepository.fetchTodo();
}

class CreateNoteUC implements UseCase<bool, NotesParams> {
  CreateNoteUC({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  EitherDynamic<bool> call(NotesParams params) =>
      homeRepository.createTodo(params);
}

class UpdateNoteUC implements UseCase<bool, NotesParams> {
  UpdateNoteUC({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  EitherDynamic<bool> call(NotesParams params) =>
      homeRepository.updateTodo(params);
}

class DeleteNoteUC implements UseCase<bool, NotesParams> {
  DeleteNoteUC({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  EitherDynamic<bool> call(NotesParams params) =>
      homeRepository.deleteTodo(params);
}

class NotesParams extends Equatable {
  const NotesParams({required this.todo});

  final Todo todo;

  @override
  List<Object?> get props => [todo];
}
