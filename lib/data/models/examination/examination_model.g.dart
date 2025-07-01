// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExaminationCollection on Isar {
  IsarCollection<Examination> get examinations => this.collection();
}

const ExaminationSchema = CollectionSchema(
  name: r'Examination',
  id: -3740389584940768101,
  properties: {
    r'appointmentTypes': PropertySchema(
      id: 0,
      name: r'appointmentTypes',
      type: IsarType.string,
      enumMap: _ExaminationappointmentTypesEnumValueMap,
    ),
    r'examinationDate': PropertySchema(
      id: 1,
      name: r'examinationDate',
      type: IsarType.dateTime,
    ),
    r'examinationNotes': PropertySchema(
      id: 2,
      name: r'examinationNotes',
      type: IsarType.string,
    ),
    r'nextControlTime': PropertySchema(
      id: 3,
      name: r'nextControlTime',
      type: IsarType.dateTime,
    ),
    r'patientComplaint': PropertySchema(
      id: 4,
      name: r'patientComplaint',
      type: IsarType.string,
    ),
    r'treatmentProcess': PropertySchema(
      id: 5,
      name: r'treatmentProcess',
      type: IsarType.string,
    )
  },
  estimateSize: _examinationEstimateSize,
  serialize: _examinationSerialize,
  deserialize: _examinationDeserialize,
  deserializeProp: _examinationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'doctor': LinkSchema(
      id: 7214240389414743100,
      name: r'doctor',
      target: r'Doctor',
      single: true,
      linkName: r'examinations',
    )
  },
  embeddedSchemas: {},
  getId: _examinationGetId,
  getLinks: _examinationGetLinks,
  attach: _examinationAttach,
  version: '3.1.0+1',
);

int _examinationEstimateSize(
  Examination object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.appointmentTypes;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.examinationNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.patientComplaint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.treatmentProcess;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _examinationSerialize(
  Examination object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.appointmentTypes?.name);
  writer.writeDateTime(offsets[1], object.examinationDate);
  writer.writeString(offsets[2], object.examinationNotes);
  writer.writeDateTime(offsets[3], object.nextControlTime);
  writer.writeString(offsets[4], object.patientComplaint);
  writer.writeString(offsets[5], object.treatmentProcess);
}

Examination _examinationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Examination();
  object.appointmentTypes = _ExaminationappointmentTypesValueEnumMap[
      reader.readStringOrNull(offsets[0])];
  object.examinationDate = reader.readDateTimeOrNull(offsets[1]);
  object.examinationNotes = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.nextControlTime = reader.readDateTimeOrNull(offsets[3]);
  object.patientComplaint = reader.readStringOrNull(offsets[4]);
  object.treatmentProcess = reader.readStringOrNull(offsets[5]);
  return object;
}

P _examinationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ExaminationappointmentTypesValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ExaminationappointmentTypesEnumValueMap = {
  r'ILK_MUAYENE': r'ILK_MUAYENE',
  r'KONTROL': r'KONTROL',
};
const _ExaminationappointmentTypesValueEnumMap = {
  r'ILK_MUAYENE': AppointmentTypes.ILK_MUAYENE,
  r'KONTROL': AppointmentTypes.KONTROL,
};

Id _examinationGetId(Examination object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _examinationGetLinks(Examination object) {
  return [object.doctor];
}

void _examinationAttach(
    IsarCollection<dynamic> col, Id id, Examination object) {
  object.id = id;
  object.doctor.attach(col, col.isar.collection<Doctor>(), r'doctor', id);
}

extension ExaminationQueryWhereSort
    on QueryBuilder<Examination, Examination, QWhere> {
  QueryBuilder<Examination, Examination, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExaminationQueryWhere
    on QueryBuilder<Examination, Examination, QWhereClause> {
  QueryBuilder<Examination, Examination, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Examination, Examination, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Examination, Examination, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Examination, Examination, QAfterWhereClause> idBetween(
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

extension ExaminationQueryFilter
    on QueryBuilder<Examination, Examination, QFilterCondition> {
  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appointmentTypes',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appointmentTypes',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesEqualTo(
    AppointmentTypes? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesGreaterThan(
    AppointmentTypes? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesLessThan(
    AppointmentTypes? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesBetween(
    AppointmentTypes? lower,
    AppointmentTypes? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appointmentTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appointmentTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appointmentTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      appointmentTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appointmentTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examinationDate',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examinationDate',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examinationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examinationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examinationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examinationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examinationNotes',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examinationNotes',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examinationNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examinationNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examinationNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examinationNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examinationNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examinationNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examinationNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examinationNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examinationNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      examinationNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examinationNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Examination, Examination, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Examination, Examination, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      nextControlTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextControlTime',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      nextControlTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextControlTime',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      nextControlTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextControlTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      nextControlTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextControlTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      nextControlTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextControlTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      nextControlTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextControlTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patientComplaint',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patientComplaint',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientComplaint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientComplaint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientComplaint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientComplaint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'patientComplaint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'patientComplaint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'patientComplaint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'patientComplaint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientComplaint',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      patientComplaintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'patientComplaint',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'treatmentProcess',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'treatmentProcess',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'treatmentProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'treatmentProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'treatmentProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'treatmentProcess',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'treatmentProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'treatmentProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'treatmentProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'treatmentProcess',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'treatmentProcess',
        value: '',
      ));
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition>
      treatmentProcessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'treatmentProcess',
        value: '',
      ));
    });
  }
}

extension ExaminationQueryObject
    on QueryBuilder<Examination, Examination, QFilterCondition> {}

extension ExaminationQueryLinks
    on QueryBuilder<Examination, Examination, QFilterCondition> {
  QueryBuilder<Examination, Examination, QAfterFilterCondition> doctor(
      FilterQuery<Doctor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'doctor');
    });
  }

  QueryBuilder<Examination, Examination, QAfterFilterCondition> doctorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'doctor', 0, true, 0, true);
    });
  }
}

extension ExaminationQuerySortBy
    on QueryBuilder<Examination, Examination, QSortBy> {
  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByAppointmentTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByAppointmentTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy> sortByExaminationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationDate', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByExaminationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationDate', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByExaminationNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationNotes', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByExaminationNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationNotes', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy> sortByNextControlTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextControlTime', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByNextControlTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextControlTime', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByPatientComplaint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientComplaint', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByPatientComplaintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientComplaint', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByTreatmentProcess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentProcess', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      sortByTreatmentProcessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentProcess', Sort.desc);
    });
  }
}

extension ExaminationQuerySortThenBy
    on QueryBuilder<Examination, Examination, QSortThenBy> {
  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByAppointmentTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByAppointmentTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy> thenByExaminationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationDate', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByExaminationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationDate', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByExaminationNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationNotes', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByExaminationNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examinationNotes', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy> thenByNextControlTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextControlTime', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByNextControlTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextControlTime', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByPatientComplaint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientComplaint', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByPatientComplaintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientComplaint', Sort.desc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByTreatmentProcess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentProcess', Sort.asc);
    });
  }

  QueryBuilder<Examination, Examination, QAfterSortBy>
      thenByTreatmentProcessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentProcess', Sort.desc);
    });
  }
}

extension ExaminationQueryWhereDistinct
    on QueryBuilder<Examination, Examination, QDistinct> {
  QueryBuilder<Examination, Examination, QDistinct> distinctByAppointmentTypes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appointmentTypes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Examination, Examination, QDistinct>
      distinctByExaminationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examinationDate');
    });
  }

  QueryBuilder<Examination, Examination, QDistinct> distinctByExaminationNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examinationNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Examination, Examination, QDistinct>
      distinctByNextControlTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextControlTime');
    });
  }

  QueryBuilder<Examination, Examination, QDistinct> distinctByPatientComplaint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientComplaint',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Examination, Examination, QDistinct> distinctByTreatmentProcess(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'treatmentProcess',
          caseSensitive: caseSensitive);
    });
  }
}

extension ExaminationQueryProperty
    on QueryBuilder<Examination, Examination, QQueryProperty> {
  QueryBuilder<Examination, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Examination, AppointmentTypes?, QQueryOperations>
      appointmentTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appointmentTypes');
    });
  }

  QueryBuilder<Examination, DateTime?, QQueryOperations>
      examinationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examinationDate');
    });
  }

  QueryBuilder<Examination, String?, QQueryOperations>
      examinationNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examinationNotes');
    });
  }

  QueryBuilder<Examination, DateTime?, QQueryOperations>
      nextControlTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextControlTime');
    });
  }

  QueryBuilder<Examination, String?, QQueryOperations>
      patientComplaintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientComplaint');
    });
  }

  QueryBuilder<Examination, String?, QQueryOperations>
      treatmentProcessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'treatmentProcess');
    });
  }
}
