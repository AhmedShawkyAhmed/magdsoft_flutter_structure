import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/help_cubit/help_cubit.dart';
import '../widget/custom_expansion_panel.dart';
import '../widget/loading_widget.dart';

class ExpansionPanelView extends StatelessWidget {
  const ExpansionPanelView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67.h,
      child: BlocBuilder<HelpCubit, HelpState>(
        builder: (context, state) {
          return state is HelpLoaded
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.helpList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomExpansionPanel(
                        content: state.helpList[index].answer,
                        header: state.helpList[index].question);
                  },
                )
              : const LoadingWidget();
        },
      ),
    );
  }
}
