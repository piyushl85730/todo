import "package:get/get.dart";
import "package:todo/core/local_db/get_storage_db.dart";
import "package:todo/feature/home/data/model/todo_model.dart";
import "package:todo/feature/home/domain/usecases/notes.dart";
import "package:todo/firebase/cloud_service/todo_fire.dart";
import "package:uuid/uuid.dart";

abstract class HomeRemoteDataSource {
  Future<List<TodoModel>> fetchTodo();

  Future<bool> createTodo(NotesParams params);

  Future<bool> updateTodo(NotesParams params);

  Future<bool> deleteTodo(NotesParams params);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final LocalCache localCache = Get.find<LocalCache>();

  @override
  Future<List<TodoModel>> fetchTodo() async {
    final List<TodoModel> todoList = localCache.fetchListTodo();
    return todoList;
  }

  @override
  Future<bool> createTodo(NotesParams params) async {
    const Uuid uuid = Uuid();
    final TodoModel newToDo = TodoModel().convertToModel(params.todo)
      ..id = uuid.v4();
    final List<dynamic> todos = localCache.localCacheBox.read("todos") ?? [];
    // ignore:cascade_invocations
    todos.add(newToDo.toMap());
    await localCache.localCacheBox.write("todos", todos);
    TodoService().setTodo(newToDo);
    return true;
  }

  @override
  Future<bool> updateTodo(NotesParams params) async {
    final TodoModel newToDo = TodoModel().convertToModel(params.todo);
    await localCache.updateTodo(newToDo);
    TodoService().setTodo(newToDo);
    return true;
  }

  @override
  Future<bool> deleteTodo(NotesParams params) async {
    await localCache.deleteTodo(params.todo);
    TodoService().deleteTodo(params.todo.id!);
    return true;
  }
}
