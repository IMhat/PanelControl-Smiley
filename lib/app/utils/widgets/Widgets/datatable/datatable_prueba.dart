// import 'dart:math';

// import 'package:intl/intl.dart';
// import 'package:responsive_table/responsive_table.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// import '../../../../common/widgets/loader.dart';
// import '../../../../features/dashboard/models/order.dart';
// import '../../../services/admin_services.dart';

// class OrdersScreen extends StatefulWidget {
//   static const String routeName = '/getOrders';

//   OrdersScreen({
//     Key,
//   }) : super();
//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //             appBar: AppBar(
// //               title: const Text("TableData"),
// //               centerTitle: true,
// //             ),
// //             body: Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 40.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// //                 children: [
// //                   const Center(
// //                       child: Text(
// //                     "Product Table",
// //                     style:
// //                         TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
// //                   )),
// //                   const SizedBox(
// //                     height: 20.0,
// //                   ),
// //                   DataTable(columns: const [
// //                     DataColumn(
// //                       label: Text(
// //                         "Id",
// //                         style: TextStyle(
// //                             fontSize: 14.0, fontWeight: FontWeight.w900),
// //                       ),
// //                     ),
// //                     DataColumn(
// //                       label: Text(
// //                         "name",
// //                         style: TextStyle(
// //                             fontSize: 14.0, fontWeight: FontWeight.w900),
// //                       ),
// //                     ),
// //                     DataColumn(
// //                       label: Text(
// //                         "Price",
// //                         style: TextStyle(
// //                             fontSize: 14.0, fontWeight: FontWeight.w900),
// //                       ),
// //                     ),
// //                   ], rows: [
// //                     DataRow(cells: [
// //                       DataCell(Text()),
// //                       DataCell(Text("Item 1")),
// //                       DataCell(Text("Rs.390")),
// //                     ]),
// //                     DataRow(cells: [
// //                       DataCell(Text("02")),
// //                       DataCell(Text("Item 2")),
// //                       DataCell(Text("Rs.420")),
// //                     ]),
// //                     DataRow(cells: [
// //                       DataCell(Text("03")),
// //                       DataCell(Text("Item 3")),
// //                       DataCell(Text("Rs.100")),
// //                     ]),
// //                     DataRow(cells: [
// //                       DataCell(Text("04")),
// //                       DataCell(Text("Iten 4")),
// //                       DataCell(Text("Rs.350")),
// //                     ]),
// //                     DataRow(cells: [
// //                       DataCell(Text("05")),
// //                       DataCell(Text("Item 5")),
// //                       DataCell(Text("Rs.670")),
// //                     ]),
// //                     DataRow(cells: [
// //                       DataCell(Text("06")),
// //                       DataCell(Text("Item 6")),
// //                       DataCell(Text("Rs.530")),
// //                     ]),
// //                     DataRow(cells: [
// //                       DataCell(Text("07")),
// //                       DataCell(Text("Item 7")),
// //                       DataCell(Text("Rs.720")),
// //                     ]),
// //                   ])
// //                 ],
// //               ),
// //             ),
// //           );
// //   }
// // }

//   //List<Order>? orders;
//   final AdminServices adminServices = AdminServices();

//   late List<DatatableHeader> _headers;

//   List<int> _perPages = [10, 20, 50, 100];
//   int _total = 100;
//   int? _currentPerPage = 10;
//   List<bool>? _expanded;
//   String? _searchKey = "id";

//   int _currentPage = 1;
//   bool _isSearch = false;
//   List<Map<String, dynamic>> _sourceOriginal = [];
//   List<Map<String, dynamic>> _sourceFiltered = [];
//   List<Map<String, dynamic>> _source = [];
//   List<Map<String, dynamic>> _selecteds = [];
//   // ignore: unused_field
//   String _selectableKey = "id";

//   String? _sortColumn;
//   bool _sortAscending = true;
//   bool _isLoading = true;
//   bool _showSelect = true;
//   var random = new Random();

//   List<Map<String, dynamic>> _generateData({int n: 100}) {
//     final List source = List.filled(n, Random.secure());
//     List<Map<String, dynamic>> temps = [];
//     var i = 1;
//     print('ESTE ES EL NUMERO ${i}');

//     // ignore: unused_local_variable
//     for (var data in source) {
//       temps.add({
//         "id": i,
//         "sku": "$i\000$i",
//         "name": "Product $i",
//         "category": "Category-$i",
//         "price": i * 10.00,
//         "cost": "20.00",
//         "margin": "${i}0.20",
//         "in_stock": "${i}0",
//         "alert": "5",
//         "received": [i + 20, 150]
//       });
//       i++;
//     }
//     return temps;
//   }

//   _initializeData() async {
//     _mockPullData();
//   }

//   _mockPullData() async {
//     _expanded = List.generate(_currentPerPage!, (index) => false);

//     setState(() => _isLoading = true);
//     Future.delayed(Duration(seconds: 3)).then((value) {
//       _sourceOriginal.clear();
//       _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
//       _sourceFiltered = _sourceOriginal;
//       _total = _sourceFiltered.length;
//       _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
//       setState(() => _isLoading = false);
//     });
//   }

//   _resetData({start: 0}) async {
//     setState(() => _isLoading = true);
//     var _expandedLen =
//         _total - start < _currentPerPage! ? _total - start : _currentPerPage;
//     Future.delayed(Duration(seconds: 0)).then((value) {
//       _expanded = List.generate(_expandedLen as int, (index) => false);
//       _source.clear();
//       _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
//       setState(() => _isLoading = false);
//     });
//   }

//   _filterData(value) {
//     setState(() => _isLoading = true);

//     try {
//       if (value == "" || value == null) {
//         _sourceFiltered = _sourceOriginal;
//       } else {
//         _sourceFiltered = _sourceOriginal
//             .where((data) => data[_searchKey!]
//                 .toString()
//                 .toLowerCase()
//                 .contains(value.toString().toLowerCase()))
//             .toList();
//       }

//       _total = _sourceFiltered.length;
//       var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
//       _expanded = List.generate(_rangeTop, (index) => false);
//       _source = _sourceFiltered.getRange(0, _rangeTop).toList();
//     } catch (e) {
//       print(e);
//     }
//     setState(() => _isLoading = false);
//   }

//   @override
//   void initState() {
//     super.initState();

//     /// set headers
//     _headers = [
//       DatatableHeader(
//           text: "ID",
//           value: "id",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Name",
//           value: "name",
//           show: true,
//           flex: 2,
//           sortable: true,
//           editable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "SKU",
//           value: "sku",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.center),
//       DatatableHeader(
//           text: "Category",
//           value: "category",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Price",
//           value: "price",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Margin",
//           value: "margin",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "In Stock",
//           value: "in_stock",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Alert",
//           value: "alert",
//           show: true,
//           sortable: true,
//           textAlign: TextAlign.left),
//       DatatableHeader(
//           text: "Received",
//           value: "received",
//           show: true,
//           sortable: false,
//           sourceBuilder: (value, row) {
//             List list = List.from(value);
//             return Container(
//               child: Column(
//                 children: [
//                   Container(
//                     width: 85,
//                     child: LinearProgressIndicator(
//                       value: list.first / list.last,
//                     ),
//                   ),
//                   Text("${list.first} of ${list.last}")
//                 ],
//               ),
//             );
//           },
//           textAlign: TextAlign.center),
//     ];

//     _initializeData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("RESPONSIVE DATA TABLE"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("home"),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.storage),
//               title: Text("data"),
//               onTap: () {},
//             )
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//             Container(
//               margin: EdgeInsets.all(10),
//               padding: EdgeInsets.all(0),
//               constraints: BoxConstraints(
//                 maxHeight: 700,
//               ),
//               child: Card(
//                 elevation: 1,
//                 shadowColor: Colors.black,
//                 clipBehavior: Clip.none,
//                 child: ResponsiveDatatable(
//                   title: TextButton.icon(
//                     onPressed: () => {},
//                     icon: Icon(Icons.add),
//                     label: Text("new item"),
//                   ),
//                   reponseScreenSizes: [ScreenSize.xs],
//                   actions: [
//                     if (_isSearch)
//                       Expanded(
//                           child: TextField(
//                         decoration: InputDecoration(
//                             hintText: 'Enter search term based on ' +
//                                 _searchKey!
//                                     .replaceAll(new RegExp('[\\W_]+'), ' ')
//                                     .toUpperCase(),
//                             prefixIcon: IconButton(
//                                 icon: Icon(Icons.cancel),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isSearch = false;
//                                   });
//                                   _initializeData();
//                                 }),
//                             suffixIcon: IconButton(
//                                 icon: Icon(Icons.search), onPressed: () {})),
//                         onSubmitted: (value) {
//                           _filterData(value);
//                         },
//                       )),
//                     if (!_isSearch)
//                       IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {
//                             setState(() {
//                               _isSearch = true;
//                             });
//                           })
//                   ],
//                   headers: _headers,
//                   source: _source,
//                   selecteds: _selecteds,
//                   showSelect: _showSelect,
//                   autoHeight: false,
//                   dropContainer: (data) {
//                     if (int.tryParse(data['id'].toString())!.isEven) {
//                       return Text("is Even");
//                     }
//                     return _DropDownContainer(data: data);
//                   },
//                   onChangedRow: (value, header) {
//                     /// print(value);
//                     /// print(header);
//                   },
//                   onSubmittedRow: (value, header) {
//                     /// print(value);
//                     /// print(header);
//                   },
//                   onTabRow: (data) {
//                     print(data);
//                   },
//                   onSort: (value) {
//                     setState(() => _isLoading = true);

//                     setState(() {
//                       _sortColumn = value;
//                       _sortAscending = !_sortAscending;
//                       if (_sortAscending) {
//                         _sourceFiltered.sort((a, b) =>
//                             b["$_sortColumn"].compareTo(a["$_sortColumn"]));
//                       } else {
//                         _sourceFiltered.sort((a, b) =>
//                             a["$_sortColumn"].compareTo(b["$_sortColumn"]));
//                       }
//                       var _rangeTop = _currentPerPage! < _sourceFiltered.length
//                           ? _currentPerPage!
//                           : _sourceFiltered.length;
//                       _source = _sourceFiltered.getRange(0, _rangeTop).toList();
//                       _searchKey = value;

//                       _isLoading = false;
//                     });
//                   },
//                   expanded: _expanded,
//                   sortAscending: _sortAscending,
//                   sortColumn: _sortColumn,
//                   isLoading: _isLoading,
//                   onSelect: (value, item) {
//                     print("$value  $item ");
//                     if (value!) {
//                       setState(() => _selecteds.add(item));
//                     } else {
//                       setState(
//                           () => _selecteds.removeAt(_selecteds.indexOf(item)));
//                     }
//                   },
//                   onSelectAll: (value) {
//                     if (value!) {
//                       setState(() => _selecteds =
//                           _source.map((entry) => entry).toList().cast());
//                     } else {
//                       setState(() => _selecteds.clear());
//                     }
//                   },
//                   footers: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child: Text("Rows per page:"),
//                     ),
//                     if (_perPages.isNotEmpty)
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         child: DropdownButton<int>(
//                           value: _currentPerPage,
//                           items: _perPages
//                               .map((e) => DropdownMenuItem<int>(
//                                     child: Text("$e"),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: (dynamic value) {
//                             setState(() {
//                               _currentPerPage = value;
//                               _currentPage = 1;
//                               _resetData();
//                             });
//                           },
//                           isExpanded: false,
//                         ),
//                       ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child:
//                           Text("$_currentPage - $_currentPerPage of $_total"),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         size: 16,
//                       ),
//                       onPressed: _currentPage == 1
//                           ? null
//                           : () {
//                               var _nextSet = _currentPage - _currentPerPage!;
//                               setState(() {
//                                 _currentPage = _nextSet > 1 ? _nextSet : 1;
//                                 _resetData(start: _currentPage - 1);
//                               });
//                             },
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.arrow_forward_ios, size: 16),
//                       onPressed: _currentPage + _currentPerPage! - 1 > _total
//                           ? null
//                           : () {
//                               var _nextSet = _currentPage + _currentPerPage!;

//                               setState(() {
//                                 _currentPage = _nextSet < _total
//                                     ? _nextSet
//                                     : _total - _currentPerPage!;
//                                 _resetData(start: _nextSet - 1);
//                               });
//                             },
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ])),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _initializeData,
//         child: Icon(Icons.refresh_sharp),
//       ),
//     );
//   }
// }

// class _DropDownContainer extends StatelessWidget {
//   final Map<String, dynamic> data;
//   const _DropDownContainer({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _children = data.entries.map<Widget>((entry) {
//       Widget w = Row(
//         children: [
//           Text(entry.key.toString()),
//           Spacer(),
//           Text(entry.value.toString()),
//         ],
//       );
//       return w;
//     }).toList();

//     return Container(
//       /// height: 100,
//       child: Column(
//         /// children: [
//         ///   Expanded(
//         ///       child: Container(
//         ///     color: Colors.red,
//         ///     height: 50,
//         ///   )),

//         /// ],
//         children: _children,
//       ),
//     );
//   }
// }






//   var dts = DTS();
//   int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
//   @override
//   Widget build(BuildContext context) {
//     // return DataTable(
//     //   columns: const <DataColumn>[
//     //     DataColumn(
//     //       label: Expanded(
//     //         child: Text(
//     //           'Image',
//     //           style: TextStyle(fontStyle: FontStyle.italic),
//     //         ),
//     //       ),
//     //     ),
//     //     DataColumn(
//     //       label: Expanded(
//     //         child: Text(
//     //           'Name',
//     //           style: TextStyle(fontStyle: FontStyle.italic),
//     //         ),
//     //       ),
//     //     ),
//     //     DataColumn(
//     //       label: Expanded(
//     //         child: Text(
//     //           'Points',
//     //           style: TextStyle(fontStyle: FontStyle.italic),
//     //         ),
//     //       ),
//     //     ),
//     //     DataColumn(
//     //       label: Expanded(
//     //         child: Text(
//     //           'Acount',
//     //           style: TextStyle(fontStyle: FontStyle.italic),
//     //         ),
//     //       ),
//     //     ),
//     //     DataColumn(
//     //       label: Expanded(
//     //         child: Text(
//     //           'User ID',
//     //           style: TextStyle(fontStyle: FontStyle.italic),
//     //         ),
//     //       ),
//     //     ),
//     //   ],
//     //   rows: <DataRow>[
//     //     DataRow(
//     //       cells: <DataCell>[
//     //         DataCell(Container(
//     //           width: 40,
//     //           height: 40,
//     //           child: Image.network(widget.image),
//     //         )),
//     //         DataCell(Text(widget.name)),
//     //         DataCell(Text(widget.totalPrice)),
//     //         DataCell(Text(widget.quantity)),
//     //         DataCell(Text(widget.userId)),
//     //       ],
//     //     ),
//     //   ],
//     // );
//     return Container(
//       color: Colors.black,
//       child: SafeArea(
//           child: PaginatedDataTable(
//         header: Text("Datatable"),
//         columns: [
//           DataColumn(label: Text("User ID")),
//           DataColumn(label: Text("Status")),
//           DataColumn(label: Text("Total Price")),
//           DataColumn(label: Text("Amount")),
//         ],
//         source: dts,
//         onRowsPerPageChanged: (r) {
//           setState(() {
//             _rowPerPage = r!;
//           });
//         },
//         rowsPerPage: _rowPerPage,
//       )),
//     );
//     // var pages = List.generate(
//     //     numberOfPages,
//     //     (index) => Center(
//     //           child: Text(
//     //             "Page Numbers:${index + 1}",
//     //             style: const TextStyle(color: Colors.black, fontSize: 20),
//     //           ),
//     //         ));
//     // Column(
//     //   children: [
//     //     Expanded(
//     //         child: Container(
//     //       child: pages[currentPage],
//     //     )),
//     //     NumberPaginator(
//     //       numberPages: numberOfPages,
//     //       onPageChange: (index) {
//     //         setState(() {
//     //           currentPage = index;
//     //         });
//     //       },
//     //     )
//     //   ],
//     // );
//     // return Padding(
//     //   padding: const EdgeInsets.all(16),
//     //   child: DataTable(
//     //       columnSpacing: 12,
//     //       horizontalMargin: 12,
//     //       columns: const [
//     //         DataColumn(
//     //           label: Text('Orders'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Products'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Points'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Amount'),
//     //         ),
//     //         DataColumn(
//     //           label: Text('Position'),
//     //         ),
//     //       ],
//     //       rows: List<DataRow>.generate(
//     //           100,
//     //           (index) => DataRow(cells: [
//     //                 DataCell(
//     //                   Container(
//     //                     height: 40,
//     //                     width: 40,
//     //                     child: Image.network(
//     //                       widget.image,
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 DataCell(Text(widget.name)),
//     //                 DataCell(Text(widget.totalPrice)),
//     //                 DataCell(Text(widget.quantity)),
//     //                 DataCell(Text(((index)).toString()))
//     //               ]))),
//     // );
//   }
// }

// class DTS extends DataTableSource {
//   @override
//   DataRow getRow(int index) {
//     print("hola");
//     return DataRow.byIndex(
//       index: index, // DONT MISS THIS
//       cells: <DataCell>[
//         DataCell(Text("_order.id")),
//         DataCell(Text(
//           "_order.products.toString()",
//         )),
//         DataCell(Text("_order.quantity.toString()")),
//         DataCell(Text("_order.status.toString()")),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => 100;

//   @override
//   int get selectedRowCount => 0;
// }