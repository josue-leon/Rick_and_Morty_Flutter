import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/routers/my_go_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = MyGoRouter.returnRouter(true);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //late final appRoutes = MyGoRouter.returnRouter(false);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reto GeeksCastle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
      // localizationsDelegates: context.namedLocation,
      // routeInformationParser: MyGoRouter.returnRouter(true).routeInformationParser,
      // routerDelegate: MyGoRouter.returnRouter(true).routerDelegate,
      // routeInformationParser: MyGoRouter.returnRouter(false).routeInformationParser,
      // routeInformationProvider: MyGoRouter.returnRouter(false).routeInformationProvider,
      // routerDelegate: MyGoRouter.returnRouter(false).routerDelegate,
    );
  }
}
