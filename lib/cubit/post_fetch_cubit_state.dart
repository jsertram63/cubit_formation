

import 'package:cubit_formation/models/failure_model.dart';
import 'package:cubit_formation/models/post.dart';
import 'package:equatable/equatable.dart';

abstract class PostFetchCubitState extends Equatable {
  const PostFetchCubitState();

    @override 
    List<Object> get props => [];
}


class PostFechCubitInitial extends PostFetchCubitState{}
class PostFetcCubitLoading extends PostFetchCubitState {}

class PostFetchCubitLoaded extends PostFetchCubitState{
  final List<Post> postList;
  const PostFetchCubitLoaded({required this.postList});
}

class PostFetchCubitFetchError extends PostFetchCubitState {
  final Failure failure;
  const PostFetchCubitFetchError({required this.failure});


List<Object> get props => [Failure];

}