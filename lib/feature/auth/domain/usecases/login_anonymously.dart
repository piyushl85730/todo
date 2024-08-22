import "package:todo/core/shared/domain/usecases/usecase.dart";
import "package:todo/core/utils/generic_typedefs.dart";
import "package:todo/feature/auth/domain/repositories/auth_repository.dart";

class LoginAnonymouslyUC implements UseCase<String, NoParams> {
  LoginAnonymouslyUC({required this.authRepository});

  final AuthRepository authRepository;

  @override
  EitherDynamic<String> call(NoParams params) =>
      authRepository.loginAnonymously();
}
