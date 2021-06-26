// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'component.dart';
// import 'cupit.dart';
// import 'states.dart';

// class ScienceScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: BlocConsumer<NewsCubit, NewsStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           NewsCubit cubit = NewsCubit.get(context);
//           if (state is NewsBusinessSuccessLoadingState) {
//             return Center(child: CircularProgressIndicator());
//           } else
//             return ListView.builder(
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index) =>
//                   newsItem(cubit.science[index], context),
//               itemCount: cubit.science.length,
//             );
//         },
//       ),
//     );
//   }
// }
