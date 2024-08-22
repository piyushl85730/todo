import "package:cloud_firestore/cloud_firestore.dart";
import "package:todo/feature/home/data/model/todo_model.dart";

class TodoService {
  TodoService() {
    _fs.settings = const Settings(persistenceEnabled: true);
  }

  final _fs = FirebaseFirestore.instance;
  final _coll = "todo";

  Query getTodoQuery() => FirebaseFirestore.instance.collection(_coll);

  Future<List<TodoModel>?> getTodoList() async =>
      _fs.collection(_coll).get(const GetOptions()).then((snapshot) {
        final todoModels = <TodoModel>[];
        if (snapshot.docs.isNotEmpty) {
          for (final f in snapshot.docs) {
            //debugPrint("getTodoList -> ${jsonEncode(f.data())}");
            final todoModel = TodoModel.fromMap(f.data());
            todoModels.add(todoModel);
          }
          return todoModels;
        } else {
          return null;
        }
      });

  Future<TodoModel?> getTodoByReferences(String refId) async {
    final DocumentReference reference = _fs.doc(
      "$_coll/$refId}",
    );
    final DocumentSnapshot snapshot = await _fs.doc(reference.path).get();
    if (snapshot.data() != null) {
      final todoModel = TodoModel.fromMap(
        snapshot.data() as Map<String, dynamic>,
      );
      return todoModel;
    } else {
      return null;
    }
  }

  Future<String?> setTodo(TodoModel todoModel) async {
    try {
      return await _fs
          .collection("/$_coll")
          .doc(todoModel.id)
          .set(todoModel.toMap())
          .then((value) => todoModel.id);
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteTodo(String refId) async {
    try {
      return await _fs
          .collection("/$_coll")
          .doc(refId)
          .delete()
          .then((value) => true);
    } catch (e) {
      return false;
    }
  }
}
