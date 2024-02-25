class LoginModel {
  TokenRequest? tokenRequest;

  LoginModel({this.tokenRequest});

  LoginModel.fromJson(Map<String, dynamic> json) {
    tokenRequest = json['TokenRequest'] != null
        ? new TokenRequest.fromJson(json['TokenRequest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tokenRequest != null) {
      data['TokenRequest'] = this.tokenRequest!.toJson();
    }
    return data;
  }
}

class TokenRequest {
  String? type;
  Properties? properties;
  bool? additionalProperties;

  TokenRequest({this.type, this.properties, this.additionalProperties});

  TokenRequest.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    additionalProperties = json['additionalProperties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    data['additionalProperties'] = this.additionalProperties;
    return data;
  }
}

class Properties {
  Email? email;
  Email? password;

  Properties({this.email, this.password});

  Properties.fromJson(Map<String, dynamic> json) {
    email = json['email'] != null ? new Email.fromJson(json['email']) : null;
    password =
    json['password'] != null ? new Email.fromJson(json['password']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.email != null) {
      data['email'] = this.email!.toJson();
    }
    if (this.password != null) {
      data['password'] = this.password!.toJson();
    }
    return data;
  }
}

class Email {
  String? type;
  bool? nullable;

  Email({this.type, this.nullable});

  Email.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    nullable = json['nullable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['nullable'] = this.nullable;
    return data;
  }
}
