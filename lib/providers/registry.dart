import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'API/auth.dart';
import 'data/auth.dart';
import 'brain/auth.dart';
import 'functions/auth.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => AuthAPI()),
  ChangeNotifierProvider(create: (_) => AuthData()),
  ChangeNotifierProvider(create: (_) => AuthFunctions()),
  ChangeNotifierProvider(create: (_) => AuthProvider()),
];
