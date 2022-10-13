class Untils {
  static List<T> listFromJson<T>({
    required List json, required T Function(Map<String, dynamic>) fromJson,
  }) {
    List<T> list = <T>[];

    json.forEach((element) {
      final value = fromJson(element);
      list.add(value);
    });

    return list;
  }
}