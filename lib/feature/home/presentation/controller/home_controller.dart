import "package:dartz/dartz.dart";
import "package:get/get.dart";
import "package:todo/core/error/failure.dart";
import "package:todo/core/shared/domain/usecases/usecase.dart";
import "package:todo/core/utils/utils.dart";
import "package:todo/feature/home/domain/entity/todo.dart";
import "package:todo/feature/home/domain/usecases/notes.dart";

class HomeController extends GetxController {
  HomeController({
    required this.fetchNotesUC,
    required this.createNoteUC,
    required this.updateNoteUC,
    required this.deleteNoteUC,
  });

  final FetchNotesUC fetchNotesUC;
  final CreateNoteUC createNoteUC;
  final UpdateNoteUC updateNoteUC;
  final DeleteNoteUC deleteNoteUC;

  final RxList<Todo> todoList = <Todo>[].obs;
  final RxList<Todo> completedTodoList = <Todo>[].obs;
  final RxList<Todo> pendingTodoList = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllNotes();
    ever(todoList, (List<Todo> todos) {
      final List<Todo> completeList =
          todos.where((Todo element) => element.isCompleted == true).toList();
      completedTodoList.value = completeList;

      final List<Todo> pendingList =
          todos.where((Todo element) => element.isCompleted == false).toList();
      pendingTodoList.value = pendingList;
    });
  }

  Future<void> fetchAllNotes() async {
    final Either<Failure, List<Todo>> result = await fetchNotesUC(NoParams());
    result.fold(
      (Failure left) {
        String error = "";
        if (left is CacheFailure) {
          error = left.error;
        }
        showToast(title: error);
      },
      (List<Todo> right) {
        todoList.value = right;
      },
    );
  }

  Future<void> createNotes(Todo todo) async {
    final Either<Failure, bool> result =
        await createNoteUC(NotesParams(todo: todo));
    await result.fold(
      (Failure left) {
        String error = "";
        if (left is CacheFailure) {
          error = left.error;
        }
        showToast(title: error);
      },
      (bool right) async {
        await fetchAllNotes();
        Get.back();
      },
    );
  }

  Future<void> updateNotes(Todo todo) async {
    final Either<Failure, bool> result =
        await updateNoteUC(NotesParams(todo: todo));
    result.fold(
      (Failure left) {
        String error = "";
        if (left is CacheFailure) {
          error = left.error;
        }
        showToast(title: error);
      },
      (bool right) {
        fetchAllNotes();
        Get.back();
      },
    );
  }

  Future<void> deleteNotes(Todo todo) async {
    final Either<Failure, bool> result =
        await deleteNoteUC(NotesParams(todo: todo));
    result.fold(
      (Failure left) {
        String error = "";
        if (left is CacheFailure) {
          error = left.error;
        }
        showToast(title: error);
      },
      (bool right) {
        fetchAllNotes();
      },
    );
  }
}
