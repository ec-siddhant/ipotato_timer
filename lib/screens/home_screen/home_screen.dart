import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/models/task_model.dart';
import 'package:ipotato_timer/screens/home_screen/add_task_modal.dart';
import 'package:ipotato_timer/stores/timers_store.dart';
import 'package:ipotato_timer/widgets/no_tasks_placeholder.dart';
import 'package:ipotato_timer/widgets/single_task_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _timersStore = GetIt.I<TimersStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 31),
              child: Text(
                'Potato Timer',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_circle_outline_sharp,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        onPressed: () {
          AddTimerModal().showAddTimerModalSheet(context);
        },
      ),
      body: Observer(
        builder: (context) {
          print("changed");

          return _timersStore.taskList.isEmpty
              ? const NoTasksPlaceHolder()
              : ListView.builder(
                  itemCount: _timersStore.taskList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 20),
                      child: SingleTaskWidget(
                        index: i,
                      ),
                    );
                  },
                );
        },
      ),
    ));
  }
}