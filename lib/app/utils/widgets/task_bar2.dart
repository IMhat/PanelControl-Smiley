import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TaskBar2 extends StatelessWidget {
  final textButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );
  final textStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  TaskBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      width: 1450,
      height: 80,
      decoration: _buildBoxDecoration1(),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(children: [
                  Text(
                    "Hello",
                    style: textStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Uteam",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ]),
                const Text(
                  "Tenes 2 tareas finalizadas",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const Text("Puntos por entregar: 20",
                style: TextStyle(fontSize: 10)),
          ),
          // Container(
          //   width: 100,
          //   height: 70,
          //   margin: EdgeInsets.only(left: 800),
          //   child: Image.asset("assets/images/raster/logo-1.png"),
          // )
        ],
      ),
    );
  }
}

class MyButtonFilter extends StatefulWidget {
  const MyButtonFilter();

  @override
  State<MyButtonFilter> createState() => _MyButtonFilterState();
}

class _MyButtonFilterState extends State<MyButtonFilter> {
  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
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
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: AlignmentDirectional.topEnd,
              colors: [
                Color.fromARGB(255, 242, 133, 157),
                Color.fromARGB(255, 167, 79, 211)
              ]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Filter',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _FilterDialog extends StatelessWidget {
  const _FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _lista = ['To do', 'In progress', 'Done'];
    String _vista = 'Seleccione un miembro';
    return AlertDialog(
      content: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          children: [
            const Text(
              "Filtrar",
              style: const TextStyle(color: Colors.black),
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
                  hintText: "Search tasks",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  icon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: Icon(
                    Icons.file_download_outlined,
                    size: 20.00,
                  ),
                ),
              ),
            ),
            const Text(
              "Miembros",
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Container(
              child: DropdownButton(
                items: _lista.map((String a) {
                  return DropdownMenuItem(
                      value: a,
                      child: Text(
                        a,
                        style: const TextStyle(color: Colors.black),
                      ));
                }).toList(),
                onChanged: (_value) => {
                  setState(() {
                    _vista = _value.toString();
                  })
                },
                hint: Text(
                  _vista,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setState(Function() param0) {}
}

BoxDecoration _buildBoxDecoration1() => const BoxDecoration(
    color: Color(0xff48409E),
    gradient: LinearGradient(colors: <Color>[
      (Color(0xff48409E)),
      (Color(0xff4332F7)),
    ]),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15)));
