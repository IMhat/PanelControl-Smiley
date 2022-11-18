import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleOrder extends StatefulWidget {
  final String id;
  final String name;
  final String totalPrice;
  final String quantity;
  final String userId;
  final int status;

  const SingleOrder(
      {Key? key,
      required this.id,
      required this.name,
      required this.totalPrice,
      required this.quantity,
      required this.userId,
      required this.status})
      : super(key: key);

  @override
  State<SingleOrder> createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  final textStyleTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey);

  final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color.fromARGB(255, 213, 213, 213),
      padding: const EdgeInsets.only(top: 1),
      child: Container(
        width: currentWidth,
        height: 50,
        color: Colors.white,
        // decoration: BoxDecoration(
        //     color: Color.fromARGB(255, 186, 185, 186),
        //     borderRadius: const BorderRadius.all(Radius.circular(8)),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey[850]!.withOpacity(0.29),
        //         offset: const Offset(-10, 10),
        //         blurRadius: 10,
        //       )
        //     ]),
        padding: const EdgeInsets.all(10),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  widget.id,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '${widget.name}...',
                  style: textStyle,
                ),
              ],
            ),
            // Column(
            //   children: [
            //     Text(
            //       "Id",
            //       style: textStyleTitle,
            //     ),
            //     const SizedBox(height: 10),
            //     Text(
            //       userId,
            //       style: textStyle,
            //     ),
            //   ],
            // ),
            Column(
              children: [
                // Text("Points", style: textStyleTitle),
                // const SizedBox(height: 10),
                Text(
                  widget.totalPrice,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                // Text("Status", style: textStyleTitle),
                // const SizedBox(height: 10),
                Text(
                  widget.status.toString(),
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                // Text("User ID", style: textStyleTitle),
                // const SizedBox(height: 10),
                Text(
                  widget.userId,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                // Text("Amount", style: textStyleTitle),
                // const SizedBox(height: 10),
                Text(
                  widget.quantity,
                  style: textStyle,
                ),
              ],
            ),

            ButtonMenu(),
          ],
        ),
      ),
    );
  }
}

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({Key? key}) : super(key: key);

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
      child: const Icon(Icons.menu_open),
    );
  }
}

class _FilterDialog extends StatelessWidget {
  const _FilterDialog({Key? key}) : super(key: key);
  final decoration = const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)));

  @override
  Widget build(BuildContext context) {
    // var _lista = ['To do', 'In progress', 'Done'];
    // String _vista = 'Seleccione un miembro';
    return AlertDialog(
      content: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .1,
        height: MediaQuery.of(context).size.height * .3,
        child: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, CalendarScreen.routeName);
                  },
                  child: Container(
                    decoration: decoration,
                    width: 150,
                    height: 45,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.today,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Edit/Update",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )),
              const Divider(
                indent: 2,
                color: Colors.black,
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, CalendarScreen.routeName);
                  },
                  child: Container(
                    decoration: decoration,
                    width: 150,
                    height: 45,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.print,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Print",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )),
              const Divider(
                indent: 2,
                color: Colors.black,
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, CalendarScreen.routeName);
                  },
                  child: Container(
                    decoration: decoration,
                    width: 150,
                    height: 45,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.archive,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Archive",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )),
              const Divider(
                indent: 2,
                color: Colors.black,
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, CalendarScreen.routeName);
                  },
                  child: Container(
                    decoration: decoration,
                    width: 150,
                    height: 45,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Cancel",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
