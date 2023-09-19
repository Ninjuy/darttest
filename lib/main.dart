import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WarehouseApp(),
    );
  }
}

class WarehouseApp extends StatefulWidget {
  @override
  _WarehouseAppState createState() => _WarehouseAppState();
}

class _WarehouseAppState extends State<WarehouseApp> {
  List<String> scanList = [];
  List<String> pobList = [];
  List<String> noList = [];
  int total = 0;
  int onHand = 0;
  int out = 0;
  List<String> orderQtyList = [];
  List<String> scanQtyList = [];

  TextEditingController scanController = TextEditingController();
  TextEditingController pobController = TextEditingController();
  TextEditingController NoController = TextEditingController();
  TextEditingController totalOnHandOutController = TextEditingController();
  TextEditingController orderQtyController = TextEditingController();
  TextEditingController scanQtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouse App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text('Scan:', style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: scanController,
                      onChanged: (text) {
                        // Add the scanned item to the scanList.
                        scanList.add(text);
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        hintText: 'Scan item',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('POB:', style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: pobController,
                      onChanged: (text) {
                        // Add POB or NO to the respective lists.
                        final values =
                            text.split(',').map((e) => e.trim()).toList();
                        pobList.add(values[0]);
                        noList.add(values.length > 1 ? values[1] : '');
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter POB',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('NO:', style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: NoController,
                      onChanged: (text) {
                        // Add POB or NO to the respective lists.
                        final values =
                            text.split(',').map((e) => e.trim()).toList();
                        pobList.add(values[0]);
                        noList.add(values.length > 1 ? values[1] : '');
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter NO',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Total: $total',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'On hand: $onHand Out: $out',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('Order QTY:', style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: orderQtyController,
                      onChanged: (text) {
                        // Add Order QTY to the orderQtyList.
                        orderQtyList.add(text);
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Order QTY',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('Scan QTY:', style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0)),
                      ),
                      child: TextField(
                        controller: scanQtyController,
                        onChanged: (text) {
                          // Add Scan QTY to the scanQtyList.
                          scanQtyList.add(text);
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Scan QTY',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              // Perform scanning logic here.
            },
            child: const Text('SCAN'),
          ),
          ElevatedButton(
            onPressed: () {
              // View function logic here.
            },
            child: const Text('VIEW'),
          ),
          ElevatedButton(
            onPressed: () {
              // Exit function logic here.
            },
            child: const Text('EXIT'),
          ),
        ],
      ),
    );
  }
}
