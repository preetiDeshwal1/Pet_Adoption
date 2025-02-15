import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/features/presentation/details/bloc/bloc.dart';
import 'features/presentation/home/bloc/bloc.dart';
import 'features/presentation/home/ui/home_screen.dart';
import 'shared/theme_bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PetsBloc>(
          create: (BuildContext context) => PetsBloc(),
        ),
        BlocProvider<PetsDetalisBloc>(
          create: (BuildContext context) => PetsDetalisBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(builder: (context, themeMode) {
        return MaterialApp(
          title: 'Pet Adoption App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: PetsHomeScreen(),
        );
      }),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal, foregroundColor: Colors.white),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black, foregroundColor: Colors.white),
);
