import 'dart:convert';
/// data : [{"todoId":"16b1cc8d-cc6b-4806-9472-dadda7812122","todoItem":"item 1","description":"desc","isDone":false,"todoType":{"todoTypeId":"997dfa0e-2ee1-4d28-a2c7-50b627e280e6","name":"Büro","description":"","createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":null,"updatedBy":null,"updatedAtUtc":"0001-01-01T00:00:00"},"todoTypeId":"997dfa0e-2ee1-4d28-a2c7-50b627e280e6","startDate":"2024-02-02T00:00:00","endDate":"2024-02-05T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","todoPriority":{"todoPriorityId":"274fdd4e-01b9-4a52-b666-bd724349e740","name":"Normal","createdById":"163bb345-fe04-4828-a671-54e353167711","createdBy":null,"createdAtUtc":"2023-10-15T19:49:08.4310843","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T19:49:14.6704703"},"todoPriorityId":"274fdd4e-01b9-4a52-b666-bd724349e740","createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2024-02-02T16:25:19.4962465","updatedById":null,"updatedBy":null,"updatedAtUtc":"2024-02-02T16:25:19.4962465"}]
/// isSuccess : true

TodoResponse todoResponseFromJson(String str) => TodoResponse.fromJson(json.decode(str));
String todoResponseToJson(TodoResponse data) => json.encode(data.toJson());
class TodoResponse {
  TodoResponse({
      List<Data>? data, 
      bool? isSuccess,}){
    _data = data;
    _isSuccess = isSuccess;
}

  TodoResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _isSuccess = json['isSuccess'];
  }
  List<Data>? _data;
  bool? _isSuccess;
TodoResponse copyWith({  List<Data>? data,
  bool? isSuccess,
}) => TodoResponse(  data: data ?? _data,
  isSuccess: isSuccess ?? _isSuccess,
);
  List<Data>? get data => _data;
  bool? get isSuccess => _isSuccess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['isSuccess'] = _isSuccess;
    return map;
  }

}

/// todoId : "16b1cc8d-cc6b-4806-9472-dadda7812122"
/// todoItem : "item 1"
/// description : "desc"
/// isDone : false
/// todoType : {"todoTypeId":"997dfa0e-2ee1-4d28-a2c7-50b627e280e6","name":"Büro","description":"","createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":null,"updatedBy":null,"updatedAtUtc":"0001-01-01T00:00:00"}
/// todoTypeId : "997dfa0e-2ee1-4d28-a2c7-50b627e280e6"
/// startDate : "2024-02-02T00:00:00"
/// endDate : "2024-02-05T00:00:00"
/// onBehalf : {"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"}
/// onBehalfId : "19cc0518-b993-4f8f-901b-85c4068e7faa"
/// todoPriority : {"todoPriorityId":"274fdd4e-01b9-4a52-b666-bd724349e740","name":"Normal","createdById":"163bb345-fe04-4828-a671-54e353167711","createdBy":null,"createdAtUtc":"2023-10-15T19:49:08.4310843","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T19:49:14.6704703"}
/// todoPriorityId : "274fdd4e-01b9-4a52-b666-bd724349e740"
/// createdById : "2b789954-354d-43c3-941b-f0b9c30ae41d"
/// createdBy : null
/// createdAtUtc : "2024-02-02T16:25:19.4962465"
/// updatedById : null
/// updatedBy : null
/// updatedAtUtc : "2024-02-02T16:25:19.4962465"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? todoId, 
      String? todoItem, 
      String? description, 
      bool? isDone, 
      TodoType? todoType, 
      String? todoTypeId, 
      String? startDate, 
      String? endDate, 
      OnBehalf? onBehalf, 
      String? onBehalfId, 
      TodoPriority? todoPriority, 
      String? todoPriorityId, 
      String? createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      dynamic updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _todoId = todoId;
    _todoItem = todoItem;
    _description = description;
    _isDone = isDone;
    _todoType = todoType;
    _todoTypeId = todoTypeId;
    _startDate = startDate;
    _endDate = endDate;
    _onBehalf = onBehalf;
    _onBehalfId = onBehalfId;
    _todoPriority = todoPriority;
    _todoPriorityId = todoPriorityId;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  Data.fromJson(dynamic json) {
    _todoId = json['todoId'];
    _todoItem = json['todoItem'];
    _description = json['description'];
    _isDone = json['isDone'];
    _todoType = json['todoType'] != null ? TodoType.fromJson(json['todoType']) : null;
    _todoTypeId = json['todoTypeId'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _onBehalf = json['onBehalf'] != null ? OnBehalf.fromJson(json['onBehalf']) : null;
    _onBehalfId = json['onBehalfId'];
    _todoPriority = json['todoPriority'] != null ? TodoPriority.fromJson(json['todoPriority']) : null;
    _todoPriorityId = json['todoPriorityId'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _todoId;
  String? _todoItem;
  String? _description;
  bool? _isDone;
  TodoType? _todoType;
  String? _todoTypeId;
  String? _startDate;
  String? _endDate;
  OnBehalf? _onBehalf;
  String? _onBehalfId;
  TodoPriority? _todoPriority;
  String? _todoPriorityId;
  String? _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  dynamic _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
Data copyWith({  String? todoId,
  String? todoItem,
  String? description,
  bool? isDone,
  TodoType? todoType,
  String? todoTypeId,
  String? startDate,
  String? endDate,
  OnBehalf? onBehalf,
  String? onBehalfId,
  TodoPriority? todoPriority,
  String? todoPriorityId,
  String? createdById,
  dynamic createdBy,
  String? createdAtUtc,
  dynamic updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => Data(  todoId: todoId ?? _todoId,
  todoItem: todoItem ?? _todoItem,
  description: description ?? _description,
  isDone: isDone ?? _isDone,
  todoType: todoType ?? _todoType,
  todoTypeId: todoTypeId ?? _todoTypeId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  onBehalf: onBehalf ?? _onBehalf,
  onBehalfId: onBehalfId ?? _onBehalfId,
  todoPriority: todoPriority ?? _todoPriority,
  todoPriorityId: todoPriorityId ?? _todoPriorityId,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get todoId => _todoId;
  String? get todoItem => _todoItem;
  String? get description => _description;
  bool? get isDone => _isDone;
  TodoType? get todoType => _todoType;
  String? get todoTypeId => _todoTypeId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  OnBehalf? get onBehalf => _onBehalf;
  String? get onBehalfId => _onBehalfId;
  TodoPriority? get todoPriority => _todoPriority;
  String? get todoPriorityId => _todoPriorityId;
  String? get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  dynamic get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

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
    if (_onBehalf != null) {
      map['onBehalf'] = _onBehalf?.toJson();
    }
    map['onBehalfId'] = _onBehalfId;
    if (_todoPriority != null) {
      map['todoPriority'] = _todoPriority?.toJson();
    }
    map['todoPriorityId'] = _todoPriorityId;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}

/// todoPriorityId : "274fdd4e-01b9-4a52-b666-bd724349e740"
/// name : "Normal"
/// createdById : "163bb345-fe04-4828-a671-54e353167711"
/// createdBy : null
/// createdAtUtc : "2023-10-15T19:49:08.4310843"
/// updatedById : "163bb345-fe04-4828-a671-54e353167711"
/// updatedBy : null
/// updatedAtUtc : "2023-10-15T19:49:14.6704703"

TodoPriority todoPriorityFromJson(String str) => TodoPriority.fromJson(json.decode(str));
String todoPriorityToJson(TodoPriority data) => json.encode(data.toJson());
class TodoPriority {
  TodoPriority({
      String? todoPriorityId, 
      String? name, 
      String? createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      String? updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _todoPriorityId = todoPriorityId;
    _name = name;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  TodoPriority.fromJson(dynamic json) {
    _todoPriorityId = json['todoPriorityId'];
    _name = json['name'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _todoPriorityId;
  String? _name;
  String? _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  String? _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
TodoPriority copyWith({  String? todoPriorityId,
  String? name,
  String? createdById,
  dynamic createdBy,
  String? createdAtUtc,
  String? updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => TodoPriority(  todoPriorityId: todoPriorityId ?? _todoPriorityId,
  name: name ?? _name,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get todoPriorityId => _todoPriorityId;
  String? get name => _name;
  String? get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  String? get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['todoPriorityId'] = _todoPriorityId;
    map['name'] = _name;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}

/// employeeId : "19cc0518-b993-4f8f-901b-85c4068e7faa"
/// firstName : "Hilda"
/// lastName : "Haynes"
/// gender : "Female"
/// dateOfBirth : "1992-04-04T00:00:00"
/// placeOfBirth : "Weirton"
/// maritalStatus : "Single"
/// email : "Hilda.Haynes@leaves-hrm.com"
/// phone : "(570) 873-7090"
/// address1 : "778-9383 Suspendisse Av."
/// address2 : null
/// city : "Weirton"
/// stateProvince : "IN"
/// zipCode : "93479"
/// country : "USA"
/// employeeIDNumber : "EMPSLS004"
/// designationId : "fb9df214-d373-447b-bcb0-9501c3dbb564"
/// designation : null
/// departmentId : "fc00bef6-8e74-427f-9aab-a8381cfc6564"
/// department : null
/// joiningDate : "2017-04-04T00:00:00"
/// leavingDate : null
/// supervisorId : "c19600fe-7e69-4b04-9702-1af1465c462d"
/// supervisor : null
/// annualLeaves : 20
/// basicSalary : 10000.00
/// unpaidLeavePerDay : 500.00
/// benefitTemplateId : "c933c6bc-ccc7-4b99-b230-f07d04d3fcf7"
/// benefitTemplate : null
/// accountTitle : "Hilda Haynes Payroll"
/// bankName : "Bank of New York Mellon"
/// accountNumber : "4444-MELLON"
/// swiftCode : null
/// systemUserId : "2b789954-354d-43c3-941b-f0b9c30ae41d"
/// systemUser : null
/// createdById : null
/// createdBy : null
/// createdAtUtc : "0001-01-01T00:00:00"
/// updatedById : "163bb345-fe04-4828-a671-54e353167711"
/// updatedBy : null
/// updatedAtUtc : "2023-09-10T17:38:52.6686644"

OnBehalf onBehalfFromJson(String str) => OnBehalf.fromJson(json.decode(str));
String onBehalfToJson(OnBehalf data) => json.encode(data.toJson());
class OnBehalf {
  OnBehalf({
      String? employeeId, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dateOfBirth, 
      String? placeOfBirth, 
      String? maritalStatus, 
      String? email, 
      String? phone, 
      String? address1, 
      dynamic address2, 
      String? city, 
      String? stateProvince, 
      String? zipCode, 
      String? country, 
      String? employeeIDNumber, 
      String? designationId, 
      dynamic designation, 
      String? departmentId, 
      dynamic department, 
      String? joiningDate, 
      dynamic leavingDate, 
      String? supervisorId, 
      dynamic supervisor, 
      int? annualLeaves, 
      double? basicSalary, 
      double? unpaidLeavePerDay, 
      String? benefitTemplateId, 
      dynamic benefitTemplate, 
      String? accountTitle, 
      String? bankName, 
      String? accountNumber, 
      dynamic swiftCode, 
      String? systemUserId, 
      dynamic systemUser, 
      dynamic createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      String? updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _employeeId = employeeId;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dateOfBirth = dateOfBirth;
    _placeOfBirth = placeOfBirth;
    _maritalStatus = maritalStatus;
    _email = email;
    _phone = phone;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _stateProvince = stateProvince;
    _zipCode = zipCode;
    _country = country;
    _employeeIDNumber = employeeIDNumber;
    _designationId = designationId;
    _designation = designation;
    _departmentId = departmentId;
    _department = department;
    _joiningDate = joiningDate;
    _leavingDate = leavingDate;
    _supervisorId = supervisorId;
    _supervisor = supervisor;
    _annualLeaves = annualLeaves;
    _basicSalary = basicSalary;
    _unpaidLeavePerDay = unpaidLeavePerDay;
    _benefitTemplateId = benefitTemplateId;
    _benefitTemplate = benefitTemplate;
    _accountTitle = accountTitle;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _swiftCode = swiftCode;
    _systemUserId = systemUserId;
    _systemUser = systemUser;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  OnBehalf.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _gender = json['gender'];
    _dateOfBirth = json['dateOfBirth'];
    _placeOfBirth = json['placeOfBirth'];
    _maritalStatus = json['maritalStatus'];
    _email = json['email'];
    _phone = json['phone'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _city = json['city'];
    _stateProvince = json['stateProvince'];
    _zipCode = json['zipCode'];
    _country = json['country'];
    _employeeIDNumber = json['employeeIDNumber'];
    _designationId = json['designationId'];
    _designation = json['designation'];
    _departmentId = json['departmentId'];
    _department = json['department'];
    _joiningDate = json['joiningDate'];
    _leavingDate = json['leavingDate'];
    _supervisorId = json['supervisorId'];
    _supervisor = json['supervisor'];
    _annualLeaves = json['annualLeaves'];
    _basicSalary = json['basicSalary'];
    _unpaidLeavePerDay = json['unpaidLeavePerDay'];
    _benefitTemplateId = json['benefitTemplateId'];
    _benefitTemplate = json['benefitTemplate'];
    _accountTitle = json['accountTitle'];
    _bankName = json['bankName'];
    _accountNumber = json['accountNumber'];
    _swiftCode = json['swiftCode'];
    _systemUserId = json['systemUserId'];
    _systemUser = json['systemUser'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _employeeId;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _dateOfBirth;
  String? _placeOfBirth;
  String? _maritalStatus;
  String? _email;
  String? _phone;
  String? _address1;
  dynamic _address2;
  String? _city;
  String? _stateProvince;
  String? _zipCode;
  String? _country;
  String? _employeeIDNumber;
  String? _designationId;
  dynamic _designation;
  String? _departmentId;
  dynamic _department;
  String? _joiningDate;
  dynamic _leavingDate;
  String? _supervisorId;
  dynamic _supervisor;
  int? _annualLeaves;
  double? _basicSalary;
  double? _unpaidLeavePerDay;
  String? _benefitTemplateId;
  dynamic _benefitTemplate;
  String? _accountTitle;
  String? _bankName;
  String? _accountNumber;
  dynamic _swiftCode;
  String? _systemUserId;
  dynamic _systemUser;
  dynamic _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  String? _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
OnBehalf copyWith({  String? employeeId,
  String? firstName,
  String? lastName,
  String? gender,
  String? dateOfBirth,
  String? placeOfBirth,
  String? maritalStatus,
  String? email,
  String? phone,
  String? address1,
  dynamic address2,
  String? city,
  String? stateProvince,
  String? zipCode,
  String? country,
  String? employeeIDNumber,
  String? designationId,
  dynamic designation,
  String? departmentId,
  dynamic department,
  String? joiningDate,
  dynamic leavingDate,
  String? supervisorId,
  dynamic supervisor,
  int? annualLeaves,
  double? basicSalary,
  double? unpaidLeavePerDay,
  String? benefitTemplateId,
  dynamic benefitTemplate,
  String? accountTitle,
  String? bankName,
  String? accountNumber,
  dynamic swiftCode,
  String? systemUserId,
  dynamic systemUser,
  dynamic createdById,
  dynamic createdBy,
  String? createdAtUtc,
  String? updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => OnBehalf(  employeeId: employeeId ?? _employeeId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  placeOfBirth: placeOfBirth ?? _placeOfBirth,
  maritalStatus: maritalStatus ?? _maritalStatus,
  email: email ?? _email,
  phone: phone ?? _phone,
  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  city: city ?? _city,
  stateProvince: stateProvince ?? _stateProvince,
  zipCode: zipCode ?? _zipCode,
  country: country ?? _country,
  employeeIDNumber: employeeIDNumber ?? _employeeIDNumber,
  designationId: designationId ?? _designationId,
  designation: designation ?? _designation,
  departmentId: departmentId ?? _departmentId,
  department: department ?? _department,
  joiningDate: joiningDate ?? _joiningDate,
  leavingDate: leavingDate ?? _leavingDate,
  supervisorId: supervisorId ?? _supervisorId,
  supervisor: supervisor ?? _supervisor,
  annualLeaves: annualLeaves ?? _annualLeaves,
  basicSalary: basicSalary ?? _basicSalary,
  unpaidLeavePerDay: unpaidLeavePerDay ?? _unpaidLeavePerDay,
  benefitTemplateId: benefitTemplateId ?? _benefitTemplateId,
  benefitTemplate: benefitTemplate ?? _benefitTemplate,
  accountTitle: accountTitle ?? _accountTitle,
  bankName: bankName ?? _bankName,
  accountNumber: accountNumber ?? _accountNumber,
  swiftCode: swiftCode ?? _swiftCode,
  systemUserId: systemUserId ?? _systemUserId,
  systemUser: systemUser ?? _systemUser,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get employeeId => _employeeId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get dateOfBirth => _dateOfBirth;
  String? get placeOfBirth => _placeOfBirth;
  String? get maritalStatus => _maritalStatus;
  String? get email => _email;
  String? get phone => _phone;
  String? get address1 => _address1;
  dynamic get address2 => _address2;
  String? get city => _city;
  String? get stateProvince => _stateProvince;
  String? get zipCode => _zipCode;
  String? get country => _country;
  String? get employeeIDNumber => _employeeIDNumber;
  String? get designationId => _designationId;
  dynamic get designation => _designation;
  String? get departmentId => _departmentId;
  dynamic get department => _department;
  String? get joiningDate => _joiningDate;
  dynamic get leavingDate => _leavingDate;
  String? get supervisorId => _supervisorId;
  dynamic get supervisor => _supervisor;
  int? get annualLeaves => _annualLeaves;
  double? get basicSalary => _basicSalary;
  double? get unpaidLeavePerDay => _unpaidLeavePerDay;
  String? get benefitTemplateId => _benefitTemplateId;
  dynamic get benefitTemplate => _benefitTemplate;
  String? get accountTitle => _accountTitle;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  dynamic get swiftCode => _swiftCode;
  String? get systemUserId => _systemUserId;
  dynamic get systemUser => _systemUser;
  dynamic get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  String? get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['gender'] = _gender;
    map['dateOfBirth'] = _dateOfBirth;
    map['placeOfBirth'] = _placeOfBirth;
    map['maritalStatus'] = _maritalStatus;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['city'] = _city;
    map['stateProvince'] = _stateProvince;
    map['zipCode'] = _zipCode;
    map['country'] = _country;
    map['employeeIDNumber'] = _employeeIDNumber;
    map['designationId'] = _designationId;
    map['designation'] = _designation;
    map['departmentId'] = _departmentId;
    map['department'] = _department;
    map['joiningDate'] = _joiningDate;
    map['leavingDate'] = _leavingDate;
    map['supervisorId'] = _supervisorId;
    map['supervisor'] = _supervisor;
    map['annualLeaves'] = _annualLeaves;
    map['basicSalary'] = _basicSalary;
    map['unpaidLeavePerDay'] = _unpaidLeavePerDay;
    map['benefitTemplateId'] = _benefitTemplateId;
    map['benefitTemplate'] = _benefitTemplate;
    map['accountTitle'] = _accountTitle;
    map['bankName'] = _bankName;
    map['accountNumber'] = _accountNumber;
    map['swiftCode'] = _swiftCode;
    map['systemUserId'] = _systemUserId;
    map['systemUser'] = _systemUser;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}

/// todoTypeId : "997dfa0e-2ee1-4d28-a2c7-50b627e280e6"
/// name : "Büro"
/// description : ""
/// createdById : null
/// createdBy : null
/// createdAtUtc : "0001-01-01T00:00:00"
/// updatedById : null
/// updatedBy : null
/// updatedAtUtc : "0001-01-01T00:00:00"

TodoType todoTypeFromJson(String str) => TodoType.fromJson(json.decode(str));
String todoTypeToJson(TodoType data) => json.encode(data.toJson());
class TodoType {
  TodoType({
      String? todoTypeId, 
      String? name, 
      String? description, 
      dynamic createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      dynamic updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _todoTypeId = todoTypeId;
    _name = name;
    _description = description;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  TodoType.fromJson(dynamic json) {
    _todoTypeId = json['todoTypeId'];
    _name = json['name'];
    _description = json['description'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _todoTypeId;
  String? _name;
  String? _description;
  dynamic _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  dynamic _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
TodoType copyWith({  String? todoTypeId,
  String? name,
  String? description,
  dynamic createdById,
  dynamic createdBy,
  String? createdAtUtc,
  dynamic updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => TodoType(  todoTypeId: todoTypeId ?? _todoTypeId,
  name: name ?? _name,
  description: description ?? _description,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get todoTypeId => _todoTypeId;
  String? get name => _name;
  String? get description => _description;
  dynamic get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  dynamic get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['todoTypeId'] = _todoTypeId;
    map['name'] = _name;
    map['description'] = _description;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}