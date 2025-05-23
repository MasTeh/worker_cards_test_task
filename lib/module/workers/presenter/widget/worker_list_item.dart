import 'package:flutter/material.dart';
import 'package:worker_card/module/workers/data/model/worker.dart';
import 'package:worker_card/module/workers/domain/enum/available.dart';

class WorkerListItem extends StatelessWidget {
  const WorkerListItem({
    super.key,
    required this.worker,
    required this.onTap,
  });

  final WorkerModel worker;
  final Function(WorkerModel) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: worker.id,
        child: CircleAvatar(
          backgroundImage: NetworkImage(worker.avatar.imageUrl),
        ),
      ),
      title: Text("${worker.firstName} ${worker.lastName}"),
      trailing: switch (worker.status) {
        AvailableStatus.available => const Icon(
          Icons.circle,
          color: Colors.green,
          size: 16,
        ),
        AvailableStatus.unavailable => const Icon(
          Icons.circle_outlined,
          color: Colors.green,
          size: 16,
        ),
        AvailableStatus.unknown => const SizedBox(),
      },
      subtitle: Text(worker.location),
      onTap: () {
        onTap(worker);
      },
    );
  }
}
