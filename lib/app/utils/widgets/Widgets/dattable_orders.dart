import 'package:flutter/material.dart';

import 'package:project_management/app/features/dashboard/views/screens/calendar/colors_calendar.dart';

import '../../../common/widgets/loader.dart';
import '../../../features/dashboard/models/order.dart';

class Datatable2 extends StatefulWidget {
  final String id;
  final String name;
  final String totalPrice;
  final String quantity;
  final String userId;
  final int status;

  const Datatable2(
      {Key? key,
      required this.id,
      required this.name,
      required this.totalPrice,
      required this.quantity,
      required this.userId,
      required this.status})
      : super(key: key);

  @override
  State<Datatable2> createState() => _Datatable2State();
}

class _Datatable2State extends State<Datatable2> {
  final textStyleTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey);

  final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  // int numberOfPages = 10;

  // int currentPage = 0;
  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    // return DataTable(
    //   columns: const <DataColumn>[
    //     DataColumn(
    //       label: Expanded(
    //         child: Text(
    //           'Image',
    //           style: TextStyle(fontStyle: FontStyle.italic),
    //         ),
    //       ),
    //     ),
    //     DataColumn(
    //       label: Expanded(
    //         child: Text(
    //           'Name',
    //           style: TextStyle(fontStyle: FontStyle.italic),
    //         ),
    //       ),
    //     ),
    //     DataColumn(
    //       label: Expanded(
    //         child: Text(
    //           'Points',
    //           style: TextStyle(fontStyle: FontStyle.italic),
    //         ),
    //       ),
    //     ),
    //     DataColumn(
    //       label: Expanded(
    //         child: Text(
    //           'Acount',
    //           style: TextStyle(fontStyle: FontStyle.italic),
    //         ),
    //       ),
    //     ),
    //     DataColumn(
    //       label: Expanded(
    //         child: Text(
    //           'User ID',
    //           style: TextStyle(fontStyle: FontStyle.italic),
    //         ),
    //       ),
    //     ),
    //   ],
    //   rows: <DataRow>[
    //     DataRow(
    //       cells: <DataCell>[
    //         DataCell(Text(widget.id)),
    //         DataCell(Text(widget.name)),
    //         DataCell(Text(widget.totalPrice)),
    //         DataCell(Text(widget.quantity)),
    //         DataCell(Text(widget.userId)),
    //       ],
    //     ),
    //   ],
    // );

    // return Container(
    //   child: SafeArea(
    //       child: PaginatedDataTable(
    //     header: Text("Datatable"),
    //     columns: [
    //       DataColumn(label: Text("User ID")),
    //       DataColumn(label: Text("Status")),
    //       DataColumn(label: Text("Total Price")),
    //       DataColumn(label: Text("Amount")),
    //     ],
    //     source: dts,
    //     onRowsPerPageChanged: (r) {
    //       setState(() {
    //         _rowPerPage = r!;
    //       });
    //     },
    //     rowsPerPage: _rowPerPage,
    //   )),
    // );
    // var pages = List.generate(
    //     numberOfPages,
    //     (index) => Center(
    //           child: Text(
    //             "Page Numbers:${index + 1}",
    //             style: const TextStyle(color: Colors.black, fontSize: 20),
    //           ),
    //         ));
    // Column(
    //   children: [
    //     Expanded(
    //         child: Container(
    //       child: pages[currentPage],
    //     )),
    //     NumberPaginator(
    //       numberPages: numberOfPages,
    //       onPageChange: (index) {
    //         setState(() {
    //           currentPage = index;
    //         });
    //       },
    //     )
    //   ],
    // );
    return Container(
      height: 50,
      child: DataTable(
          columnSpacing: 12,
          horizontalMargin: 20,
          columns: const [
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: Text(''),
            ),
          ],
          rows: List<DataRow>.generate(
              1,
              (index) => DataRow(cells: [
                    DataCell(Text(widget.id)),
                    DataCell(Text(widget.name)),
                    DataCell(Text(widget.totalPrice)),
                    DataCell(Text(widget.quantity)),
                    DataCell(Text(((index)).toString()))
                  ]))),
    );
  }
}

class DTS extends DataTableSource {
  late final List<Order> _ordersData;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);

    if (index >= _ordersData.length) {
      return null;
    }
    final _order = _ordersData[index];
    print(_order);
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(_order.id)),
      DataCell(Text(_order.status.toString())),
      DataCell(Text(_order.totalPrice.toString())),
      DataCell(Text(_order.quantity.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 50;

  @override
  int get selectedRowCount => 0;
}
