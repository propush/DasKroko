import 'package:equatable/equatable.dart';

class NumRow extends Equatable {
  final int freq;
  final String data;

  const NumRow(this.freq, this.data);

  @override
  List<Object> get props => [freq, data];
}
