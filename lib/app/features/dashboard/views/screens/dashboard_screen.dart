// ignore_for_file: deprecated_member_use

library dashboard;

import 'package:project_management/app/features/dashboard/models/tasks.dart';
import 'package:project_management/app/features/dashboard/views/components/team_member.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_management/app/constans/app_constants.dart';

import 'package:project_management/app/features/dashboard/views/screens/tasks_screen.dart';
import 'package:project_management/app/shared_components/list_profil_image.dart';

import 'package:project_management/app/shared_components/progress_report_card.dart';
import 'package:project_management/app/shared_components/responsive_builder.dart';
import 'package:project_management/app/shared_components/project_card.dart';
import 'package:project_management/app/shared_components/search_field.dart';

import 'package:project_management/app/utils/helpers/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:project_management/app/utils/widgets/Widgets/Home/Profile.dart';
import 'package:project_management/app/utils/widgets/Widgets/Home/analytic_home.dart';
import 'package:project_management/app/utils/widgets/Widgets/Home/counter_tasks_backlog_home.dart';
import 'package:project_management/app/utils/widgets/Widgets/Home/counter_tasks_done.dart';
import 'package:project_management/app/utils/widgets/Widgets/Home/counter_tasks_inprogress.dart';
import 'package:project_management/app/utils/widgets/Widgets/Home/counter_tasks_todo.dart';
import 'package:project_management/app/utils/widgets/Widgets/products/team_member.dart';

import 'package:project_management/app/utils/widgets/sidebar_home_task.dart';
import 'package:project_management/app/utils/widgets/single_task.dart';


// binding
// part '../../bindings/dashboard_binding.dart';

// controller
// part '../../controllers/dashboard_controller.dart';

// models
part '../../models/profile.dart';

// component
part '../components/active_project_card.dart';
part '../components/header.dart';
part '../components/overview_header.dart';
part '../components/profile_tile.dart';
part '../components/recent_messages.dart';
part '../components/sidebar.dart';

class DashboardScreen extends GetView<StatefulWidget> {
  static const String routeName = '/dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
                child: SidebarHomeTask(),
              ),
            ),
      appBar: AppBar(backgroundColor: const Color(0xff48409E)),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: [
            const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            // _buildHeader(onPressedMenu: () => controller.openDrawer()),
            const SizedBox(height: kSpacing / 2),
            const Divider(),
            const Profile(),
            const SizedBox(height: kSpacing),
            _buildProgress(axis: Axis.vertical),
            const SizedBox(height: kSpacing),
            const TeamMember(),
            TeamMemberCard(totalMember: 8, onPressedAdd: (() {})),
            const SizedBox(height: kSpacing),
            Column(
              children: const [
                CounterTasksBacklog(),
                SizedBox(
                  height: 10,
                ),
                CounterTasksDone(),
                SizedBox(height: 10),
                CounterTasksInprogress(),
                SizedBox(height: 10),
                CounterTasksToDo(),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: kSpacing),
            //   child: GetPremiumCard(onPressed: () {}),
            // ),
            const SizedBox(height: kSpacing * 2),
            const AnalyticsHome(),
            // _buildTaskOverview(
            //   data: controller.getAllTask(),
            //   headerAxis: Axis.vertical,
            //   crossAxisCount: 6,
            //   crossAxisCellCount: 6,
            // ),
            // ListView.builder(
            //   itemCount: 1,
            //   itemBuilder: (BuildContext context, int index) {
            //     return ;
            //   },
            // ),
            //const getAllTask(),

            const SizedBox(height: kSpacing * 2),
            // _buildActiveProject(
            //   // data: controller.getActiveProject(),
            //   crossAxisCount: 6,
            //   crossAxisCellCount: 6,
            // ),
            const SizedBox(height: kSpacing),
            // RecentMessages(onPressedMore: (() {})),
            // _buildRecentMessages(data: controller.getChatting()),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: (constraints.maxWidth < 950) ? 6 : 9,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
                    // _buildHeader(onPressedMenu: () => controller.openDrawer()),
                    const SizedBox(height: kSpacing * 2),
                    _buildProgress(
                      axis: (constraints.maxWidth < 950)
                          ? Axis.vertical
                          : Axis.horizontal,
                    ),
                    const SizedBox(height: kSpacing * 2),
                    const AnalyticsHome(),
                    // _buildTaskOverview(
                    //   data: controller.getAllTask(),
                    //   headerAxis: (constraints.maxWidth < 850)
                    //       ? Axis.vertical
                    //       : Axis.horizontal,
                    //   crossAxisCount: 6,
                    //   crossAxisCellCount: (constraints.maxWidth < 950)
                    //       ? 6
                    //       : (constraints.maxWidth < 1100)
                    //           ? 3
                    //           : 2,
                    // ),
                    //const getAllTask(),
                    const SizedBox(height: kSpacing * 2),
                    // _buildActiveProject(
                    //   data: controller.getActiveProject(),
                    //   crossAxisCount: 6,
                    //   crossAxisCellCount: (constraints.maxWidth < 950)
                    //       ? 6
                    //       : (constraints.maxWidth < 1100)
                    //           ? 3
                    //           : 2,
                    // ),
                    // const SizedBox(height: kSpacing),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing * (kIsWeb ? 0.5 : 1.5)),
                    const Profile(),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),

                    const TeamMember(),
                    TeamMemberCard(totalMember: 8, onPressedAdd: (() {})),
                    const SizedBox(height: kSpacing),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: kSpacing),
                      //child: GetPremiumCard(onPressed: () {}),
                    ),
                    const SizedBox(height: kSpacing),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),
                    // RecentMessages(onPressedMore: (() {})),
                    // _buildRecentMessages(data: controller.getChatting()),
                  ],
                ),
              )
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
                    child: SidebarHomeTask()),
              ),
              Flexible(
                flex: 9,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing),
                    _buildHeader(),

                    const SizedBox(height: kSpacing * 2),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: const [
                        CounterTasksBacklog(),
                        SizedBox(
                          width: 20,
                        ),
                        CounterTasksDone(),
                        SizedBox(width: 20),
                        CounterTasksInprogress(),
                        SizedBox(width: 20),
                        CounterTasksToDo(),
                      ],
                    ),

                    //_buildProgress(),

                    const SizedBox(height: kSpacing * 2),
                    const AnalyticsHome(),
                    // Container(
                    //   width: 900,
                    //   decoration: BoxDecoration(
                    //     gradient: const LinearGradient(
                    //         // begin: AlignmentDirectional.,
                    //         // end: Alignment.bottomCenter,
                    //         // stops: [
                    //         //   0.2,
                    //         //   0.4,
                    //         //   0.8
                    //         // ],
                    //         colors: [
                    //           (Color(0xffC5CAE9)),
                    //           Color(0xff9FA8DA),
                    //           Color(0xff7986CB)
                    //         ]),
                    //     borderRadius: BorderRadius.circular(30.0),
                    //   ),
                    //   child: CalendarWidget(),
                    // ),
                    // _buildTaskOverview(
                    //   data: controller.getAllTask(),
                    //   crossAxisCount: 6,
                    //   crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
                    // ),
                    //const getAllTask(),
                    const SizedBox(height: kSpacing * 2),
                    // _buildActiveProject(
                    //   data: controller.getActiveProject(),
                    //   crossAxisCount: 6,
                    //   crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
                    // ),
                    const SizedBox(height: kSpacing),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing / 2),
                    const Profile(),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),
                    const TeamMember(),
                    TeamMemberCard(totalMember: 8, onPressedAdd: (() {})),
                    const SizedBox(height: kSpacing),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: kSpacing),
                      //child: GetPremiumCard(onPressed: () {}),
                    ),
                    const SizedBox(height: kSpacing),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),
                    _buildProgress(),
                    //RecentMessages(onPressedMore: (() {})),
                    // _buildRecentMessages(data: controller.getChatting()),
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }

  Widget _buildHeader({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          if (onPressedMenu != null)
            Padding(
              padding: const EdgeInsets.only(right: kSpacing),
              child: IconButton(
                onPressed: onPressedMenu,
                icon: const Icon(EvaIcons.menu),
                tooltip: "menu",
              ),
            ),
          const Expanded(child: _Header()),
        ],
      ),
    );
  }

  Widget _buildProgress({Axis axis = Axis.horizontal}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: (axis == Axis.horizontal)
          ? Row(
              children: const [
                // Flexible(
                //   flex: 5,
                //   child:
                //    ProgressCard(
                //     data: const ProgressCardData(
                //       totalUndone: 10,
                //       totalTaskInProress: 2,
                //     ),
                //     onPressedCheck: () {},
                //   ),
                // ),
                SizedBox(width: kSpacing / 2),
                Flexible(
                  flex: 4,
                  child: ProgressReportCard(
                    data: ProgressReportCardData(
                      title: "1st Sprint",
                      doneTask: 15,
                      percent: .2,
                      task: 10,
                      undoneTask: 2,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: const [
                // ProgressCard(
                //   data: const ProgressCardData(
                //     totalUndone: 10,
                //     totalTaskInProress: 2,
                //   ),
                //   onPressedCheck: () {},
                // ),
                SizedBox(height: kSpacing / 2),
                ProgressReportCard(
                  data: ProgressReportCardData(
                    title: "1st Sprint",
                    doneTask: 20,
                    percent: .5,
                    task: 10,
                    undoneTask: 2,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTaskOverview({
    required List<Task> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
    Axis headerAxis = Axis.horizontal,
  }) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: crossAxisCount,
      itemCount: data.length + 1,
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return (index == 0)
            ? Padding(
                padding: const EdgeInsets.only(bottom: kSpacing),
                child: _OverviewHeader(
                  axis: headerAxis,
                  onSelected: (task) {},
                ),
              )
            // ignore: prefer_const_constructors
            : SingleTask(
                task: data[index],
                // onPressedMore: () {},
                // onPressedTask: () {},
                // onPressedContributors: () {},
                // onPressedComments: () {},
              );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit((index == 0) ? crossAxisCount : crossAxisCellCount),
    );
  }

  Widget _buildActiveProject({
    required List<ProjectCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: _ActiveProjectCard(
        onPressedSeeAll: () {},
        child: StaggeredGridView.countBuilder(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          itemCount: data.length,
          addAutomaticKeepAlives: false,
          mainAxisSpacing: kSpacing,
          crossAxisSpacing: kSpacing,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProjectCard(data: data[index]);
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.fit(crossAxisCellCount),
        ),
      ),
    );
  }

  Widget _buildProfile({required _Profile data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: _ProfilTile(
        data: data,
        onPressedNotification: () {},
      ),
    );
  }

  Widget _buildTeamMember({required List<ImageProvider> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _TeamMember(
          //   totalMember: data.length,
          //   onPressedAdd: () {},
          // ),
          const SizedBox(height: kSpacing / 2),
          ListProfilImage(maxImages: 6, images: data),
        ],
      ),
    );
  }

  // Widget _buildRecentMessages({required List<ChattingCardData> data}) {
  //   return Column(children: [
  //     Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: kSpacing),
  //       child: _RecentMessages(onPressedMore: () {}),
  //     ),
  //     const SizedBox(height: kSpacing / 2),
  //     ...data
  //         .map(
  //           (e) => ChattingCard(data: e, onPressed: () {}),
  //         )
  //         .toList(),
  //   ]);
  // }
}
