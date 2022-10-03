import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';
import '../../../../utils/services/transaction_services.dart';
import '../../models/transaction_model.dart';
import '../../providers/transaction_list_provider.dart';
import '../ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionPostScreen extends StatefulWidget {
  static const String route = '/transaction';

  const TransactionPostScreen({Key? key}) : super(key: key);

  @override
  State<TransactionPostScreen> createState() => _TransactionPostScreenState();
}

class _TransactionPostScreenState extends State<TransactionPostScreen> {
  final TextEditingController _fromUsernameController = TextEditingController();
  final TextEditingController _toUsernameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();

  late TransactionModel transactionModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final transactionServiceProvider =
        Provider.of<TransactionService>(context, listen: false);
    final scanListProvider =
        Provider.of<TransactionListProvider>(context, listen: false);
    // final taskForm = Provider.of<TaskFormProvider>(context);
    //final task = taskForm.task;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 500),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 800,
              height: 800,
              decoration: _buildBoxDecoration1(),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 1000,
                        height: 90,
                        decoration: _buildBoxDecoration1(),
                        child: Wrap(
                          alignment: WrapAlignment.spaceAround,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10),
                                width: 280,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 0, 21, 255)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    OutlinedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.check),
                                        label: const Text("Finalizada")),
                                    // OutlinedButton.icon(
                                    //     onPressed: () {},
                                    //     icon: const Icon(Icons.check),
                                    //     label: const Text("Changes")),
                                  ],
                                )),
                            Container(
                              width: 300,
                              height: 60,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.emoji_people,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.attach_file,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share_rounded,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.link_sharp,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.black,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text("Manager"),
                      // TextFormField(
                      //   controller: _fromUsernameController,
                      //   decoration: InputDecorations.authInputDecoration(
                      //       hintText: 'Manager',
                      //       labelText: 'fromUsername'),
                      //   validator: (String? dato) {
                      //     if (dato!.isEmpty) {
                      //       return 'Este campo es requerido';
                      //     }
                      //   },
                      // ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _toUsernameController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'toUsername', labelText: 'toUsername'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _amountController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'amount', labelText: 'amount'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _summaryController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'summary', labelText: 'summary'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //     controller: _userController,
                      //     decoration: InputDecorations.authInputDecoration(
                      //         hintText: 'Usuario Asignado',
                      //         labelText: 'Asignacion'),
                      //     validator: (String? dato) {
                      //       if (dato!.isEmpty) {
                      //         return 'Este campo es requerido';
                      //       }
                      //     }),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //     controller: _pointsController,
                      //     decoration: InputDecorations.authInputDecoration(
                      //         hintText: 'Puntos de la Tarea',
                      //         labelText: 'Puntos'),
                      //     validator: (String? dato) {
                      //       if (dato!.isEmpty) {
                      //         return 'Este campo es requerido';
                      //       }
                      //     }),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //     controller: _dueDayController,
                      //     decoration: InputDecorations.authInputDecoration(
                      //         hintText: 'Lapso de tiempo', labelText: 'Tiempo'),
                      //     validator: (String? dato) {
                      //       if (dato!.isEmpty) {
                      //         return 'Este campo es requerido';
                      //       }
                      //     }),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await TransactionService().saveTransactions(
                _fromUsernameController.text,
                _toUsernameController.text,
                _amountController.text,
                _summaryController.text,
              );
              final transactionListProvider =
                  Provider.of<TransactionListProvider>(context, listen: false);
              transactionListProvider.nuevaTransaction(
                _fromUsernameController.text,
                _toUsernameController.text,
                _amountController.text,
                _summaryController.text,
              );
            }
            transactionServiceProvider.transactions = [];
            transactionServiceProvider.loadTransactions();
            Navigator.of(context).pushNamed(DashboardScreen.route);
          }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Color.fromARGB(255, 224, 224, 226),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));

BoxDecoration _buildBoxDecoration1() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25)));

// BoxDecoration _buildBoxDecoration2() => const BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.only(
//         bottomRight: Radius.circular(25),
//         bottomLeft: Radius.circular(25),
//         topLeft: Radius.circular(25),
//         topRight: Radius.circular(25)));
