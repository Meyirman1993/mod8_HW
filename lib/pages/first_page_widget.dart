import 'package:flutter/material.dart';
import 'package:template_project/functions/fetch_file.dart';

// ignore: public_member_api_docs
class FIrstPageWidget extends StatefulWidget {
  // ignore: public_member_api_docs
  const FIrstPageWidget({Key? key}) : super(key: key);

  @override
  State<FIrstPageWidget> createState() => _FIrstPageWidgetState();
}

class _FIrstPageWidgetState extends State<FIrstPageWidget> {
  final _nameTextController = TextEditingController();
  Future<dynamic>? future;
  dynamic rowData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          // ignore: avoid_redundant_argument_values
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Input file name with extension',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                controller: _nameTextController,
              ),
            ),
            TextButton(
              // ignore: unnecessary_lambdas
              onPressed: () {
                getData();
              },
              child: const Text('Read file'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: FutureBuilder<dynamic>(
                initialData: rowData,
                future: future,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }

                      return Text(snapshot.data as String);

                    // ignore: no_default_cases
                    default:
                      return const Text('Here will be your data.');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void getData() {
    return setState(
      () {
        future = fetchTextFile('assets/${_nameTextController.text}');
      },
    );
  }
}
