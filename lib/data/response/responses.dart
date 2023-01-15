import 'dart:convert';

class AuthenticationResponse {
  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;
  AuthenticationResponse({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'idToken': idToken,
      'email': email,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'localId': localId,
    };
  }

  factory AuthenticationResponse.fromMap(Map<String, dynamic> map) {
    return AuthenticationResponse(
      kind: map['kind'] != null ? map['kind'] as String : null,
      idToken: map['idToken'] != null ? map['idToken'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      expiresIn: map['expiresIn'] != null ? map['expiresIn'] as String : null,
      localId: map['localId'] != null ? map['localId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationResponse.fromJson(String source) =>
      AuthenticationResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthenticationResponse(kind: $kind\n idToken: $idToken\n email: $email\n refreshToken: $refreshToken\n expiresIn: $expiresIn\n localId: $localId)';
  }
}
