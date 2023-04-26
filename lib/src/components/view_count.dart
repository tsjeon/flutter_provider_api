import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterprovider/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('build called');
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child) {
          return Text(
            provider.count.toString(),
            style: const TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}
