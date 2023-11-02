import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Print App Directory'),
        ),
        body: AppDirectoryPrinter(),
      ),
    );
  }
}

class AppDirectoryPrinter extends StatefulWidget {
  @override
  _AppDirectoryPrinterState createState() => _AppDirectoryPrinterState();
}

class _AppDirectoryPrinterState extends State<AppDirectoryPrinter> {
  String appDirectory = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              final directory = await getApplicationDocumentsDirectory();
              setState(() {
                appDirectory = directory.path;
              });
            },
            child: Text('Print App Directory'),
          ),
          SizedBox(height: 20.0),
          Text('Application Directory:'),
          Text(
            appDirectory,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
