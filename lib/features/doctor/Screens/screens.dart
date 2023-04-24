import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Doc extends StatefulWidget {
  const Doc({Key? key}) : super(key: key);

  @override
  State<Doc> createState() => _DocState();
}

class _DocState extends State<Doc> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}