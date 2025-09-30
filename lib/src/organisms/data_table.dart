import 'package:flutter/material.dart';

/// Organismo de tabla de datos
class Pragma4DataTable extends StatelessWidget {
  const Pragma4DataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.onSelectAll,
    this.sortColumnIndex,
    this.sortAscending = true,
  });

  final List<DataColumn> columns;
  final List<DataRow> rows;
  final ValueChanged<bool?>? onSelectAll;
  final int? sortColumnIndex;
  final bool sortAscending;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: columns,
        rows: rows,
        onSelectAll: onSelectAll,
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
      ),
    );
  }
}
