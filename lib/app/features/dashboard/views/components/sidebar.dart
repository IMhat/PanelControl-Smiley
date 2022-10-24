// ignore_for_file: deprecated_member_use

part of dashboard;

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.2,
            0.4,
            0.8
          ],
              colors: [
            (Color(0xff7F00F0)),
            Color.fromARGB(255, 165, 92, 179),
            Color.fromARGB(255, 247, 90, 99)
          ])),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: ProjectCard(
                data: data,
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 50),
            // OutlinedButton.icon(
            //   icon: const Icon(Icons.add_reaction_sharp, color: Colors.black),
            //   label: const Text(
            //     "Add Member",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {
            //     // Navigate to the overview page using a named route.
            //     Navigator.of(context).pushNamed(TaskPostScreen.route);
            //   },
            //   style: OutlinedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(255, 0, 130, 153),
            //     elevation: 10,
            //   ),
            // ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              icon: const Icon(Icons.edit_note, color: Color(0xffA81BCC)),
              label: const Text("Tasks",
                  style: TextStyle(color: Color(0xffA81BCC))),
              onPressed: () {
                // Navigate to the overview page using a named route.
                Navigator.of(context).pushNamed(TasksScreen.routeName);
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  fixedSize: const Size(200, 50)),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              icon:
                  const Icon(Icons.add_shopping_cart, color: Color(0xffA81BCC)),
              label: const Text("Add Products",
                  style: TextStyle(color: Color(0xffA81BCC))),
              onPressed: () {
                // Navigate to the overview page using a named route.
                Navigator.of(context).pushNamed(TasksScreen.routeName);
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  fixedSize: const Size(200, 50)),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              icon: const Icon(Icons.today_rounded, color: Color(0xffA81BCC)),
              label: const Text("Calendar",
                  style: TextStyle(color: Color(0xffA81BCC))),
              onPressed: () {
                // Navigate to the overview page using a named route.
                Navigator.of(context).pushNamed(TasksScreen.routeName);
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  fixedSize: const Size(200, 50)),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              icon: const Icon(
                Icons.email_sharp,
                color: Color(0xffA81BCC),
              ),
              label: const Text("Email",
                  style: TextStyle(color: Color(0xffA81BCC))),
              onPressed: () {
                // Navigate to the overview page using a named route.
                Navigator.of(context).pushNamed(TasksScreen.routeName);
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  fixedSize: const Size(200, 50)),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              icon: const Icon(Icons.settings_accessibility,
                  color: Color(0xffA81BCC)),
              label: const Text("Profile",
                  style: TextStyle(color: Color(0xffA81BCC))),
              onPressed: () {
                // Navigate to the overview page using a named route.
                Navigator.of(context).pushNamed(TasksScreen.routeName);
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  fixedSize: const Size(200, 50)),
            ),
            const SizedBox(height: 10),
            // SelectionButton(
            //   data: [
            //     SelectionButtonData(
            //       activeIcon: EvaIcons.grid,
            //       icon: EvaIcons.gridOutline,
            //       label: "Dashboard",
            //     ),
            //     SelectionButtonData(
            //       activeIcon: EvaIcons.archive,
            //       icon: EvaIcons.archiveOutline,
            //       label: "taskPost",
            //       // onPressed: () {
            //       //   // Navigate to the overview page using a named route.
            //       //   Navigator.of(context).pushNamed(TaskPostScreen.route);
            //       // },
            //     ),

            //     SelectionButtonData(
            //       activeIcon: EvaIcons.archive,
            //       icon: EvaIcons.archiveOutline,
            //       label: "Add Products",
            //     ),
            //     // SelectionButtonData(
            //     //   activeIcon: EvaIcons.archive,
            //     //   icon: EvaIcons.archiveOutline,
            //     //   label: "Add Member",
            //     // ),
            //     SelectionButtonData(
            //       activeIcon: EvaIcons.calendar,
            //       icon: EvaIcons.calendarOutline,
            //       label: "Calendar",
            //     ),
            //     SelectionButtonData(
            //       activeIcon: EvaIcons.email,
            //       icon: EvaIcons.emailOutline,
            //       label: "Email",
            //       totalNotif: 20,
            //     ),
            //     SelectionButtonData(
            //       activeIcon: EvaIcons.person,
            //       icon: EvaIcons.personOutline,
            //       label: "Profil",
            //     ),
            //     SelectionButtonData(
            //       activeIcon: EvaIcons.settings,
            //       icon: EvaIcons.settingsOutline,
            //       label: "Setting",
            //     ),
            //   ],
            //   onSelected: (index, value) {
            //     log("index : $index | label : ${value.label}");
            //   },
            // ),
            // const Divider(thickness: 1),
            // const SizedBox(height: kSpacing * 2),
            // UpgradePremiumCard(
            //   backgroundColor: Theme.of(context).canvasColor.withOpacity(.4),
            //   onPressed: () {},
            // ),
            // const SizedBox(height: kSpacing),
          ],
        ),
      ),
    );
  }
}
