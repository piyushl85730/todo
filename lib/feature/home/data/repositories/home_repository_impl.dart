import "package:dartz/dartz.dart";
import "package:todo/core/error/exceptions.dart";
import "package:todo/core/error/failure.dart";
import "package:todo/core/utils/generic_typedefs.dart";
import "package:todo/feature/home/data/datasources/home_remote_datasource.dart";
import "package:todo/feature/home/domain/entity/todo.dart";
import "package:todo/feature/home/domain/repositories/home_repository.dart";
import "package:todo/feature/home/domain/usecases/notes.dart";

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;

  @override
  EitherDynamic<List<Todo>> fetchTodo() async {
    try {
      final List<Todo> data = await homeRemoteDataSource.fetchTodo();
      return Right(data);
    } on CacheException catch (e) {
      return Left(CacheFailure(error: e.error));
    }
  }

  @override
  EitherDynamic<bool> createTodo(NotesParams params) async {
    try {
      final bool data = await homeRemoteDataSource.createTodo(params);
      return Right(data);
    } on CacheException catch (e) {
      return Left(CacheFailure(error: e.error));
    }
  }

  @override
  EitherDynamic<bool> updateTodo(NotesParams params) async {
    try {
      final bool data = await homeRemoteDataSource.updateTodo(params);
      return Right(data);
    } on CacheException catch (e) {
      return Left(CacheFailure(error: e.error));
    }
  }

  @override
  EitherDynamic<bool> deleteTodo(NotesParams params) async {
    try {
      final bool data = await homeRemoteDataSource.deleteTodo(params);
      return Right(data);
    } on CacheException catch (e) {
      return Left(CacheFailure(error: e.error));
    }
  }
}
