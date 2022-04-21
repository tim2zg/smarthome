import 'package:fluent_ui/fluent_ui.dart';
import 'Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Smart Home',
      theme:
      ThemeData(brightness: Brightness.light, accentColor: Colors.orange),
      darkTheme:
      ThemeData(brightness: Brightness.dark, accentColor: Colors.orange),
      home: HomePage(),
    );
  }
}


