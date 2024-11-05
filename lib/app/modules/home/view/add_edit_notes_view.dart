import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taker/utils/app_preferences.dart';
import 'package:note_taker/utils/custom_widgets/custom_dropdown.dart';
import 'package:note_taker/utils/custom_widgets/gaps.dart';

import '../../../../utils/custom_widgets/custom_textfield_widget.dart';
import '../../../../utils/custom_widgets/primary_buttons.dart';
import '../controller/home_view_controller.dart';
import '../models/user_notes_list/user_notes_list.dart';

class AddEditNotesView extends GetView<HomeViewController> {
  const AddEditNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: PrimaryButton(
          onTap: () async {
            if (controller.addeditNotesFormKey.currentState!.validate()) {
              var newNote = NotesList(
                id: controller.generateRandomId(),
                userName: controller.userDetails.value.username,
                title: controller.titleCTR.value.text,
                priority: controller.priorityCTR.value.text,
                details: controller.detailsCTR.value.text,
                updatedAt: DateTime.now().toString(),
              );

              await AppPreferences.addNote(newNote);
            }
          },
          title: 'Add',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.addeditNotesFormKey,
          child: Column(
            children: [
              CustomInputField(
                controller: controller.titleCTR.value,
                title: 'Title',
                textInputType: TextInputType.name,
                hintText: "Please enter your first name",
                maxLength: 20,
                onChanged: (value) {
                  controller.userDetails.value.firstname = value;
                },
              ),
              Gaps.kheight20,
              CustomDropDown(
                hintText: "Select one",
                title: "Select Priority",
                value: controller.priorityCTR.value.text,
                items: controller.priorityTypes,
                onChanged: (value) {},
              ),
              Gaps.kheight20,
              CustomInputField(
                controller: controller.detailsCTR.value,
                title: 'Details',
                textInputType: TextInputType.streetAddress,
                hintText: "Please enter your first name",
                maxLines: 10,
                onChanged: (value) {
                  controller.userDetails.value.firstname = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
