// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBloodPressureCollection on Isar {
  IsarCollection<BloodPressure> get bloodPressures => this.collection();
}

const BloodPressureSchema = CollectionSchema(
  name: r'BloodPressure',
  id: 3877720761352349416,
  properties: {
    r'diastolic': PropertySchema(
      id: 0,
      name: r'diastolic',
      type: IsarType.double,
    ),
    r'measurementDate': PropertySchema(
      id: 1,
      name: r'measurementDate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(
      id: 2,
      name: r'notes',
      type: IsarType.string,
    ),
    r'pulse': PropertySchema(
      id: 3,
      name: r'pulse',
      type: IsarType.double,
    ),
    r'systolic': PropertySchema(
      id: 4,
      name: r'systolic',
      type: IsarType.double,
    )
  },
  estimateSize: _bloodPressureEstimateSize,
  serialize: _bloodPressureSerialize,
  deserialize: _bloodPressureDeserialize,
  deserializeProp: _bloodPressureDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bloodPressureGetId,
  getLinks: _bloodPressureGetLinks,
  attach: _bloodPressureAttach,
  version: '3.1.0+1',
);

int _bloodPressureEstimateSize(
  BloodPressure object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _bloodPressureSerialize(
  BloodPressure object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.diastolic);
  writer.writeDateTime(offsets[1], object.measurementDate);
  writer.writeString(offsets[2], object.notes);
  writer.writeDouble(offsets[3], object.pulse);
  writer.writeDouble(offsets[4], object.systolic);
}

BloodPressure _bloodPressureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BloodPressure();
  object.diastolic = reader.readDoubleOrNull(offsets[0]);
  object.id = id;
  object.measurementDate = reader.readDateTimeOrNull(offsets[1]);
  object.notes = reader.readStringOrNull(offsets[2]);
  object.pulse = reader.readDoubleOrNull(offsets[3]);
  object.systolic = reader.readDoubleOrNull(offsets[4]);
  return object;
}

P _bloodPressureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bloodPressureGetId(BloodPressure object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _bloodPressureGetLinks(BloodPressure object) {
  return [];
}

void _bloodPressureAttach(
    IsarCollection<dynamic> col, Id id, BloodPressure object) {
  object.id = id;
}

extension BloodPressureQueryWhereSort
    on QueryBuilder<BloodPressure, BloodPressure, QWhere> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BloodPressureQueryWhere
    on QueryBuilder<BloodPressure, BloodPressure, QWhereClause> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idBetween(
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

extension BloodPressureQueryFilter
    on QueryBuilder<BloodPressure, BloodPressure, QFilterCondition> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diastolic',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diastolic',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diastolic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diastolic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diastolic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diastolic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      measurementDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'measurementDate',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      measurementDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'measurementDate',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      measurementDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measurementDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      measurementDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measurementDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      measurementDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measurementDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      measurementDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measurementDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pulse',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pulse',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pulse',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pulse',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pulse',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pulse',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systolic',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systolic',
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systolic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systolic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systolic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systolic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BloodPressureQueryObject
    on QueryBuilder<BloodPressure, BloodPressure, QFilterCondition> {}

extension BloodPressureQueryLinks
    on QueryBuilder<BloodPressure, BloodPressure, QFilterCondition> {}

extension BloodPressureQuerySortBy
    on QueryBuilder<BloodPressure, BloodPressure, QSortBy> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByDiastolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortByDiastolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortByMeasurementDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementDate', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortByMeasurementDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementDate', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByPulse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByPulseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortBySystolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortBySystolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.desc);
    });
  }
}

extension BloodPressureQuerySortThenBy
    on QueryBuilder<BloodPressure, BloodPressure, QSortThenBy> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByDiastolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenByDiastolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenByMeasurementDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementDate', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenByMeasurementDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementDate', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByPulse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByPulseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenBySystolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenBySystolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.desc);
    });
  }
}

extension BloodPressureQueryWhereDistinct
    on QueryBuilder<BloodPressure, BloodPressure, QDistinct> {
  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByDiastolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diastolic');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct>
      distinctByMeasurementDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measurementDate');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByPulse() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pulse');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctBySystolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systolic');
    });
  }
}

extension BloodPressureQueryProperty
    on QueryBuilder<BloodPressure, BloodPressure, QQueryProperty> {
  QueryBuilder<BloodPressure, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BloodPressure, double?, QQueryOperations> diastolicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diastolic');
    });
  }

  QueryBuilder<BloodPressure, DateTime?, QQueryOperations>
      measurementDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measurementDate');
    });
  }

  QueryBuilder<BloodPressure, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<BloodPressure, double?, QQueryOperations> pulseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pulse');
    });
  }

  QueryBuilder<BloodPressure, double?, QQueryOperations> systolicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systolic');
    });
  }
}
