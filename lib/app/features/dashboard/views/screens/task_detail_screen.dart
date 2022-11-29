import 'dart:convert';
import 'dart:html';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:project_management/app/features/dashboard/views/components/button_edit_task.dart';

import 'package:project_management/app/utils/widgets/sidebar/sidebar_task.dart';

import '../../../../constans/app_constants.dart';

import '../../../../shared_components/responsive_builder.dart';
import '../../../../utils/services/admin_services.dart';
import '../../../../utils/widgets/bar_post_task.dart';
import '../../models/tasks.dart';

import '../components/input_field.dart';

class TaskDetailsScreen extends StatefulWidget {
  static const String routeName = '/task-details';

  final Task task;

  const TaskDetailsScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
                child: SidebarTask(),
              ),
            ),
      appBar: AppBar(backgroundColor: const Color(0xff48409E)),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: [
            const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            TaskDetails(task: widget.task),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: (constraints.maxWidth < 950) ? 6 : 9,
                child: TaskDetails(task: widget.task),
              ),
              //const Flexible(flex: 4, child: TaskResponsive())
            ],
          );
        },
        desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SidebarHomeTask(),
              Flexible(
                flex: (constraints.maxWidth < 1360) ? 4 : 3,
                child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius),
                    ),
                    child: SidebarTask()),
              ),
              Flexible(
                flex: 9,
                child: TaskDetails(task: widget.task),
              ),
            ],
          );
        },
      )),
    );
  }
}

class TaskDetails extends StatefulWidget {
  final Task task;

  const TaskDetails({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

QuillController _controller = QuillController.basic();

class _TaskDetailsState extends State<TaskDetails> {
  List categoryItemlist = [];

  Future getAllCategory() async {
    var baseUrl = "https://server-flutterm.herokuapp.com/admin/get-users";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemlist = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getAllCategory();
    _pointsController.text = widget.task.points.toString();
    _assignmentUserController.text = widget.task.assignmentUser;
    _descriptionController.text = widget.task.description;
    _tituloController.text = widget.task.title;
    // _descriptionController.dispose();
    // _assignmentUserController.dispose();
    // _pointsController.dispose();
  }

  var dropdownvalue;

  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _assignmentUserController =
      TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  final AdminServices adminServices = AdminServices();

  final DateTime _selectedDate = DateTime.now();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(minutes: 5));

  late String _startTime = DateFormat('hh:mm a').format(_startDate).toString();
  late String _endTime = DateFormat('hh:mm a').format(_endDate).toString();

  String status = 'backlog';
  String category = 'Development';
  String createdBy = 'admin';
  String priority = 'Medium';
  String label = 'Staff augmentation';

  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  List<String> taskCategories = [
    'Development',
    'Marketing',
    'Desing',
  ];
  List<String> priorityCategories = [
    'Medium',
    'Hight',
    'Low',
  ];
  List<String> statusCategories = [
    'backlog',
    'ToDo',
    'inprogress',
    'done',
    'approved',
  ];
  List<String> labelCategories = [
    'Staff augmentation',
    'Review',
    'Documentacion',
    'En Desarrollo',
    'Maquetado',
  ];
  List<String> createdByCategories = [
    'admin',
  ];

  void updateTask() {
    DateTime startDate = DateFormat('MM/dd/yyyy hh:mm a')
        .parse('${DateFormat.yMd().format(_startDate)} $_startTime');
    DateTime endDate = DateFormat('MM/dd/yyyy hh:mm a')
        .parse('${DateFormat.yMd().format(_endDate)} $_endTime');

    adminServices.update(
        context: context,
        title: _tituloController.text,
        priority: priority,
        description: _descriptionController.text,
        points: double.parse(_pointsController.text),
        category: widget.task.category,
        assignmentUser: dropdownvalue,
        //images: images,
        status: status,
        createdBy: createdBy,
        label: widget.task.label,
        startDate: startDate.toString(),
        endDate: endDate.toString(),
        id: widget.task.id.toString());

    print(_addProductFormKey);
  }

  void sendPoints() {
    adminServices.sendPoints(
        context: context,
        fromUsername: 'admin@gmail.com'.toString(),
        toUsername: widget.task.assignmentUser,
        //amount: double.parse(_pointsController.text),
        amount: widget.task.points,
        summary: 'Complete a daily task'.toString());

    adminServices.changeTaskStatus(
      context: context,
      status: 'approved',
      task: widget.task,
    );
  }
  // void selectImages() async {
  //   var res = await pickImages();
  //   setState(() {
  //     images = res;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();

    _tituloController.dispose();

    _descriptionController.dispose();

    _assignmentUserController.dispose();

    _pointsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Task task = ModalRoute.of(context).settings.arguments;
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    final format = DateFormat.jm();

    return SingleChildScrollView(
      child: Wrap(children: [
        const SizedBox(width: 200),
        SizedBox(
          width: 1000,
          height: 1200,
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    //margin: const EdgeInsets.only(right: 100),
                    width: 850,
                    child: Column(
                      children: [
                        TextFormField(
                            //initialValue: widget.task.title,

                            controller: _tituloController,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 30),
                            decoration: const InputDecoration(
                                hintText: "Titulo de la tarea",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 25))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    children: [
                      const SizedBox(width: 25),
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Color.fromARGB(255, 211, 211, 211),
                        backgroundImage:
                            AssetImage('assets/images/raster/avatar-1.png'),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      DropdownButton(
                        hint: const Text('Select User'),
                        items: categoryItemlist.map((item) {
                          return DropdownMenuItem(
                            value: item['email'].toString(),
                            child: Text(item['email'].toString()),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            dropdownvalue = newVal;
                            //print(dropdownvalue);
                          });
                        },
                        value: dropdownvalue,
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 236, 236),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          style: const TextStyle(color: Colors.black),
                          value: createdBy,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: createdByCategories.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              createdBy = newVal!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 236, 236),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          style: const TextStyle(color: Colors.black),
                          value: status,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: statusCategories.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              status = newVal!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: 120,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 236, 236),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          style: const TextStyle(color: Colors.black),
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
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 50),
                        child: Wrap(children: [
                          SizedBox(
                            width: 100,
                            child: DropdownButton(
                              style: const TextStyle(color: Colors.black),
                              value: priority,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: priorityCategories.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  priority = newVal!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(2.0),
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 244, 146, 146),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton(
                              style: const TextStyle(color: Colors.black),
                              value: label,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: labelCategories.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  label = newVal!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 239, 239),
                                borderRadius: BorderRadius.circular(10)),
                            width: 200,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                //initialValue: widget.task.points.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                controller: _pointsController,
                                decoration: const InputDecoration(
                                    hintText: "    Puntos",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                // hintText: 'Points',
                              ),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Wrap(
                    children: [
                      Flex(direction: Axis.vertical, children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 500,
                          height: 80,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 239, 239, 239),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            //initialValue: widget.task.description,
                            controller: _descriptionController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                hintText: "Descripción",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                            maxLines: 7,
                          ),
                        ),
                      ]),
                      const SizedBox(width: 20),
                      // Container(
                      //   margin: const EdgeInsets.only(right: 10),
                      //   width: 200,
                      //   height: 100,
                      //   child: images.isNotEmpty
                      //       ? CarouselSlider(
                      //           items: images.map(
                      //             (i) {
                      //               return Builder(
                      //                 builder: (BuildContext context) =>
                      //                     Image.file(
                      //                   i,
                      //                   fit: BoxFit.cover,
                      //                   height: 200,
                      //                 ),
                      //               );
                      //             },
                      //           ).toList(),
                      //           options: CarouselOptions(
                      //             viewportFraction: 1,
                      //             height: 200,
                      //           ),
                      //         )
                      //       : GestureDetector(
                      //           onTap: selectImages,
                      //           child: DottedBorder(
                      //             borderType: BorderType.RRect,
                      //             radius: const Radius.circular(10),
                      //             dashPattern: const [10, 4],
                      //             strokeCap: StrokeCap.round,
                      //             child: Container(
                      //               width: double.infinity,
                      //               height: 150,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   const Icon(
                      //                     Icons.folder_open,
                      //                     size: 40,
                      //                   ),
                      //                   const SizedBox(height: 15),
                      //                   Text(
                      //                     'Select Tasks Images',
                      //                     style: TextStyle(
                      //                       fontSize: 15,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 800,
                    child: Row(
                      children: [
                        Expanded(
                          child: InputField(
                            title: "Start Date",
                            hint: DateFormat('dd/MM/yyyy').format(_startDate),
                            widget: IconButton(
                              icon: (const Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                              )),
                              onPressed: () {
                                _getDateFromUser(isStartTime: true);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: InputField(
                            title: "Start Time",
                            hint: _startTime,
                            widget: IconButton(
                              icon: (const Icon(
                                //FlutterIcons.clock_faw5,
                                Icons.lock_clock_rounded,
                                color: Colors.grey,
                              )),
                              onPressed: () {
                                _getTimeFromUser(isStartTime: true);
                                setState(() {});
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 800,
                    child: Row(
                      children: [
                        Expanded(
                          child: InputField(
                            title: "End Date",
                            hint: DateFormat('dd/MM/yyyy').format(_endDate),
                            widget: IconButton(
                              icon: (const Icon(
                                //FlutterIcons.calendar_ant,
                                Icons.calendar_month,
                                color: Colors.grey,
                              )),
                              onPressed: () {
                                _getDateFromUser(isStartTime: false);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: InputField(
                            title: "End Time",
                            hint: _endTime,
                            widget: IconButton(
                              icon: (const Icon(
                                //FlutterIcons.clock_faw5,
                                Icons.lock_clock_rounded,
                                color: Colors.grey,
                              )),
                              onPressed: () {
                                _getTimeFromUser(isStartTime: false);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Flex(direction: Axis.vertical, children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 500,
                      height: 80,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        //initialValue: widget.task.description,
                        //controller: _descriptionController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            hintText: "Comentarios",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        maxLines: 7,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 50),
                  Wrap(
                    children: [
                      MyButtonEditTask(
                          onTap: () {
                            updateTask();
                          },
                          label: "Edit Task"),
                      const SizedBox(
                        width: 20,
                      ),
                      MyButtonEditTask(
                          onTap:
                              // approvedTask;
                              sendPoints,
                          label: "Approved task"),
                    ],
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: QuillToolbar.basic(controller: _controller),
                        ),
                        Flex(direction: Axis.vertical, children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 236, 237),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[850]!.withOpacity(0.29),
                                    offset: const Offset(-10, 10),
                                    blurRadius: 10,
                                  )
                                ]),
                            child: QuillEditor.basic(
                              controller: _controller,
                              readOnly: false,
                              keyboardAppearance: Brightness.light,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),

                  // const SizedBox(height: 10),
                  // Container(
                  //   width: 150,
                  //   height: 40,
                  //   child: CustomButton(
                  //     text: 'add',
                  //     onTap: addTask,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: const [SizedBox(width: 250), BarPost()],
        )
      ]),
    );
  }

  // DateTime _now = new DateTime.now();

  // DateTime start = DateFormat('dd/MM/yyyy HH:mm aa')
  //     .parse('${task.date} ${task.startTime}');
  // DateTime end =
  //     DateFormat('dd/MM/yyyy HH:mm aa').parse('${task.date} ${task.endTime}');

  // tz.TZDateTime tzStart = tz.TZDateTime(
  //     tz.local, _now.year, _now.month, _now.day, start.hour, start.minute);

  // tz.TZDateTime tzEnd = tz.TZDateTime(
  //     tz.local, _now.year, _now.month, _now.day, end.hour, end.minute);

  // tz.TZDateTime tzNow = tz.TZDateTime(tz.local, _now.year, )

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  _getTimeFromUser({required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker(isStartTime: isStartTime);
    String _formatedTime = _pickedTime.format(context);
    if (isStartTime) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker({required bool isStartTime}) async {
    return showTimePicker(
      initialTime: TimeOfDay(
          hour: isStartTime ? _startDate.hour : _endDate.hour,
          minute: isStartTime ? _startDate.minute : _endDate.minute),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }

  _getDateFromUser({required bool isStartTime}) async {
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: isStartTime ? _startDate : _endDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (_pickedDate == null) return;

    if (isStartTime == true) {
      setState(() {
        _startDate = _pickedDate;
      });
    } else {
      setState(() {
        _endDate = _pickedDate;
      });
    }
  }
}
