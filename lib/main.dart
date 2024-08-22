import "package:flutter/material.dart";
import "package:todo/entry.dart";
import "package:todo/injection_container/injection_container.dart";

Future<void> main() async {
  await init();
  runApp(const Entry());
}
