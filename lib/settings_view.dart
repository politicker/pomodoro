import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(child: Consumer<AppModel>(
          builder: (context, model, child) {
            return DropdownButton<String>(
                value: model.workDuration.inMinutes.toString(),
                items: const [
                  DropdownMenuItem(value: '20', child: Text('20 minutes')),
                  DropdownMenuItem(value: '25', child: Text('25 minutes')),
                  DropdownMenuItem(value: '30', child: Text('30 minutes')),
                  DropdownMenuItem(value: '35', child: Text('35 minutes')),
                ],
                onChanged: (String? value) {
                  if (value == null) {
                    return;
                  }

                  model.setWorkDuration(int.parse(value));
                });
          },
        )));
  }
}
