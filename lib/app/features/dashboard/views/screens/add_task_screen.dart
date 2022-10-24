import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_management/app/common/widgets/custom_button.dart';
import 'package:project_management/app/common/widgets/custom_textField.dart';
import 'package:project_management/app/constans/global_variables.dart';
import 'package:project_management/app/constans/utils.dart';
import 'package:project_management/app/utils/services/admin_services.dart';

class AddTaskScreen extends StatefulWidget {
  static const String routeName = '/add-task';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddTaskScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _assignmentUserController =
      TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  final AdminServices adminServices = AdminServices();

  String status = 'back-log';
  String category = 'Development';
  String createdBy = 'admin';

  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _tituloController.dispose();
    _priorityController.dispose();
    _descriptionController.dispose();
    _assignmentUserController.dispose();
    _pointsController.dispose();
  }

  List<String> taskCategories = [
    'Development',
    'Marketing',
    'Desing',
  ];

  void addTask() {
    if (_addProductFormKey.currentState!.validate()) {
      adminServices.createTask(
        context: context,
        title: _tituloController.text,
        priority: _priorityController.text,
        description: _descriptionController.text,
        assignmentUser: _assignmentUserController.text,
        points: double.parse(_pointsController.text),
        category: category,
        images: images,
        status: status,
        createdBy: createdBy,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Add Task',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Select Tasks Images',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: _tituloController,
                  hintText: 'Task Title',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _priorityController,
                  hintText: 'Task priority',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _pointsController,
                  hintText: 'Points',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _assignmentUserController,
                  hintText: 'Assignment User',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    style: TextStyle(color: Colors.black),
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: taskCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'add',
                  onTap: addTask,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
