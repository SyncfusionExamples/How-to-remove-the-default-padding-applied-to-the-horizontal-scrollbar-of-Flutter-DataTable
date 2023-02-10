import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Grid()));
}

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = <Employee>[];

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(employees: _employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid')),
      body: MediaQuery(
        data: MediaQuery.of(context).removePadding(removeBottom: true),
        child: Column(
          children: [
            Expanded(
              child: SfDataGrid(
                source: _employeeDataSource,
                columns: columns,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<GridColumn> columns = [
    GridColumn(
        columnName: 'id',
        width: 150,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: const Text('ID'))),
    GridColumn(
        columnName: 'name',
        width: 150,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: const Text('Name'))),
    GridColumn(
        columnName: 'designation',
        width: 150,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: const Text('Designation'))),
    GridColumn(
        columnName: 'salary',
        width: 150,
        label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: const Text('Salary')))
  ];
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
              DataGridCell<String>(
                  columnName: 'designation', value: dataGridRow.designation),
              DataGridCell<int>(
                  columnName: 'salary', value: dataGridRow.salary),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

  final int id;
  final String name;
  final String designation;
  final int salary;
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'James', 'Project Lead', 20000),
    Employee(10002, 'Kathryn', 'Manager', 30000),
    Employee(10003, 'Lara', 'Developer', 55000),
    Employee(10004, 'Michael', 'Designer', 35000),
    Employee(10005, 'Roland Mendel', 'Developer', 45000),
    Employee(10006, 'Sven Ottlieb', 'Developer', 45000),
    Employee(10007, 'Balnc', 'Developer', 44000),
    Employee(10008, 'Perry', 'Developer', 43000),
    Employee(10009, 'Gable', 'Developer', 43000),
    Employee(10010, 'Grimes', 'Developer', 43000),
    Employee(10011, 'Maria Anders', 'Developer', 41000),
    Employee(10012, 'Thomas Hardy', 'Developer', 40000),
    Employee(10013, 'Hanna Moos', 'Developer', 40000),
    Employee(10014, 'Elizabeth', 'Developer', 39000),
    Employee(10015, 'Patricio Simpson', 'Developer', 39000)
  ];
}
