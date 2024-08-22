import "dart:async";

import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:todo/core/local_db/get_storage_db.dart";
import "package:todo/firebase_options.dart";
import "package:todo/injection_container/injects/inject_controllers.dart";
import "package:todo/injection_container/injects/inject_datasources.dart";
import "package:todo/injection_container/injects/inject_repositories.dart";
import "package:todo/injection_container/injects/inject_usecases.dart";

Future<void> init() async {
  final LocalCache localCache = LocalCache();
  WidgetsFlutterBinding.ensureInitialized();

  await localCache.getStorageInit();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// services
  Get.lazyPut<LocalCache>(() => localCache, fenix: true);

  /// Data Sources
  InjectableDataSources.inject();

  /// Repositories
  InjectableRepositories.inject();

  /// Use cases
  InjectableUseCases.inject();

  /// Controllers
  InjectableControllers.inject();
}
