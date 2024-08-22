import "package:get_storage/get_storage.dart";
import "package:todo/core/constants/string_constants.dart";
import "package:todo/feature/home/data/model/todo_model.dart";
import "package:todo/feature/home/domain/entity/todo.dart";

class LocalCache {
  final GetStorage _localCacheBox = GetStorage(StorageString.strLocalCacheBox);

  GetStorage get localCacheBox => _localCacheBox;

  Future<void> getStorageInit() async {
    await GetStorage.init();
  }

  Future<void> setBool(String key, bool value) =>
      localCacheBox.write(key, value);

  bool getBool(String key) => localCacheBox.read(key) ?? false;

  Future<void> setInt(String key, int value) => localCacheBox.write(key, value);

  List<TodoModel> fetchListTodo() {
    final List<dynamic> todos = localCacheBox.read("todos") ?? [];

    // ignore:unnecessary_lambdas,always_specify_types
    return todos.map((todoMap) => TodoModel.fromMap(todoMap)).toList();
  }

  List<Map<String, dynamic>> fetchTodos() {
    final List<Map<String, dynamic>> todos = localCacheBox.read("todos") ?? [];
    return todos;
  }

  Future<void> updateTodo(TodoModel updatedToDo) async {
    final List<dynamic> todos = localCacheBox.read("todos") ?? [];

    final int index = todos.indexWhere((todo) => todo["id"] == updatedToDo.id);
    if (index != -1) {
      todos[index] = updatedToDo.toMap();
      await localCacheBox.write("todos", todos);
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    final List<dynamic> todos = localCacheBox.read("todos") ?? [];

    // ignore:always_specify_types,cascade_invocations
    todos.removeWhere((todoItem) => todoItem["id"] == todo.id);
    await localCacheBox.write("todos", todos);
  }

  void removeAllData() {
    // removeData(Preferences.isInAppReviewShow);
  }

  Future<void> removeData(String key) => localCacheBox.remove(key);
}

class Preferences {
  // Non Deletable(Persistent)
  static const String language = "language";
}
