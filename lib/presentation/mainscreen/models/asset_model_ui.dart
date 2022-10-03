import 'package:equatable/equatable.dart';

class AssetModel extends Equatable {
  final String displayName;
  final String symbolId;

  const AssetModel(
    this.displayName,
    this.symbolId,
  );

  @override
  List<Object?> get props => [
        displayName,
        symbolId,
      ];
}
