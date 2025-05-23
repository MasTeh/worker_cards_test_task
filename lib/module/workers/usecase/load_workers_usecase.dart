import 'package:worker_card/module/workers/data/model/worker.dart';
import 'package:worker_card/module/workers/data/repository/workers_repository.dart';
import 'package:worker_card/module/workers/domain/usecase/load_users_usecase.dart';

class LoadWorkersUsecase implements LoadUserListUsecase {
  final WorkersRepository _repository;

  const LoadWorkersUsecase(this._repository);

  @override
  Future<List<WorkerModel>> call() async{
    return _repository.getUsers();
  }
}