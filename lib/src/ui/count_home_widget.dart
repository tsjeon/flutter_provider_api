import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterprovider/src/components/view_count.dart';
import 'package:flutterprovider/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({super.key});
  CountProvider? _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Provider'),
      ),
      body: ViewCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _countProvider?.add();
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              _countProvider?.remove();
            },
          ),
        ],
      ),
    );
  }
}
