import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_card/module/workers/presenter/controller/workers_controller.dart';
import 'package:worker_card/module/workers/presenter/page/worker_details.dart';
import 'package:worker_card/module/workers/presenter/widget/worker_list_item.dart';
import 'package:worker_card/module/workers/presenter/widget/workers_list_error.dart';

class WorkersList extends ConsumerStatefulWidget {
  const WorkersList({super.key});

  @override
  ConsumerState<WorkersList> createState() => _WorkersListState();
}

class _WorkersListState extends ConsumerState<WorkersList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(workersControllerProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final workersController = ref.watch(workersControllerProvider);
    final bool isLoading =
        workersController.isLoading && workersController.value == null;
    final bool isReloading =
        workersController.isLoading && workersController.value != null;
    final bool hasLoadedElements = (workersController.value?.length ?? 0) > 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Workers List')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(workersControllerProvider.notifier).load();
        },

        child: Builder(
          builder: (context) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (workersController.hasError) {
              return WorkersListError(
                onRetry: () {
                  ref.read(workersControllerProvider.notifier).load();
                },
                error: workersController.error,
              );
            }

            if (hasLoadedElements) {
              return Stack(
                children: [
                  if (isReloading) LinearProgressIndicator(),
                  ListView.builder(
                    itemCount: workersController.value?.length ?? 0,
                    itemBuilder: (context, index) {
                      final worker = workersController.value![index];
                      return WorkerListItem(
                        worker: worker,                        
                        onTap: (worker) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WorkerDetails(worker: worker),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
