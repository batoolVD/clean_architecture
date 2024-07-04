import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;
import 'presentation/bloc/user_bloc.dart';
import 'presentation/pages/user_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<UserBloc>()),
      ],
      child: const MaterialApp(
        title: 'Clean Architecture App',
        home: UserPage(),
      ),
    );
  }
}
