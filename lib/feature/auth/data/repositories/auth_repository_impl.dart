import "package:dartz/dartz.dart";
import "package:todo/core/error/exceptions.dart";
import "package:todo/core/error/failure.dart";
import "package:todo/core/utils/generic_typedefs.dart";
import "package:todo/feature/auth/data/datasources/auth_remote_datasource.dart";
import "package:todo/feature/auth/domain/repositories/auth_repository.dart";

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authRemoteDataSource});

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  EitherDynamic<String> loginAnonymously() async {
    try {
      final String data = await authRemoteDataSource.loginAnonymously();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(error: e.error));
    }
  }
}
