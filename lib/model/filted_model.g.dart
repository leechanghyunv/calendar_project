// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filted_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FiltedModelImpl _$$FiltedModelImplFromJson(Map<String, dynamic> json) =>
    _$FiltedModelImpl(
      workDay: (json['workDay'] as num?)?.toInt() ?? 0,
      workDaynMonth: (json['workDaynMonth'] as num?)?.toInt() ?? 0,
      totalPay: (json['totalPay'] as num?)?.toInt() ?? 0,
      totalPaynMonth: (json['totalPaynMonth'] as num?)?.toInt() ?? 0,
      workRecode: (json['workRecode'] as num?)?.toDouble() ?? 0.0,
      workRecodenMonth: (json['workRecodenMonth'] as num?)?.toDouble() ?? 0.0,
      normalPay: (json['normalPay'] as num?)?.toDouble() ?? 0.0,
      extendPay: (json['extendPay'] as num?)?.toDouble() ?? 0.0,
      nightPay: (json['nightPay'] as num?)?.toDouble() ?? 0.0,
      normalDay: (json['normalDay'] as num?)?.toInt() ?? 0,
      extendDay: (json['extendDay'] as num?)?.toInt() ?? 0,
      nightDay: (json['nightDay'] as num?)?.toInt() ?? 0,
      goalRate: (json['goalRate'] as num?)?.toDouble() ?? 0.0,
      afterTaxTotal: (json['afterTaxTotal'] as num?)?.toDouble() ?? 0.0,
      afterTaxMonth: (json['afterTaxMonth'] as num?)?.toDouble() ?? 0.0,
      normalPercent: (json['normalPercent'] as num?)?.toDouble() ?? 0.0,
      extendPercent: (json['extendPercent'] as num?)?.toDouble() ?? 0.0,
      nightPercent: (json['nightPercent'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$FiltedModelImplToJson(_$FiltedModelImpl instance) =>
    <String, dynamic>{
      'workDay': instance.workDay,
      'workDaynMonth': instance.workDaynMonth,
      'totalPay': instance.totalPay,
      'totalPaynMonth': instance.totalPaynMonth,
      'workRecode': instance.workRecode,
      'workRecodenMonth': instance.workRecodenMonth,
      'normalPay': instance.normalPay,
      'extendPay': instance.extendPay,
      'nightPay': instance.nightPay,
      'normalDay': instance.normalDay,
      'extendDay': instance.extendDay,
      'nightDay': instance.nightDay,
      'goalRate': instance.goalRate,
      'afterTaxTotal': instance.afterTaxTotal,
      'afterTaxMonth': instance.afterTaxMonth,
      'normalPercent': instance.normalPercent,
      'extendPercent': instance.extendPercent,
      'nightPercent': instance.nightPercent,
    };
