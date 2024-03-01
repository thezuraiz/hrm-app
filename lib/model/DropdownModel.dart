import 'dart:convert';
/// data : [{"disabled":false,"group":null,"selected":false,"text":"EMPSLS004 Hilda Haynes","value":"19cc0518-b993-4f8f-901b-85c4068e7faa"}]
/// isSuccess : true

DropdownModel dropdownModelFromJson(String str) => DropdownModel.fromJson(json.decode(str));
String dropdownModelToJson(DropdownModel data) => json.encode(data.toJson());
class DropdownModel {
  DropdownModel({
      List<Data>? data, 
      bool? isSuccess,}){
    _data = data;
    _isSuccess = isSuccess;
}

  DropdownModel.fromJson(dynamic json) {
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
DropdownModel copyWith({  List<Data>? data,
  bool? isSuccess,
}) => DropdownModel(  data: data ?? _data,
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

/// disabled : false
/// group : null
/// selected : false
/// text : "EMPSLS004 Hilda Haynes"
/// value : "19cc0518-b993-4f8f-901b-85c4068e7faa"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      bool? disabled, 
      dynamic group, 
      bool? selected, 
      String? text, 
      String? value,}){
    _disabled = disabled;
    _group = group;
    _selected = selected;
    _text = text;
    _value = value;
}

  Data.fromJson(dynamic json) {
    _disabled = json['disabled'];
    _group = json['group'];
    _selected = json['selected'];
    _text = json['text'];
    _value = json['value'];
  }
  bool? _disabled;
  dynamic _group;
  bool? _selected;
  String? _text;
  String? _value;
Data copyWith({  bool? disabled,
  dynamic group,
  bool? selected,
  String? text,
  String? value,
}) => Data(  disabled: disabled ?? _disabled,
  group: group ?? _group,
  selected: selected ?? _selected,
  text: text ?? _text,
  value: value ?? _value,
);
  bool? get disabled => _disabled;
  dynamic get group => _group;
  bool? get selected => _selected;
  String? get text => _text;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['disabled'] = _disabled;
    map['group'] = _group;
    map['selected'] = _selected;
    map['text'] = _text;
    map['value'] = _value;
    return map;
  }

}