// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDoctorCollection on Isar {
  IsarCollection<Doctor> get doctors => this.collection();
}

const DoctorSchema = CollectionSchema(
  name: r'Doctor',
  id: -3811717319408390600,
  properties: {
    r'daysOff': PropertySchema(
      id: 0,
      name: r'daysOff',
      type: IsarType.string,
      enumMap: _DoctordaysOffEnumValueMap,
    ),
    r'klinik': PropertySchema(
      id: 1,
      name: r'klinik',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _doctorEstimateSize,
  serialize: _doctorSerialize,
  deserialize: _doctorDeserialize,
  deserializeProp: _doctorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'examinations': LinkSchema(
      id: -3196046261260386652,
      name: r'examinations',
      target: r'Examination',
      single: false,
    ),
    r'appointments': LinkSchema(
      id: -3575633951955174101,
      name: r'appointments',
      target: r'Appointment',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _doctorGetId,
  getLinks: _doctorGetLinks,
  attach: _doctorAttach,
  version: '3.1.0+1',
);

int _doctorEstimateSize(
  Doctor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.daysOff;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.klinik;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _doctorSerialize(
  Doctor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.daysOff?.name);
  writer.writeString(offsets[1], object.klinik);
  writer.writeString(offsets[2], object.name);
}

Doctor _doctorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Doctor();
  object.daysOff =
      _DoctordaysOffValueEnumMap[reader.readStringOrNull(offsets[0])];
  object.id = id;
  object.klinik = reader.readStringOrNull(offsets[1]);
  object.name = reader.readStringOrNull(offsets[2]);
  return object;
}

P _doctorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DoctordaysOffValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DoctordaysOffEnumValueMap = {
  r'PAZARTESI': r'PAZARTESI',
  r'SALI': r'SALI',
  r'CARSAMBA': r'CARSAMBA',
  r'PERSEMBE': r'PERSEMBE',
  r'CUMA': r'CUMA',
  r'CUMARTESI': r'CUMARTESI',
  r'PAZAR': r'PAZAR',
};
const _DoctordaysOffValueEnumMap = {
  r'PAZARTESI': Days.PAZARTESI,
  r'SALI': Days.SALI,
  r'CARSAMBA': Days.CARSAMBA,
  r'PERSEMBE': Days.PERSEMBE,
  r'CUMA': Days.CUMA,
  r'CUMARTESI': Days.CUMARTESI,
  r'PAZAR': Days.PAZAR,
};

Id _doctorGetId(Doctor object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _doctorGetLinks(Doctor object) {
  return [object.examinations, object.appointments];
}

void _doctorAttach(IsarCollection<dynamic> col, Id id, Doctor object) {
  object.id = id;
  object.examinations
      .attach(col, col.isar.collection<Examination>(), r'examinations', id);
  object.appointments
      .attach(col, col.isar.collection<Appointment>(), r'appointments', id);
}

extension DoctorQueryWhereSort on QueryBuilder<Doctor, Doctor, QWhere> {
  QueryBuilder<Doctor, Doctor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DoctorQueryWhere on QueryBuilder<Doctor, Doctor, QWhereClause> {
  QueryBuilder<Doctor, Doctor, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DoctorQueryFilter on QueryBuilder<Doctor, Doctor, QFilterCondition> {
  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'daysOff',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'daysOff',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffEqualTo(
    Days? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysOff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffGreaterThan(
    Days? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysOff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffLessThan(
    Days? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysOff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffBetween(
    Days? lower,
    Days? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysOff',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'daysOff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'daysOff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'daysOff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'daysOff',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysOff',
        value: '',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> daysOffIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'daysOff',
        value: '',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'klinik',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'klinik',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'klinik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'klinik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'klinik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'klinik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'klinik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'klinik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'klinik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'klinik',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'klinik',
        value: '',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> klinikIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'klinik',
        value: '',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DoctorQueryObject on QueryBuilder<Doctor, Doctor, QFilterCondition> {}

extension DoctorQueryLinks on QueryBuilder<Doctor, Doctor, QFilterCondition> {
  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> examinations(
      FilterQuery<Examination> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'examinations');
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> examinationsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'examinations', length, true, length, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> examinationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'examinations', 0, true, 0, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> examinationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'examinations', 0, false, 999999, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition>
      examinationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'examinations', 0, true, length, include);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition>
      examinationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'examinations', length, include, 999999, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> examinationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'examinations', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> appointments(
      FilterQuery<Appointment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'appointments');
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> appointmentsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appointments', length, true, length, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> appointmentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appointments', 0, true, 0, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> appointmentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appointments', 0, false, 999999, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition>
      appointmentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appointments', 0, true, length, include);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition>
      appointmentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'appointments', length, include, 999999, true);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterFilterCondition> appointmentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'appointments', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DoctorQuerySortBy on QueryBuilder<Doctor, Doctor, QSortBy> {
  QueryBuilder<Doctor, Doctor, QAfterSortBy> sortByDaysOff() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysOff', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> sortByDaysOffDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysOff', Sort.desc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> sortByKlinik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'klinik', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> sortByKlinikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'klinik', Sort.desc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DoctorQuerySortThenBy on QueryBuilder<Doctor, Doctor, QSortThenBy> {
  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByDaysOff() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysOff', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByDaysOffDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysOff', Sort.desc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByKlinik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'klinik', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByKlinikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'klinik', Sort.desc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Doctor, Doctor, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DoctorQueryWhereDistinct on QueryBuilder<Doctor, Doctor, QDistinct> {
  QueryBuilder<Doctor, Doctor, QDistinct> distinctByDaysOff(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysOff', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Doctor, Doctor, QDistinct> distinctByKlinik(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'klinik', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Doctor, Doctor, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension DoctorQueryProperty on QueryBuilder<Doctor, Doctor, QQueryProperty> {
  QueryBuilder<Doctor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Doctor, Days?, QQueryOperations> daysOffProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysOff');
    });
  }

  QueryBuilder<Doctor, String?, QQueryOperations> klinikProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'klinik');
    });
  }

  QueryBuilder<Doctor, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
