class Task {
  String _id, _deadline, _description, _title, _type;
  
  Task({
    required String id,
    required String deadline,
    required String description,
    required String title,
    required String type,
  })  : _id = id,
        _deadline = deadline,
        _description = description,
        _title = title,
        _type = type;

  String get id {
    return _id;
  }

  String get deadline {
    return _deadline;
  }

  String get description {
    return _description;
  }

  String get title {
    return _title;
  }

  String get type {
    return _type;
  }
}
