import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/stores/timers_store.dart';

class SingleTaskWidget extends StatelessWidget {
  final int index;
  final timersStore = GetIt.I<TimersStore>();

  SingleTaskWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        color: const Color(0xffEEF5F8),
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Observer(
              builder: (context) {
                if (!timersStore.taskList[index].taskComplete) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Text(
                        "${timersStore.taskList[index].taskDuration.inHours.toString().padLeft(2, "0")}:${timersStore.taskList[index].taskDuration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${timersStore.taskList[index].taskDuration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(3),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            timersStore.setTaskAsComplete(index: index);
                          },
                          icon: Icon(
                            Icons.stop,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(3),
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            timersStore.reduceTaskTime(index: index);
                          },
                          icon: Icon(
                            Icons.play_arrow,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/isoundwave.svg'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          'FINISHED',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      SvgPicture.asset('assets/icons/isoundwave.svg'),
                    ],
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29.0, left: 32),
              child: Text(
                timersStore.taskList[index].taskName,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29.0, left: 32),
              child: Text(
                timersStore.taskList[index].taskDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (timersStore.taskList[index].taskComplete)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          Theme.of(context).colorScheme.onTertiaryContainer,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    onPressed: () {
                      timersStore.setTaskAsComplete(index: index);
                    },
                    child: Text(
                      "Mark Complete",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onInverseSurface),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
