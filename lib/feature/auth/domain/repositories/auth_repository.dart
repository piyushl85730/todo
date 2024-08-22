import "package:todo/core/utils/generic_typedefs.dart";

//ignore:one_member_abstracts
abstract class AuthRepository {
  EitherDynamic<String> loginAnonymously();
}
