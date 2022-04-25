import 'package:fluent_ui/fluent_ui.dart';
import 'Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Smart Home',
      theme:
      ThemeData(brightness: Brightness.light, accentColor: Colors.orange),
      darkTheme:
      ThemeData(brightness: Brightness.dark, accentColor: Colors.orange),
      home: const HomePage(),
    );
  }
}


