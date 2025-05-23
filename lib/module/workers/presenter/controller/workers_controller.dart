import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_card/core/di_config.dart';
import 'package:worker_card/module/workers/data/model/worker.dart';
import 'package:worker_card/module/workers/usecase/load_workers_usecase.dart';
import 'package:worker_card/service/logger_service.dart';

final workersControllerProvider = AsyncNotifierProvider<WorkersController, List<WorkerModel>?>(
  WorkersController.new,
);

class WorkersController extends AsyncNotifier<List<WorkerModel>?> {
  late final LoadWorkersUsecase _loadUsersCase;

  @override
  FutureOr<List<WorkerModel>?> build() {
    _loadUsersCase = ref.watch(loadWorkersUsecaseProvider);
    return null;
  }

  void load() async {
    state = const AsyncValue.loading();
    try {
      final workers = await _loadUsersCase();
      state = AsyncValue.data(workers);
    } catch (err) {
      LoggerService.logError(err);
      state = AsyncValue.error(err, StackTrace.current);
    }
  }

}
