import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/models/task_model.dart';
import 'package:ipotato_timer/stores/timers_store.dart';
import 'package:ipotato_timer/widgets/custom_text_field.dart';
import 'package:ipotato_timer/widgets/duration_selector_widget.dart';

class AddTimerModal {
  var taskTitleController = TextEditingController();
  var taskDescriptionController = TextEditingController();
  late Duration maxDuration;
  var formKey = GlobalKey<FormState>();
  bool isAutoValidate = false;

  showAddTimerModalSheet(BuildContext buildContext) {
    showModalBottomSheet(
      context: buildContext,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 10),
          curve: Curves.decelerate,
          child: BottomSheet(
            enableDrag: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            onClosing: () {},
            builder: (BuildContext context) {
              return Container(
                color: Theme.of(context).colorScheme.surfaceTint,
                height: MediaQuery.of(context).size.height,
                child: StatefulBuilder(
                    builder: (BuildContext context, setState) =>
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height - 61,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32.0, right: 64, top: 48),
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.disabled,
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Add Task",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onInverseSurface),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextField(
                                          fieldName: 'Title',
                                          textEditingController:
                                              taskTitleController,
                                          maxLines: 1,
                                          hintText: 'Superdesigner',
                                        ),
                                        const SizedBox(
                                          height: 36,
                                        ),
                                        CustomTextField(
                                          fieldName: 'Description',
                                          textEditingController:
                                              taskDescriptionController,
                                          maxLines: 12,
                                          hintText: 'e.g. john@gmail.com',
                                        ),
                                        const SizedBox(
                                          height: 36,
                                        ),
                                        DurationSelectorWidget(
                                          onDurationChanged: (duration) {
                                            maxDuration = duration;
                                          },
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 61,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer,
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                      ),
                                    ),
                                    onPressed: () {
                                      final timersStore =
                                          GetIt.I<TimersStore>();
                                      timersStore.addTask(TaskModel(
                                          taskName: taskTitleController.text,
                                          taskDescription:
                                              taskDescriptionController.text,
                                          taskComplete: false,
                                          taskDuration: maxDuration));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Add Task",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onInverseSurface),
                                    )),
                              ),
                            ],
                          ),
                        )),
              );
            },
          ),
        );
      },
    );
  }
}
