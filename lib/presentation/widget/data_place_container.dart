import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../data/models/account_model.dart';

class DataPlaceContainer extends StatelessWidget {
  final User user;
  const DataPlaceContainer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${user.name}'),
        const SizedBox(height: 8),
        Text('Email: ${user.email}'),
        const SizedBox(height: 8),
        Text('Phone: ${user.phone}'),
      ],
    );
  }
}
