import 'package:meta/meta.dart';

abstract class Model<T extends Model<T>> {
  final String id;

  @protected
  final Map<String, dynamic> $data;

  Model(Map<String, dynamic> $data)
      : this.id = $data['id'],
        this.$data = $data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is T &&
      runtimeType == other.runtimeType &&
      id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '$runtimeType(${$data})';
  }

  dynamic operator [](String key) => $data[key];

  Map<String, dynamic> toJson({Iterable<String> excludes = const []}) =>
      Map.from($data)..removeWhere((key, _) => excludes.contains(key));
}
