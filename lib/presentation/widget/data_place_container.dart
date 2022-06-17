import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/models/account_model.dart';

class DataPlaceContainer extends StatelessWidget {
  final User? user;
  const DataPlaceContainer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('${ AppLocalizations.of(context)!.fullName}: ${user!.name}',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                )),
        const SizedBox(height: 8),
        Text('${ AppLocalizations.of(context)!.email}: ${user!.email}',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                )),
        const SizedBox(height: 8),
        Text('${ AppLocalizations.of(context)!.phone}: ${user!.phone}',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black,
                )),
      ],
    );
  }
}
