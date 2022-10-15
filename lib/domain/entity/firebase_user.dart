class FirebaseUser {
  final String _uid;
  final String? _name, _email;
  FirebaseUser({
    required String uid,
    required String? name,
    required String? email,
  })  : _uid = uid,
        _name = name,
        _email = email;

  String get uid {
    return _uid;
  }

  String? get name {
    return _name;
  }

  String? get email {
    return _email;
  }
}
