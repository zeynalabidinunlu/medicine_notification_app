// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppointmentCollection on Isar {
  IsarCollection<Appointment> get appointments => this.collection();
}

const AppointmentSchema = CollectionSchema(
  name: r'Appointment',
  id: 2680450406379222733,
  properties: {
    r'appointmentDate': PropertySchema(
      id: 0,
      name: r'appointmentDate',
      type: IsarType.dateTime,
    ),
    r'appointmentNotes': PropertySchema(
      id: 1,
      name: r'appointmentNotes',
      type: IsarType.string,
    ),
    r'appointmentTypes': PropertySchema(
      id: 2,
      name: r'appointmentTypes',
      type: IsarType.string,
      enumMap: _AppointmentappointmentTypesEnumValueMap,
    ),
    r'clinic': PropertySchema(
      id: 3,
      name: r'clinic',
      type: IsarType.string,
    ),
    r'hospitalName': PropertySchema(
      id: 4,
      name: r'hospitalName',
      type: IsarType.string,
    )
  },
  estimateSize: _appointmentEstimateSize,
  serialize: _appointmentSerialize,
  deserialize: _appointmentDeserialize,
  deserializeProp: _appointmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'doctor': LinkSchema(
      id: -915233614246172047,
      name: r'doctor',
      target: r'Doctor',
      single: true,
      linkName: r'appointments',
    )
  },
  embeddedSchemas: {},
  getId: _appointmentGetId,
  getLinks: _appointmentGetLinks,
  attach: _appointmentAttach,
  version: '3.1.0+1',
);

int _appointmentEstimateSize(
  Appointment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.appointmentNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.appointmentTypes;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.clinic;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hospitalName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _appointmentSerialize(
  Appointment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.appointmentDate);
  writer.writeString(offsets[1], object.appointmentNotes);
  writer.writeString(offsets[2], object.appointmentTypes?.name);
  writer.writeString(offsets[3], object.clinic);
  writer.writeString(offsets[4], object.hospitalName);
}

Appointment _appointmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Appointment();
  object.appointmentDate = reader.readDateTimeOrNull(offsets[0]);
  object.appointmentNotes = reader.readStringOrNull(offsets[1]);
  object.appointmentTypes = _AppointmentappointmentTypesValueEnumMap[
      reader.readStringOrNull(offsets[2])];
  object.clinic = reader.readStringOrNull(offsets[3]);
  object.hospitalName = reader.readStringOrNull(offsets[4]);
  object.id = id;
  return object;
}

P _appointmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (_AppointmentappointmentTypesValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AppointmentappointmentTypesEnumValueMap = {
  r'ILK_MUAYENE': r'ILK_MUAYENE',
  r'KONTROL': r'KONTROL',
};
const _AppointmentappointmentTypesValueEnumMap = {
  r'ILK_MUAYENE': AppointmentTypes.ILK_MUAYENE,
  r'KONTROL': AppointmentTypes.KONTROL,
};

Id _appointmentGetId(Appointment object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _appointmentGetLinks(Appointment object) {
  return [object.doctor];
}

void _appointmentAttach(
    IsarCollection<dynamic> col, Id id, Appointment object) {
  object.id = id;
  object.doctor.attach(col, col.isar.collection<Doctor>(), r'doctor', id);
}

extension AppointmentQueryWhereSort
    on QueryBuilder<Appointment, Appointment, QWhere> {
  QueryBuilder<Appointment, Appointment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppointmentQueryWhere
    on QueryBuilder<Appointment, Appointment, QWhereClause> {
  QueryBuilder<Appointment, Appointment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Appointment, Appointment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterWhereClause> idBetween(
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

extension AppointmentQueryFilter
    on QueryBuilder<Appointment, Appointment, QFilterCondition> {
  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appointmentDate',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appointmentDate',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appointmentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appointmentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appointmentDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appointmentDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appointmentNotes',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appointmentNotes',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appointmentNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appointmentNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appointmentNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appointmentNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appointmentNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appointmentNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appointmentNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appointmentNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appointmentNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appointmentNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appointmentTypes',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appointmentTypes',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentTypesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appointmentTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentTypesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appointmentTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appointmentTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      appointmentTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appointmentTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clinic',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      clinicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clinic',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      clinicGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clinic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      clinicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clinic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> clinicMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clinic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      clinicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinic',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      clinicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clinic',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hospitalName',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hospitalName',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hospitalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hospitalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hospitalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hospitalName',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition>
      hospitalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hospitalName',
        value: '',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> idBetween(
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
}

extension AppointmentQueryObject
    on QueryBuilder<Appointment, Appointment, QFilterCondition> {}

extension AppointmentQueryLinks
    on QueryBuilder<Appointment, Appointment, QFilterCondition> {
  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> doctor(
      FilterQuery<Doctor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'doctor');
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterFilterCondition> doctorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'doctor', 0, true, 0, true);
    });
  }
}

extension AppointmentQuerySortBy
    on QueryBuilder<Appointment, Appointment, QSortBy> {
  QueryBuilder<Appointment, Appointment, QAfterSortBy> sortByAppointmentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentDate', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      sortByAppointmentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentDate', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      sortByAppointmentNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentNotes', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      sortByAppointmentNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentNotes', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      sortByAppointmentTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      sortByAppointmentTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> sortByClinic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinic', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> sortByClinicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinic', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> sortByHospitalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      sortByHospitalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.desc);
    });
  }
}

extension AppointmentQuerySortThenBy
    on QueryBuilder<Appointment, Appointment, QSortThenBy> {
  QueryBuilder<Appointment, Appointment, QAfterSortBy> thenByAppointmentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentDate', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      thenByAppointmentDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentDate', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      thenByAppointmentNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentNotes', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      thenByAppointmentNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentNotes', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      thenByAppointmentTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      thenByAppointmentTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appointmentTypes', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> thenByClinic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinic', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> thenByClinicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinic', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> thenByHospitalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy>
      thenByHospitalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hospitalName', Sort.desc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Appointment, Appointment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AppointmentQueryWhereDistinct
    on QueryBuilder<Appointment, Appointment, QDistinct> {
  QueryBuilder<Appointment, Appointment, QDistinct>
      distinctByAppointmentDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appointmentDate');
    });
  }

  QueryBuilder<Appointment, Appointment, QDistinct> distinctByAppointmentNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appointmentNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Appointment, Appointment, QDistinct> distinctByAppointmentTypes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appointmentTypes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Appointment, Appointment, QDistinct> distinctByClinic(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clinic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Appointment, Appointment, QDistinct> distinctByHospitalName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hospitalName', caseSensitive: caseSensitive);
    });
  }
}

extension AppointmentQueryProperty
    on QueryBuilder<Appointment, Appointment, QQueryProperty> {
  QueryBuilder<Appointment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Appointment, DateTime?, QQueryOperations>
      appointmentDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appointmentDate');
    });
  }

  QueryBuilder<Appointment, String?, QQueryOperations>
      appointmentNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appointmentNotes');
    });
  }

  QueryBuilder<Appointment, AppointmentTypes?, QQueryOperations>
      appointmentTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appointmentTypes');
    });
  }

  QueryBuilder<Appointment, String?, QQueryOperations> clinicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clinic');
    });
  }

  QueryBuilder<Appointment, String?, QQueryOperations> hospitalNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hospitalName');
    });
  }
}
