import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component.dart';
import 'cupit.dart';
import 'states.dart';

class GetHhealth extends StatelessWidget {
  const GetHhealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            if (state is NewssettingsSuccessLoading) {
              return Center(child: CircularProgressIndicator());
            } else
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    newsItem(cubit.health[index], context),
                itemCount: cubit.health.length,
              );
          },
        ));
  }
}
