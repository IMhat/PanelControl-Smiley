part of dashboard;

class DashboardController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  // Data
  _Profile getProfil() {
    return const _Profile(
      photo: AssetImage(ImageRasterPath.avatar1),
      name: "Uteam",
      email: "uteam@gmail.com",
    );
  }

  // getAllTask() {
  //   return getAllTaskK();
  // }
  //tasks

  // List<TaskCardData> getAllTask() {
  //   return [
  //     const TaskCardData(
  //       title: "Landing page Ux Design",
  //       dueDay: 2,
  //       totalComments: 50,
  //       type: TaskType.todo,
  //       totalContributors: 30,
  //       profilContributors: [
  //         AssetImage(ImageRasterPath.avatar1),
  //         AssetImage(ImageRasterPath.avatar2),
  //         AssetImage(ImageRasterPath.avatar3),
  //         AssetImage(ImageRasterPath.avatar4),
  //       ],
  //     ),
  //     const TaskCardData(
  //       title: "Landing page UI Design",
  //       dueDay: -1,
  //       totalComments: 50,
  //       totalContributors: 34,
  //       type: TaskType.inProgress,
  //       profilContributors: [
  //         AssetImage(ImageRasterPath.avatar5),
  //         AssetImage(ImageRasterPath.avatar6),
  //         AssetImage(ImageRasterPath.avatar7),
  //         AssetImage(ImageRasterPath.avatar8),
  //       ],
  //     ),
  //     const TaskCardData(
  //       title: "Landing page UI Design",
  //       dueDay: 1,
  //       totalComments: 50,
  //       totalContributors: 34,
  //       type: TaskType.done,
  //       profilContributors: [
  //         AssetImage(ImageRasterPath.avatar5),
  //         AssetImage(ImageRasterPath.avatar3),
  //         AssetImage(ImageRasterPath.avatar4),
  //         AssetImage(ImageRasterPath.avatar2),
  //       ],
  //     ),
  //   ];
  // }

  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      percent: .3,
      projectImage: const AssetImage(ImageRasterPath.logo1),
      projectName: "ADMIN",
      releaseTime: DateTime.now(),
    );
  }

  List<ProjectCardData> getActiveProject() {
    return [
      ProjectCardData(
        percent: .3,
        projectImage: const AssetImage(ImageRasterPath.logo2),
        projectName: "Marketing",
        releaseTime: DateTime.now().add(const Duration(days: 130)),
      ),
      ProjectCardData(
        percent: .5,
        projectImage: const AssetImage(ImageRasterPath.logo3),
        projectName: "Development",
        releaseTime: DateTime.now().add(const Duration(days: 140)),
      ),
      ProjectCardData(
        percent: .8,
        projectImage: const AssetImage(ImageRasterPath.logo4),
        projectName: "UX/UI",
        releaseTime: DateTime.now().add(const Duration(days: 100)),
      ),
    ];
  }

  List<ImageProvider> getMember() {
    return const [
      AssetImage(ImageRasterPath.avatar1),
      AssetImage(ImageRasterPath.avatar2),
      AssetImage(ImageRasterPath.avatar3),
      AssetImage(ImageRasterPath.avatar4),
      AssetImage(ImageRasterPath.avatar5),
      AssetImage(ImageRasterPath.avatar6),
    ];
  }

  List<ChattingCardData> getChatting() {
    return const [
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar6),
        isOnline: true,
        name: "Samantha",
        lastMessage: "i added my new tasks",
        isRead: false,
        totalUnread: 100,
      ),
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar3),
        isOnline: false,
        name: "John",
        lastMessage: "well done john",
        isRead: true,
        totalUnread: 0,
      ),
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar4),
        isOnline: true,
        name: "Alexander Purwoto",
        lastMessage: "we'll have a meeting at 9AM",
        isRead: false,
        totalUnread: 1,
      ),
    ];
  }
}

class getAllTask extends StatefulWidget {
  const getAllTask({Key? key}) : super(key: key);

  @override
  State<getAllTask> createState() => _getAllTask();
}

class _getAllTask extends State<getAllTask> {
  @override
  Widget build(BuildContext context) {
    final tasksService = Provider.of<TaskService>(context);
    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksService.selectedTask),
      child: _getAllTaskBody(tasksService: tasksService),
    );
  }
}

class _getAllTaskBody extends StatefulWidget {
  _getAllTaskBody({Key? key, required this.tasksService}) : super(key: key);

  TaskService tasksService;

  @override
  State<_getAllTaskBody> createState() => _getAllTaskBodyState();
}

class _getAllTaskBodyState extends State<_getAllTaskBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, right: 50),
                width: 200,
                height: 60,
                child: const Text(
                  "Task Overview",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 450,
                height: 120,
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: const [
                      Text(
                        "Elige tu categor??a",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                      TabBar(
                          indicator: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff5D4FB1)),
                          labelColor: Color.fromARGB(255, 255, 0, 0),
                          unselectedLabelColor:
                              Color.fromARGB(255, 255, 255, 255),
                          tabs: [
                            Tab(text: "All"),
                            Tab(text: "To do"),
                            Tab(text: "In progress"),
                            Tab(text: "Done"),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 40, bottom: 20),
            width: 400,
            height: 350,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //itemCount: taskListProvider.tasks.length,
                itemCount: widget.tasksService.tasks.length,

                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.tasksService.selectedTask =
                        widget.tasksService.tasks[index].copy();
                    // Navigator.of(context).pushNamed(TaskPutScreen.route);
                    Navigator.pushNamed(
                      context,
                      '/taskPut',
                    );
                  },
                  child: TaskCard(
                    task: widget.tasksService.tasks[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
