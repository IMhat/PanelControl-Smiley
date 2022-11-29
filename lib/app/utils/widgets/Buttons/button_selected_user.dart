import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/models/users.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_task_screen.dart';

import '../../../common/widgets/loader.dart';

import '../../services/admin_services.dart';

class ButtonSelectedUser extends StatelessWidget {
  const ButtonSelectedUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const _FilterDialog();
            });
        // Navigator.pushNamed(
        //   context,
        //   '',
        // );
      },
      // The custom button
      child: Container(
          margin: const EdgeInsets.only(right: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 226, 226),
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.add)),
    );
  }
}

class _FilterDialog extends StatelessWidget {
  const _FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _lista = ['To do', 'In progress', 'Done'];
    // String _vista = 'Seleccione un miembro';
    return AlertDialog(
      content: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          children: [
            const Text(
              "Agregar Miembros",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            const Divider(indent: 2, color: Colors.grey),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 87, 86, 86),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  icon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: Icon(
                    Icons.file_download_outlined,
                    size: 20.00,
                  ),
                ),
              ),
            ),
            const ProductPruebaScreen(),
          ],
        ),
      ),
    );
  }
}

class ProductPruebaScreen extends StatefulWidget {
  const ProductPruebaScreen({Key? key}) : super(key: key);

  @override
  State<ProductPruebaScreen> createState() => _ProductPruebaScreenState();
}

class _ProductPruebaScreenState extends State<ProductPruebaScreen> {
  List<Users>? users;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  fetchAllUsers() async {
    users = await adminServices.fetchAllUsers(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return users == null
        ? const Loader()
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 350,
                  height: 400,
                  child: ListView.builder(
                    itemCount: users!.length,
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final usersData = users![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AddTaskScreen.routeName,
                            arguments: usersData.email,
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    child: Text(usersData.name[0])),
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  width: 250,
                                  height: 60,
                                  child: Text(
                                    usersData.email,
                                    // overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                  ),
                                ),
                                const Divider(
                                  indent: 2,
                                  color: Colors.indigo,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}




// class _FilterDialog extends StatelessWidget {
//   const _FilterDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var _lista = ['To do', 'In progress', 'Done'];
//     String _vista = 'Seleccione un miembro';
//     return AlertDialog(
//       content: Container(
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width * .2,
//         height: MediaQuery.of(context).size.height * .6,
//         child: Column(
//           children: [
//             const Text(
//               "Filtrar",
//               style: TextStyle(color: Colors.black),
//               textAlign: TextAlign.start,
//             ),
//             const Divider(indent: 2, color: Colors.grey),
//             Container(
//               decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 87, 86, 86),
//                   borderRadius: BorderRadius.all(Radius.circular(8))),
//               child: const TextField(
//                 controller: null,
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 15),
//                   icon: Icon(Icons.search, color: Colors.black),
//                   suffixIcon: Icon(
//                     Icons.file_download_outlined,
//                     size: 20.00,
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               "Miembros",
//               style: TextStyle(color: Colors.black),
//               textAlign: TextAlign.start,
//             ),
//             Container(
//               child: DropdownButton(
//                 items: _lista.map((String a) {
//                   return DropdownMenuItem(
//                       value: a,
//                       child: Text(
//                         a,
//                         style: TextStyle(color: Colors.black),
//                       ));
//                 }).toList(),
//                 onChanged: (_value) => {
//                   setState(() {
//                     _vista = _value.toString();
//                   })
//                 },
//                 hint: Text(
//                   _vista,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   setState(Function() param0) {}
// }
