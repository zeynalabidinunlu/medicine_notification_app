// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicineCollection on Isar {
  IsarCollection<Medicine> get medicines => this.collection();
}

const MedicineSchema = CollectionSchema(
  name: r'Medicine',
  id: 284787057740778982,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'hungerSituation': PropertySchema(
      id: 1,
      name: r'hungerSituation',
      type: IsarType.string,
      enumMap: _MedicinehungerSituationEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'notificationText': PropertySchema(
      id: 3,
      name: r'notificationText',
      type: IsarType.string,
    ),
    r'numberOfPills': PropertySchema(
      id: 4,
      name: r'numberOfPills',
      type: IsarType.long,
    ),
    r'reminderTimes': PropertySchema(
      id: 5,
      name: r'reminderTimes',
      type: IsarType.dateTimeList,
    ),
    r'usageTypes': PropertySchema(
      id: 6,
      name: r'usageTypes',
      type: IsarType.string,
      enumMap: _MedicineusageTypesEnumValueMap,
    )
  },
  estimateSize: _medicineEstimateSize,
  serialize: _medicineSerialize,
  deserialize: _medicineDeserialize,
  deserializeProp: _medicineDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medicineGetId,
  getLinks: _medicineGetLinks,
  attach: _medicineAttach,
  version: '3.1.0+1',
);

int _medicineEstimateSize(
  Medicine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hungerSituation;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notificationText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reminderTimes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.usageTypes;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _medicineSerialize(
  Medicine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeString(offsets[1], object.hungerSituation?.name);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.notificationText);
  writer.writeLong(offsets[4], object.numberOfPills);
  writer.writeDateTimeList(offsets[5], object.reminderTimes);
  writer.writeString(offsets[6], object.usageTypes?.name);
}

Medicine _medicineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Medicine();
  object.description = reader.readStringOrNull(offsets[0]);
  object.hungerSituation =
      _MedicinehungerSituationValueEnumMap[reader.readStringOrNull(offsets[1])];
  object.id = id;
  object.name = reader.readStringOrNull(offsets[2]);
  object.notificationText = reader.readStringOrNull(offsets[3]);
  object.numberOfPills = reader.readLongOrNull(offsets[4]);
  object.reminderTimes = reader.readDateTimeList(offsets[5]);
  object.usageTypes =
      _MedicineusageTypesValueEnumMap[reader.readStringOrNull(offsets[6])];
  return object;
}

P _medicineDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_MedicinehungerSituationValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeList(offset)) as P;
    case 6:
      return (_MedicineusageTypesValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MedicinehungerSituationEnumValueMap = {
  r'AC': r'AC',
  r'TOK': r'TOK',
};
const _MedicinehungerSituationValueEnumMap = {
  r'AC': HungerSituation.AC,
  r'TOK': HungerSituation.TOK,
};
const _MedicineusageTypesEnumValueMap = {
  r'SABAH': r'SABAH',
  r'OGLE': r'OGLE',
  r'AKSAM': r'AKSAM',
};
const _MedicineusageTypesValueEnumMap = {
  r'SABAH': UsageTypes.SABAH,
  r'OGLE': UsageTypes.OGLE,
  r'AKSAM': UsageTypes.AKSAM,
};

Id _medicineGetId(Medicine object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _medicineGetLinks(Medicine object) {
  return [];
}

void _medicineAttach(IsarCollection<dynamic> col, Id id, Medicine object) {
  object.id = id;
}

extension MedicineQueryWhereSort on QueryBuilder<Medicine, Medicine, QWhere> {
  QueryBuilder<Medicine, Medicine, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicineQueryWhere on QueryBuilder<Medicine, Medicine, QWhereClause> {
  QueryBuilder<Medicine, Medicine, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Medicine, Medicine, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterWhereClause> idBetween(
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

extension MedicineQueryFilter
    on QueryBuilder<Medicine, Medicine, QFilterCondition> {
  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hungerSituation',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hungerSituation',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationEqualTo(
    HungerSituation? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hungerSituation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationGreaterThan(
    HungerSituation? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hungerSituation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationLessThan(
    HungerSituation? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hungerSituation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationBetween(
    HungerSituation? lower,
    HungerSituation? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hungerSituation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hungerSituation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hungerSituation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hungerSituation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hungerSituation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hungerSituation',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      hungerSituationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hungerSituation',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notificationText',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notificationText',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notificationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notificationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notificationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notificationText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationText',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      notificationTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notificationText',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      numberOfPillsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numberOfPills',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      numberOfPillsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numberOfPills',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> numberOfPillsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfPills',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      numberOfPillsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfPills',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> numberOfPillsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfPills',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> numberOfPillsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfPills',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reminderTimes',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reminderTimes',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reminderTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reminderTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reminderTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reminderTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderTimes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderTimes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderTimes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderTimes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderTimes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      reminderTimesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderTimes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usageTypes',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      usageTypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usageTypes',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesEqualTo(
    UsageTypes? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesGreaterThan(
    UsageTypes? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesLessThan(
    UsageTypes? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesBetween(
    UsageTypes? lower,
    UsageTypes? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usageTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usageTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition> usageTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterFilterCondition>
      usageTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usageTypes',
        value: '',
      ));
    });
  }
}

extension MedicineQueryObject
    on QueryBuilder<Medicine, Medicine, QFilterCondition> {}

extension MedicineQueryLinks
    on QueryBuilder<Medicine, Medicine, QFilterCondition> {}

extension MedicineQuerySortBy on QueryBuilder<Medicine, Medicine, QSortBy> {
  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByHungerSituation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hungerSituation', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByHungerSituationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hungerSituation', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByNotificationText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationText', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByNotificationTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationText', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByNumberOfPills() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfPills', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByNumberOfPillsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfPills', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByUsageTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageTypes', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> sortByUsageTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageTypes', Sort.desc);
    });
  }
}

extension MedicineQuerySortThenBy
    on QueryBuilder<Medicine, Medicine, QSortThenBy> {
  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByHungerSituation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hungerSituation', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByHungerSituationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hungerSituation', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByNotificationText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationText', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByNotificationTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationText', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByNumberOfPills() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfPills', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByNumberOfPillsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfPills', Sort.desc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByUsageTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageTypes', Sort.asc);
    });
  }

  QueryBuilder<Medicine, Medicine, QAfterSortBy> thenByUsageTypesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageTypes', Sort.desc);
    });
  }
}

extension MedicineQueryWhereDistinct
    on QueryBuilder<Medicine, Medicine, QDistinct> {
  QueryBuilder<Medicine, Medicine, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medicine, Medicine, QDistinct> distinctByHungerSituation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hungerSituation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medicine, Medicine, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medicine, Medicine, QDistinct> distinctByNotificationText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medicine, Medicine, QDistinct> distinctByNumberOfPills() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberOfPills');
    });
  }

  QueryBuilder<Medicine, Medicine, QDistinct> distinctByReminderTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderTimes');
    });
  }

  QueryBuilder<Medicine, Medicine, QDistinct> distinctByUsageTypes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageTypes', caseSensitive: caseSensitive);
    });
  }
}

extension MedicineQueryProperty
    on QueryBuilder<Medicine, Medicine, QQueryProperty> {
  QueryBuilder<Medicine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Medicine, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Medicine, HungerSituation?, QQueryOperations>
      hungerSituationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hungerSituation');
    });
  }

  QueryBuilder<Medicine, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Medicine, String?, QQueryOperations> notificationTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationText');
    });
  }

  QueryBuilder<Medicine, int?, QQueryOperations> numberOfPillsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberOfPills');
    });
  }

  QueryBuilder<Medicine, List<DateTime>?, QQueryOperations>
      reminderTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderTimes');
    });
  }

  QueryBuilder<Medicine, UsageTypes?, QQueryOperations> usageTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageTypes');
    });
  }
}
