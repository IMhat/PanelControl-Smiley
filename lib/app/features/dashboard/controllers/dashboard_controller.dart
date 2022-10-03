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

//BACKLOG TASK

class getBacklogTask extends StatefulWidget {
  const getBacklogTask({Key? key}) : super(key: key);

  @override
  State<getBacklogTask> createState() => _getBacklogTask();
}

class _getBacklogTask extends State<getBacklogTask> {
  @override
  Widget build(BuildContext context) {
    final tasksService = Provider.of<TaskService>(context);
    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksService.selectedTask),
      child: _getBacklogTaskBody(tasksService: tasksService),
    );
  }
}

class _getBacklogTaskBody extends StatefulWidget {
  _getBacklogTaskBody({Key? key, required this.tasksService}) : super(key: key);

  TaskService tasksService;

  @override
  State<_getBacklogTaskBody> createState() => _getBacklogTaskBodyState();
}

class _getBacklogTaskBodyState extends State<_getBacklogTaskBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 40, bottom: 20),
            width: 270,
            height: 700,
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
          OutlinedButton.icon(
            icon: const Icon(Icons.add, color: Colors.black),
            label: const Text(
              "Add New Task",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigate to the overview page using a named route.
              Navigator.of(context).pushNamed(TaskPostScreen.route);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 130, 153),
              elevation: 10,
            ),
          ),
        ],
      ),
    );
  }
}
