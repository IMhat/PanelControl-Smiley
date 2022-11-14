import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';
import 'package:project_management/app/features/dashboard/views/screens/search_screen.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';
import '../../../../utils/services/admin_services.dart';
import '../../../../utils/widgets/Buttons/button_selected_user.dart';
import '../../../../utils/widgets/bar_post_task.dart';
import '../../../../utils/widgets/sidebar/sidebar_task.dart';
import '../components/button_edit_task.dart';
import '../components/input_field.dart';

class TaskInprogressDetailsScreen extends StatefulWidget {
  static const String routeName = '/task-inprogress-details';

  final TaskInprogress task;

  const TaskInprogressDetailsScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskInprogressDetailsScreen> createState() =>
      _TaskInprogressDetailsScreenState();
}

class _TaskInprogressDetailsScreenState
    extends State<TaskInprogressDetailsScreen> {
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
            TaskInprogressDetails(task: widget.task),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: (constraints.maxWidth < 950) ? 6 : 9,
                child: TaskInprogressDetails(task: widget.task),
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
                child: TaskInprogressDetails(task: widget.task),
              ),
            ],
          );
        },
      )),
    );
  }
}

class TaskInprogressDetails extends StatefulWidget {
  static const String routeName = '/task-inprogress-details';

  final TaskInprogress task;

  const TaskInprogressDetails({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _TaskInprogressDetailsState createState() => _TaskInprogressDetailsState();
}

class _TaskInprogressDetailsState extends State<TaskInprogressDetails> {
  final AdminServices productDetailsServices = AdminServices();
  final AdminServices adminServices = AdminServices();
  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _assignmentUserController =
      TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

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

  @override
  void dispose() {
    super.dispose();
    _tituloController.dispose();

    _descriptionController.dispose();
    _assignmentUserController.dispose();
    _pointsController.dispose();
  }

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

  // void updateTask() {
  //   DateTime startDate = DateFormat('MM/dd/yyyy hh:mm a')
  //       .parse('${DateFormat.yMd().format(_startDate)} $_startTime');
  //   DateTime endDate = DateFormat('MM/dd/yyyy hh:mm a')
  //       .parse('${DateFormat.yMd().format(_endDate)} $_endTime');

  //   adminServices.update(
  //       context: context,
  //       title: _tituloController.text,
  //       priority: priority,
  //       description: _descriptionController.text,
  //       assignmentUser: _assignmentUserController.text,
  //       points: double.parse(_pointsController.text),
  //       category: category,
  //       //images: images,
  //       status: 'approved',
  //       createdBy: createdBy,
  //       label: label,
  //       startDate: startDate.toString(),
  //       endDate: endDate.toString(),
  //       id: widget.task.id.toString());
  // }

  void sendPoints() {
    adminServices.sendPoints(
        context: context,
        fromUsername: 'admin@gmail.com'.toString(),
        toUsername: widget.task.assignmentUser,
        //amount: double.parse(_pointsController.text),
        amount: widget.task.points,
        summary: 'Complete a daily task'.toString());

    adminServices.changeTaskInprogressStatus(
      context: context,
      status: 'approved',
      task: widget.task,
    );
  }

  // void acept() {
  //   productDetailsServices.accept(
  //     context: context,
  //     assignmentUser: widget.task.assignmentUser,
  //     category: widget.task.category,
  //     createdBy: widget.task.createdBy,
  //     description: widget.task.description,
  //     points: widget.task.points,
  //     priority: widget.task.priority,
  //     id: widget.task.id,
  //     title: widget.task.title,
  //     status: "inprogress",

  //     // Navigator.pushNamed(
  //     //   context,
  //     //   'ChallengeAcepted',
  //     // );
  //   );
  //   Navigator.pushNamed(
  //     context,
  //     'ChallengeAcepted',
  //   );
  // }

  // double avgRating = 0;
  // double myRating = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   double totalRating = 0;
  //   for (int i = 0; i < widget.product.rating!.length; i++) {
  //     totalRating += widget.product.rating![i].rating;
  //     if (widget.product.rating![i].userId ==
  //         Provider.of<UserProvider>(context, listen: false).user.id) {
  //       myRating = widget.product.rating![i].rating;
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  // }

  // void acept() {
  //   productDetailsServices.accept(
  //     context: context,
  //     assignmentUser: widget.task.assignmentUser,
  //     category: widget.task.category,
  //     createdBy: widget.task.createdBy,
  //     description: widget.task.description,
  //     points: widget.task.points,
  //     priority: widget.task.priority,
  //     id: widget.task.id,
  //     title: widget.task.title,
  //     status: "inprogress",

  //     // Navigator.pushNamed(
  //     //   context,
  //     //   'ChallengeAcepted',
  //     // );
  //   );
  //   Navigator.pushNamed(
  //     context,
  //     'ChallengeAcepted',
  //   );
  // }

  // double avgRating = 0;
  // double myRating = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   double totalRating = 0;
  //   for (int i = 0; i < widget.product.rating!.length; i++) {
  //     totalRating += widget.product.rating![i].rating;
  //     if (widget.product.rating![i].userId ==
  //         Provider.of<UserProvider>(context, listen: false).user.id) {
  //       myRating = widget.product.rating![i].rating;
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  // }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  // void addToCart() {
  //   productDetailsServices.addToCart(
  //     context: context,
  //     product: widget.product,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
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
                            initialValue: widget.task.title,
                            // controller: _tituloController,
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
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 239, 239, 239),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            initialValue: widget.task.assignmentUser,
                            //controller: _assignmentUserController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                hintText: "Colaborador",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20))),
                      ),
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
                      const ButtonSelectedUser(),
                      const SizedBox(
                        width: 20,
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
                                initialValue: widget.task.points.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                // controller: _pointsController,
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
                            initialValue: widget.task.description,
                            //controller: _descriptionController,
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
                      // MyButtonEditTask(
                      //     onTap: () {
                      //       updateTask;
                      //     },
                      //     label: "Edit Task"),
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
