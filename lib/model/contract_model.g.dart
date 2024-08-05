// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLabourConditionCollection on Isar {
  IsarCollection<LabourCondition> get labourConditions => this.collection();
}

const LabourConditionSchema = CollectionSchema(
  name: r'LabourCondition',
  id: 1720796226606805726,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'extend': PropertySchema(
      id: 1,
      name: r'extend',
      type: IsarType.long,
    ),
    r'goal': PropertySchema(
      id: 2,
      name: r'goal',
      type: IsarType.long,
    ),
    r'night': PropertySchema(
      id: 3,
      name: r'night',
      type: IsarType.long,
    ),
    r'normal': PropertySchema(
      id: 4,
      name: r'normal',
      type: IsarType.long,
    ),
    r'tax': PropertySchema(
      id: 5,
      name: r'tax',
      type: IsarType.double,
    )
  },
  estimateSize: _labourConditionEstimateSize,
  serialize: _labourConditionSerialize,
  deserialize: _labourConditionDeserialize,
  deserializeProp: _labourConditionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _labourConditionGetId,
  getLinks: _labourConditionGetLinks,
  attach: _labourConditionAttach,
  version: '3.1.0+1',
);

int _labourConditionEstimateSize(
  LabourCondition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _labourConditionSerialize(
  LabourCondition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeLong(offsets[1], object.extend);
  writer.writeLong(offsets[2], object.goal);
  writer.writeLong(offsets[3], object.night);
  writer.writeLong(offsets[4], object.normal);
  writer.writeDouble(offsets[5], object.tax);
}

LabourCondition _labourConditionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LabourCondition(
    date: reader.readDateTime(offsets[0]),
    extend: reader.readLongOrNull(offsets[1]) ?? 0,
    goal: reader.readLongOrNull(offsets[2]) ?? 0,
    night: reader.readLongOrNull(offsets[3]) ?? 0,
    normal: reader.readLongOrNull(offsets[4]) ?? 0,
    tax: reader.readDoubleOrNull(offsets[5]) ?? 0.0,
  );
  object.id = id;
  return object;
}

P _labourConditionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _labourConditionGetId(LabourCondition object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _labourConditionGetLinks(LabourCondition object) {
  return [];
}

void _labourConditionAttach(
    IsarCollection<dynamic> col, Id id, LabourCondition object) {
  object.id = id;
}

extension LabourConditionQueryWhereSort
    on QueryBuilder<LabourCondition, LabourCondition, QWhere> {
  QueryBuilder<LabourCondition, LabourCondition, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LabourConditionQueryWhere
    on QueryBuilder<LabourCondition, LabourCondition, QWhereClause> {
  QueryBuilder<LabourCondition, LabourCondition, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<LabourCondition, LabourCondition, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterWhereClause> idBetween(
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

extension LabourConditionQueryFilter
    on QueryBuilder<LabourCondition, LabourCondition, QFilterCondition> {
  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      extendEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extend',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      extendGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extend',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      extendLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extend',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      extendBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extend',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      goalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goal',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      goalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goal',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      goalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goal',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      goalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      nightEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'night',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      nightGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'night',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      nightLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'night',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      nightBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'night',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      normalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'normal',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      normalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'normal',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      normalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'normal',
        value: value,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      normalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'normal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      taxEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      taxGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      taxLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterFilterCondition>
      taxBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension LabourConditionQueryObject
    on QueryBuilder<LabourCondition, LabourCondition, QFilterCondition> {}

extension LabourConditionQueryLinks
    on QueryBuilder<LabourCondition, LabourCondition, QFilterCondition> {}

extension LabourConditionQuerySortBy
    on QueryBuilder<LabourCondition, LabourCondition, QSortBy> {
  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByExtend() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extend', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      sortByExtendDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extend', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      sortByGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      sortByNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByNormal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normal', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      sortByNormalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normal', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> sortByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }
}

extension LabourConditionQuerySortThenBy
    on QueryBuilder<LabourCondition, LabourCondition, QSortThenBy> {
  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByExtend() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extend', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      thenByExtendDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extend', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      thenByGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goal', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      thenByNightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'night', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByNormal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normal', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy>
      thenByNormalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normal', Sort.desc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QAfterSortBy> thenByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }
}

extension LabourConditionQueryWhereDistinct
    on QueryBuilder<LabourCondition, LabourCondition, QDistinct> {
  QueryBuilder<LabourCondition, LabourCondition, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QDistinct> distinctByExtend() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extend');
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QDistinct> distinctByGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goal');
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QDistinct> distinctByNight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'night');
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QDistinct> distinctByNormal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'normal');
    });
  }

  QueryBuilder<LabourCondition, LabourCondition, QDistinct> distinctByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tax');
    });
  }
}

extension LabourConditionQueryProperty
    on QueryBuilder<LabourCondition, LabourCondition, QQueryProperty> {
  QueryBuilder<LabourCondition, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LabourCondition, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<LabourCondition, int, QQueryOperations> extendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extend');
    });
  }

  QueryBuilder<LabourCondition, int, QQueryOperations> goalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goal');
    });
  }

  QueryBuilder<LabourCondition, int, QQueryOperations> nightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'night');
    });
  }

  QueryBuilder<LabourCondition, int, QQueryOperations> normalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'normal');
    });
  }

  QueryBuilder<LabourCondition, double, QQueryOperations> taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tax');
    });
  }
}
