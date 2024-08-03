import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/item_bloc.dart';
import 'package:flutter_application_1/counter/cubit/counter_cubit.dart';

import 'package:flutter_application_1/model/repoistory/item_repoistory.dart';

import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edu Vista',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
        useMaterial3: true,
      ),

      // next 3 lines for device preview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
          BlocProvider<ItemBloc>(
            create: (context) => ItemBloc(ItemRepository()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
