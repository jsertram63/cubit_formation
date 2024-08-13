import 'dart:math';

import 'package:cubit_formation/cubit/post_fetch_cubit_cubit.dart';
import 'package:cubit_formation/cubit/post_fetch_cubit_state.dart';
import 'package:cubit_formation/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cubit Demo"),),
      body: BlocBuilder<PostFetchCubitCubit,PostFetchCubitState>(
        builder: (context, state){
          if (state is PostFetcCubitLoading){
            return const Center(child:CircularProgressIndicator());
          }else if (state is PostFetchCubitFetchError){
            return Text(state.failure.message);
          }else if (state is PostFetchCubitLoaded){
            final postList = state.postList;
            return postList.isEmpty ? const Text("Pas de posts") :
            ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index){
                final Post postCourant = postList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:10),
                  child:ListTile(
                    leading: CircleAvatar(child: Text(postCourant.id.toString()),),
                    title: Text(postCourant.title.toString()),
                    subtitle: Text(postCourant.body),

                  )
                );

              });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}