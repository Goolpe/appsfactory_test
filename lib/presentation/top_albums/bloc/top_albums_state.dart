import 'package:equatable/equatable.dart';

abstract class TopAlbumsState extends Equatable{
  const TopAlbumsState();

  @override
  List<Object> get props => [];
}

class TopAlbumsInitial extends TopAlbumsState{}
