import 'jolf_data.dart';

class JolfString extends JolfData<String> {
  final String data;

  JolfString(this.data);

  String toString() => '"$data"';
}