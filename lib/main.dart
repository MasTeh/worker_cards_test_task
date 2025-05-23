import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_card/module/workers/presenter/page/workers_list.dart';
import 'package:worker_card/service/logger_service.dart';

void main() async {  
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        LoggerService.logError(details);
      };
      runApp(const App());
    },
    (error, stackTrace) {
      LoggerService.logError(error);
    },
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Worker Card',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const WorkersList(),
      ),
    );
  }
}
