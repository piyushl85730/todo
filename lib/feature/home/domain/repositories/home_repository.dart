import "package:todo/core/utils/generic_typedefs.dart";
import "package:todo/feature/home/domain/entity/todo.dart";
import "package:todo/feature/home/domain/usecases/notes.dart";

abstract class HomeRepository {
  EitherDynamic<List<Todo>> fetchTodo();

  EitherDynamic<bool> createTodo(NotesParams params);

  EitherDynamic<bool> updateTodo(NotesParams params);

  EitherDynamic<bool> deleteTodo(NotesParams params);
}
