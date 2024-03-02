import 'dart:convert';
/// todoId : "string"
/// todoItem : "string"
/// description : "string"
/// isDone : true
/// todoType : {"createdById":"string","createdBy":{"id":"string","userName":"string","normalizedUserName":"string","email":"string","normalizedEmail":"string","emailConfirmed":true,"passwordHash":"string","securityStamp":"string","concurrencyStamp":"string","phoneNumber":"string","phoneNumberConfirmed":true,"twoFactorEnabled":true,"lockoutEnd":"2024-02-26T15:17:56.102Z","lockoutEnabled":true,"accessFailedCount":0,"isSuperAdmin":true},"createdAtUtc":"2024-02-26T15:17:56.102Z","updatedById":"string","updatedBy":{"id":"string","userName":"string","normalizedUserName":"string","email":"string","normalizedEmail":"string","emailConfirmed":true,"passwordHash":"string","securityStamp":"string","concurrencyStamp":"string","phoneNumber":"string","phoneNumberConfirmed":true,"twoFactorEnabled":true,"lockoutEnd":"2024-02-26T15:17:56.102Z","lockoutEnabled":true,"accessFailedCount":0,"isSuperAdmin":true},"updatedAtUtc":"2024-02-26T15:17:56.102Z","todoTypeId":"string","name":"string","description":"string"}
/// todoTypeId : "string"
/// startDate : "2024-02-26T15:17:56.102Z"
/// endDate : "2024-02-26T15:17:56.102Z"
/// onBehalfId : "string"
/// todoPriorityId : "string"

TodoSubmit todoSubmitFromJson(String str) => TodoSubmit.fromJson(json.decode(str));
String todoSubmitToJson(TodoSubmit data) => json.encode(data.toJson());
class TodoSubmit {
  TodoSubmit({
      String? todoId, 
      String? todoItem, 
      String? description, 
      bool? isDone, 
      TodoType? todoType, 
      String? todoTypeId, 
      String? startDate, 
      String? endDate, 
      String? onBehalfId, 
      String? todoPriorityId,}){
    _todoId = todoId;
    _todoItem = todoItem;
    _description = description;
    _isDone = isDone;
    _todoType = todoType;
    _todoTypeId = todoTypeId;
    _startDate = startDate;
    _endDate = endDate;
    _onBehalfId = onBehalfId;
    _todoPriorityId = todoPriorityId;
}

  TodoSubmit.fromJson(dynamic json) {
    _todoId = json['todoId'];
    _todoItem = json['todoItem'];
    _description = json['description'];
    _isDone = json['isDone'];
    _todoType = json['todoType'] != null ? TodoType.fromJson(json['todoType']) : null;
    _todoTypeId = json['todoTypeId'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _onBehalfId = json['onBehalfId'];
    _todoPriorityId = json['todoPriorityId'];
  }
  String? _todoId;
  String? _todoItem;
  String? _description;
  bool? _isDone;
  TodoType? _todoType;
  String? _todoTypeId;
  String? _startDate;
  String? _endDate;
  String? _onBehalfId;
  String? _todoPriorityId;
TodoSubmit copyWith({  String? todoId,
  String? todoItem,
  String? description,
  bool? isDone,
  TodoType? todoType,
  String? todoTypeId,
  String? startDate,
  String? endDate,
  String? onBehalfId,
  String? todoPriorityId,
}) => TodoSubmit(  todoId: todoId ?? _todoId,
  todoItem: todoItem ?? _todoItem,
  description: description ?? _description,
  isDone: isDone ?? _isDone,
  todoType: todoType ?? _todoType,
  todoTypeId: todoTypeId ?? _todoTypeId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  onBehalfId: onBehalfId ?? _onBehalfId,
  todoPriorityId: todoPriorityId ?? _todoPriorityId,
);
  String? get todoId => _todoId;
  String? get todoItem => _todoItem;
  String? get description => _description;
  bool? get isDone => _isDone;
  TodoType? get todoType => _todoType;
  String? get todoTypeId => _todoTypeId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get onBehalfId => _onBehalfId;
  String? get todoPriorityId => _todoPriorityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['todoId'] = _todoId;
    map['todoItem'] = _todoItem;
    map['description'] = _description;
    map['isDone'] = _isDone;
    if (_todoType != null) {
      map['todoType'] = _todoType?.toJson();
    }
    map['todoTypeId'] = _todoTypeId;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['onBehalfId'] = _onBehalfId;
    map['todoPriorityId'] = _todoPriorityId;
    return map;
  }

}

/// createdById : "string"
/// createdBy : {"id":"string","userName":"string","normalizedUserName":"string","email":"string","normalizedEmail":"string","emailConfirmed":true,"passwordHash":"string","securityStamp":"string","concurrencyStamp":"string","phoneNumber":"string","phoneNumberConfirmed":true,"twoFactorEnabled":true,"lockoutEnd":"2024-02-26T15:17:56.102Z","lockoutEnabled":true,"accessFailedCount":0,"isSuperAdmin":true}
/// createdAtUtc : "2024-02-26T15:17:56.102Z"
/// updatedById : "string"
/// updatedBy : {"id":"string","userName":"string","normalizedUserName":"string","email":"string","normalizedEmail":"string","emailConfirmed":true,"passwordHash":"string","securityStamp":"string","concurrencyStamp":"string","phoneNumber":"string","phoneNumberConfirmed":true,"twoFactorEnabled":true,"lockoutEnd":"2024-02-26T15:17:56.102Z","lockoutEnabled":true,"accessFailedCount":0,"isSuperAdmin":true}
/// updatedAtUtc : "2024-02-26T15:17:56.102Z"
/// todoTypeId : "string"
/// name : "string"
/// description : "string"

TodoType todoTypeFromJson(String str) => TodoType.fromJson(json.decode(str));
String todoTypeToJson(TodoType data) => json.encode(data.toJson());
class TodoType {
  TodoType({
      String? createdById, 
      CreatedBy? createdBy, 
      String? createdAtUtc, 
      String? updatedById, 
      UpdatedBy? updatedBy, 
      String? updatedAtUtc, 
      String? todoTypeId, 
      String? name, 
      String? description,}){
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
    _todoTypeId = todoTypeId;
    _name = name;
    _description = description;
}

  TodoType.fromJson(dynamic json) {
    _createdById = json['createdById'];
    _createdBy = json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null;
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'] != null ? UpdatedBy.fromJson(json['updatedBy']) : null;
    _updatedAtUtc = json['updatedAtUtc'];
    _todoTypeId = json['todoTypeId'];
    _name = json['name'];
    _description = json['description'];
  }
  String? _createdById;
  CreatedBy? _createdBy;
  String? _createdAtUtc;
  String? _updatedById;
  UpdatedBy? _updatedBy;
  String? _updatedAtUtc;
  String? _todoTypeId;
  String? _name;
  String? _description;
TodoType copyWith({  String? createdById,
  CreatedBy? createdBy,
  String? createdAtUtc,
  String? updatedById,
  UpdatedBy? updatedBy,
  String? updatedAtUtc,
  String? todoTypeId,
  String? name,
  String? description,
}) => TodoType(  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
  todoTypeId: todoTypeId ?? _todoTypeId,
  name: name ?? _name,
  description: description ?? _description,
);
  String? get createdById => _createdById;
  CreatedBy? get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  String? get updatedById => _updatedById;
  UpdatedBy? get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;
  String? get todoTypeId => _todoTypeId;
  String? get name => _name;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdById'] = _createdById;
    if (_createdBy != null) {
      map['createdBy'] = _createdBy?.toJson();
    }
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    if (_updatedBy != null) {
      map['updatedBy'] = _updatedBy?.toJson();
    }
    map['updatedAtUtc'] = _updatedAtUtc;
    map['todoTypeId'] = _todoTypeId;
    map['name'] = _name;
    map['description'] = _description;
    return map;
  }

}

/// id : "string"
/// userName : "string"
/// normalizedUserName : "string"
/// email : "string"
/// normalizedEmail : "string"
/// emailConfirmed : true
/// passwordHash : "string"
/// securityStamp : "string"
/// concurrencyStamp : "string"
/// phoneNumber : "string"
/// phoneNumberConfirmed : true
/// twoFactorEnabled : true
/// lockoutEnd : "2024-02-26T15:17:56.102Z"
/// lockoutEnabled : true
/// accessFailedCount : 0
/// isSuperAdmin : true

UpdatedBy updatedByFromJson(String str) => UpdatedBy.fromJson(json.decode(str));
String updatedByToJson(UpdatedBy data) => json.encode(data.toJson());
class UpdatedBy {
  UpdatedBy({
      String? id, 
      String? userName, 
      String? normalizedUserName, 
      String? email, 
      String? normalizedEmail, 
      bool? emailConfirmed, 
      String? passwordHash, 
      String? securityStamp, 
      String? concurrencyStamp, 
      String? phoneNumber, 
      bool? phoneNumberConfirmed, 
      bool? twoFactorEnabled, 
      String? lockoutEnd, 
      bool? lockoutEnabled, 
      int? accessFailedCount, 
      bool? isSuperAdmin,}){
    _id = id;
    _userName = userName;
    _normalizedUserName = normalizedUserName;
    _email = email;
    _normalizedEmail = normalizedEmail;
    _emailConfirmed = emailConfirmed;
    _passwordHash = passwordHash;
    _securityStamp = securityStamp;
    _concurrencyStamp = concurrencyStamp;
    _phoneNumber = phoneNumber;
    _phoneNumberConfirmed = phoneNumberConfirmed;
    _twoFactorEnabled = twoFactorEnabled;
    _lockoutEnd = lockoutEnd;
    _lockoutEnabled = lockoutEnabled;
    _accessFailedCount = accessFailedCount;
    _isSuperAdmin = isSuperAdmin;
}

  UpdatedBy.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _normalizedUserName = json['normalizedUserName'];
    _email = json['email'];
    _normalizedEmail = json['normalizedEmail'];
    _emailConfirmed = json['emailConfirmed'];
    _passwordHash = json['passwordHash'];
    _securityStamp = json['securityStamp'];
    _concurrencyStamp = json['concurrencyStamp'];
    _phoneNumber = json['phoneNumber'];
    _phoneNumberConfirmed = json['phoneNumberConfirmed'];
    _twoFactorEnabled = json['twoFactorEnabled'];
    _lockoutEnd = json['lockoutEnd'];
    _lockoutEnabled = json['lockoutEnabled'];
    _accessFailedCount = json['accessFailedCount'];
    _isSuperAdmin = json['isSuperAdmin'];
  }
  String? _id;
  String? _userName;
  String? _normalizedUserName;
  String? _email;
  String? _normalizedEmail;
  bool? _emailConfirmed;
  String? _passwordHash;
  String? _securityStamp;
  String? _concurrencyStamp;
  String? _phoneNumber;
  bool? _phoneNumberConfirmed;
  bool? _twoFactorEnabled;
  String? _lockoutEnd;
  bool? _lockoutEnabled;
  int? _accessFailedCount;
  bool? _isSuperAdmin;
UpdatedBy copyWith({  String? id,
  String? userName,
  String? normalizedUserName,
  String? email,
  String? normalizedEmail,
  bool? emailConfirmed,
  String? passwordHash,
  String? securityStamp,
  String? concurrencyStamp,
  String? phoneNumber,
  bool? phoneNumberConfirmed,
  bool? twoFactorEnabled,
  String? lockoutEnd,
  bool? lockoutEnabled,
  int? accessFailedCount,
  bool? isSuperAdmin,
}) => UpdatedBy(  id: id ?? _id,
  userName: userName ?? _userName,
  normalizedUserName: normalizedUserName ?? _normalizedUserName,
  email: email ?? _email,
  normalizedEmail: normalizedEmail ?? _normalizedEmail,
  emailConfirmed: emailConfirmed ?? _emailConfirmed,
  passwordHash: passwordHash ?? _passwordHash,
  securityStamp: securityStamp ?? _securityStamp,
  concurrencyStamp: concurrencyStamp ?? _concurrencyStamp,
  phoneNumber: phoneNumber ?? _phoneNumber,
  phoneNumberConfirmed: phoneNumberConfirmed ?? _phoneNumberConfirmed,
  twoFactorEnabled: twoFactorEnabled ?? _twoFactorEnabled,
  lockoutEnd: lockoutEnd ?? _lockoutEnd,
  lockoutEnabled: lockoutEnabled ?? _lockoutEnabled,
  accessFailedCount: accessFailedCount ?? _accessFailedCount,
  isSuperAdmin: isSuperAdmin ?? _isSuperAdmin,
);
  String? get id => _id;
  String? get userName => _userName;
  String? get normalizedUserName => _normalizedUserName;
  String? get email => _email;
  String? get normalizedEmail => _normalizedEmail;
  bool? get emailConfirmed => _emailConfirmed;
  String? get passwordHash => _passwordHash;
  String? get securityStamp => _securityStamp;
  String? get concurrencyStamp => _concurrencyStamp;
  String? get phoneNumber => _phoneNumber;
  bool? get phoneNumberConfirmed => _phoneNumberConfirmed;
  bool? get twoFactorEnabled => _twoFactorEnabled;
  String? get lockoutEnd => _lockoutEnd;
  bool? get lockoutEnabled => _lockoutEnabled;
  int? get accessFailedCount => _accessFailedCount;
  bool? get isSuperAdmin => _isSuperAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['normalizedUserName'] = _normalizedUserName;
    map['email'] = _email;
    map['normalizedEmail'] = _normalizedEmail;
    map['emailConfirmed'] = _emailConfirmed;
    map['passwordHash'] = _passwordHash;
    map['securityStamp'] = _securityStamp;
    map['concurrencyStamp'] = _concurrencyStamp;
    map['phoneNumber'] = _phoneNumber;
    map['phoneNumberConfirmed'] = _phoneNumberConfirmed;
    map['twoFactorEnabled'] = _twoFactorEnabled;
    map['lockoutEnd'] = _lockoutEnd;
    map['lockoutEnabled'] = _lockoutEnabled;
    map['accessFailedCount'] = _accessFailedCount;
    map['isSuperAdmin'] = _isSuperAdmin;
    return map;
  }

}

/// id : "string"
/// userName : "string"
/// normalizedUserName : "string"
/// email : "string"
/// normalizedEmail : "string"
/// emailConfirmed : true
/// passwordHash : "string"
/// securityStamp : "string"
/// concurrencyStamp : "string"
/// phoneNumber : "string"
/// phoneNumberConfirmed : true
/// twoFactorEnabled : true
/// lockoutEnd : "2024-02-26T15:17:56.102Z"
/// lockoutEnabled : true
/// accessFailedCount : 0
/// isSuperAdmin : true

CreatedBy createdByFromJson(String str) => CreatedBy.fromJson(json.decode(str));
String createdByToJson(CreatedBy data) => json.encode(data.toJson());
class CreatedBy {
  CreatedBy({
      String? id, 
      String? userName, 
      String? normalizedUserName, 
      String? email, 
      String? normalizedEmail, 
      bool? emailConfirmed, 
      String? passwordHash, 
      String? securityStamp, 
      String? concurrencyStamp, 
      String? phoneNumber, 
      bool? phoneNumberConfirmed, 
      bool? twoFactorEnabled, 
      String? lockoutEnd, 
      bool? lockoutEnabled, 
      int? accessFailedCount, 
      bool? isSuperAdmin,}){
    _id = id;
    _userName = userName;
    _normalizedUserName = normalizedUserName;
    _email = email;
    _normalizedEmail = normalizedEmail;
    _emailConfirmed = emailConfirmed;
    _passwordHash = passwordHash;
    _securityStamp = securityStamp;
    _concurrencyStamp = concurrencyStamp;
    _phoneNumber = phoneNumber;
    _phoneNumberConfirmed = phoneNumberConfirmed;
    _twoFactorEnabled = twoFactorEnabled;
    _lockoutEnd = lockoutEnd;
    _lockoutEnabled = lockoutEnabled;
    _accessFailedCount = accessFailedCount;
    _isSuperAdmin = isSuperAdmin;
}

  CreatedBy.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _normalizedUserName = json['normalizedUserName'];
    _email = json['email'];
    _normalizedEmail = json['normalizedEmail'];
    _emailConfirmed = json['emailConfirmed'];
    _passwordHash = json['passwordHash'];
    _securityStamp = json['securityStamp'];
    _concurrencyStamp = json['concurrencyStamp'];
    _phoneNumber = json['phoneNumber'];
    _phoneNumberConfirmed = json['phoneNumberConfirmed'];
    _twoFactorEnabled = json['twoFactorEnabled'];
    _lockoutEnd = json['lockoutEnd'];
    _lockoutEnabled = json['lockoutEnabled'];
    _accessFailedCount = json['accessFailedCount'];
    _isSuperAdmin = json['isSuperAdmin'];
  }
  String? _id;
  String? _userName;
  String? _normalizedUserName;
  String? _email;
  String? _normalizedEmail;
  bool? _emailConfirmed;
  String? _passwordHash;
  String? _securityStamp;
  String? _concurrencyStamp;
  String? _phoneNumber;
  bool? _phoneNumberConfirmed;
  bool? _twoFactorEnabled;
  String? _lockoutEnd;
  bool? _lockoutEnabled;
  int? _accessFailedCount;
  bool? _isSuperAdmin;
CreatedBy copyWith({  String? id,
  String? userName,
  String? normalizedUserName,
  String? email,
  String? normalizedEmail,
  bool? emailConfirmed,
  String? passwordHash,
  String? securityStamp,
  String? concurrencyStamp,
  String? phoneNumber,
  bool? phoneNumberConfirmed,
  bool? twoFactorEnabled,
  String? lockoutEnd,
  bool? lockoutEnabled,
  int? accessFailedCount,
  bool? isSuperAdmin,
}) => CreatedBy(  id: id ?? _id,
  userName: userName ?? _userName,
  normalizedUserName: normalizedUserName ?? _normalizedUserName,
  email: email ?? _email,
  normalizedEmail: normalizedEmail ?? _normalizedEmail,
  emailConfirmed: emailConfirmed ?? _emailConfirmed,
  passwordHash: passwordHash ?? _passwordHash,
  securityStamp: securityStamp ?? _securityStamp,
  concurrencyStamp: concurrencyStamp ?? _concurrencyStamp,
  phoneNumber: phoneNumber ?? _phoneNumber,
  phoneNumberConfirmed: phoneNumberConfirmed ?? _phoneNumberConfirmed,
  twoFactorEnabled: twoFactorEnabled ?? _twoFactorEnabled,
  lockoutEnd: lockoutEnd ?? _lockoutEnd,
  lockoutEnabled: lockoutEnabled ?? _lockoutEnabled,
  accessFailedCount: accessFailedCount ?? _accessFailedCount,
  isSuperAdmin: isSuperAdmin ?? _isSuperAdmin,
);
  String? get id => _id;
  String? get userName => _userName;
  String? get normalizedUserName => _normalizedUserName;
  String? get email => _email;
  String? get normalizedEmail => _normalizedEmail;
  bool? get emailConfirmed => _emailConfirmed;
  String? get passwordHash => _passwordHash;
  String? get securityStamp => _securityStamp;
  String? get concurrencyStamp => _concurrencyStamp;
  String? get phoneNumber => _phoneNumber;
  bool? get phoneNumberConfirmed => _phoneNumberConfirmed;
  bool? get twoFactorEnabled => _twoFactorEnabled;
  String? get lockoutEnd => _lockoutEnd;
  bool? get lockoutEnabled => _lockoutEnabled;
  int? get accessFailedCount => _accessFailedCount;
  bool? get isSuperAdmin => _isSuperAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['normalizedUserName'] = _normalizedUserName;
    map['email'] = _email;
    map['normalizedEmail'] = _normalizedEmail;
    map['emailConfirmed'] = _emailConfirmed;
    map['passwordHash'] = _passwordHash;
    map['securityStamp'] = _securityStamp;
    map['concurrencyStamp'] = _concurrencyStamp;
    map['phoneNumber'] = _phoneNumber;
    map['phoneNumberConfirmed'] = _phoneNumberConfirmed;
    map['twoFactorEnabled'] = _twoFactorEnabled;
    map['lockoutEnd'] = _lockoutEnd;
    map['lockoutEnabled'] = _lockoutEnabled;
    map['accessFailedCount'] = _accessFailedCount;
    map['isSuperAdmin'] = _isSuperAdmin;
    return map;
  }

}