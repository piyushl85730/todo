import "package:equatable/equatable.dart";
import "package:todo/core/utils/generic_typedefs.dart";

// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  EitherDynamic<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
