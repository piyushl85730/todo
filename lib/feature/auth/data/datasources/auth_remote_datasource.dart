import "package:firebase_auth/firebase_auth.dart";

//ignore:one_member_abstracts
abstract class AuthRemoteDataSource {
  Future<String> loginAnonymously();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> loginAnonymously() async {
    final UserCredential result = await auth.signInAnonymously();
    if (result.user != null) {
      final User user = result.user!;
      return user.uid;
    }
    return "";
  }
}
