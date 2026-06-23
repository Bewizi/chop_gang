import 'package:chop_gang/app/app.dart';
import 'package:chop_gang/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
