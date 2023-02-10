# How-to-remove-the-default-padding-applied-to-the-horizontal-scrollbar-of-Flutter-DataTable

When the DataGrid is wrapped in a [Column](https://api.flutter.dev/flutter/widgets/Column-class.html) widget, the bottom padding creates a space between the DataGrid and the horizontal scrollbar. This can cause the scrollbar to overlap the DataGrid rows, making it difficult for the user to interact with the data. The following image demonstrates the issue.

In this article, learn how to remove the horizontal scrollbar padding in the [Flutter DataGrid](https://www.syncfusion.com/flutter-widgets/flutter-datagrid) when loading the DataGrid as a child of the Column widget.

The framework-suggested solution in this [query](https://github.com/flutter/flutter/issues/100058#issuecomment-1068752572) involves utilizing the [MediaQuery](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html) widget to remove the bottom padding and prevent the overlap between the DataGrid and the horizontal scrollbar.

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required properties. Add the DataGrid as a child of the `Column` widget and wrap the `Column` widget in a [MediaQuery](https://api.flutter.dev/flutter/widgets/MediaQuery/MediaQuery.html) widget. Set the `removeBottom` property to `true` in the [MediaQuery.removePadding](https://api.flutter.dev/flutter/widgets/MediaQueryData/removePadding.html) method and assign it to the [MediaQuery.data](https://api.flutter.dev/flutter/widgets/MediaQueryData-class.html) property.

```dart
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

```