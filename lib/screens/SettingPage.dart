import 'package:flutter/material.dart';

import 'package:project10/stateManagement/blocs/Preferences_bloc.dart';
import 'package:project10/stateManagement/models/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, Preferences>(
        builder: (context, preferences) {
      return Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.restore),
                    onPressed:
                        context.read<PreferencesCubit>().deleteAllPreferences,
                  ),
                  Card(
                    child: Column(
                      children: [
                        RadioListTile<ThemeMode>(
                          value: ThemeMode.dark,
                          groupValue: preferences.themeMode,
                          title: Text('Dark Mode'),
                          onChanged: (s) {
                            context.read<PreferencesCubit>().changePreferences(
                                preferences.copyWith(
                                    themeMode: ThemeMode.dark));
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          value: ThemeMode.light,
                          groupValue: preferences.themeMode,
                          title: Text('Light Mode'),
                          onChanged: (s) {
                            context.read<PreferencesCubit>().changePreferences(
                                preferences.copyWith(
                                    themeMode: ThemeMode.light));
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          value: ThemeMode.system,
                          groupValue: preferences.themeMode,
                          title: Text('System'),
                          onChanged: (s) {
                            context.read<PreferencesCubit>().changePreferences(
                                preferences.copyWith(
                                    themeMode: ThemeMode.system));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
