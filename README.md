# 워크캘린더 (공수달력) 프로젝트

## 프로젝트 개요

**제작기간:** 2407년 01월 ~ 2408년 22일 (약 2개월)

이 프로젝트는 건설현장 노동자들의 근무 일정을 관리하고, 그에 따른 일당 및 근무 기록을 효과적으로 추적할 수 있도록 돕는 워크캘린더(공수달력) 애플리케이션입니다.

## 주요 기능

- **목표금액 설정 및 관리:** 사용자가 목표금액을 설정하면, 목표 금액까지 남은 공수를 계산하고 보여줍니다.
- **실업급여 조건 산정:** 사용자의 근로 기록을 바탕으로 실업급여 수급 조건 충족 여부를 산정합니다.
- **공수 내용 시각화:** 해당 달의 공수 내용을 원형 그래프로 시각화하여 쉽게 이해할 수 있도록 합니다.

## 사용된 주요 패키지

- **[riveprod](https://pub.dev/packages/riverpod)**
- **[isar](https://pub.dev/packages/isar)**
- **[flutter_formz](https://pub.dev/packages/flutter_formz)**
- **[table_calendar](https://pub.dev/packages/table_calendar)**

## 기능 구현 주요 이슈 및 해결책

### 1. Table Calendar의 상태 변경 문제

**문제점:** `table_calendar` 패키지에서 상태 변경이 `setState`나 `dispose` 메서드로 이루어지지 않음. 대신 `focusdDay`와 `selectedDay` 프로퍼티들이 어떤 `DateTime` 값을 받느냐에 따라 상태가 변경됩니다.

**해결책:**  
CRUD 작업 후 지정된 `DateTime` 값의 하루 뒤 시점을 `focusdDay`와 `selectedDay`에 주입하여 상태를 변경시킴으로써 문제를 해결했습니다.

### 2. Isar에 데이터 저장 후 UI 상태 변경 문제

**문제점:**  
데이터를 저장하고 갱신한 후 이를 캘린더 UI에 반영하는 과정에서 여러 작업이 병렬적으로 처리되어야 하는 어려움이 있었습니다.

**해결책:**
- `addHistory`에서 데이터 추가
- `calendarProvider`에서 `Map<DateTime, List<workHistory>>` 타입으로 변경 후 `markerbuilder`에 전달
- `refresh`를 통해 history 데이터 갱신
- `focusdDay`, `selectedDay` 데이터 갱신 (UI 변경 목적)
- `numericalSourceModelProvider`를 통해 history 데이터와 contract 데이터에서 얻은 정보를 계산하여 UI에 반영

이 과정에서 병렬 처리의 어려움을 해결하기 위해 `Future.delay`를 사용하여 각 기능에 딜레이를 추가했습니다.

## 상태 관리에 대한 고찰

**Riverpod 사용 이유:**
- `bloc`, `provider`와 달리 상태 관리가 전역적으로 이루어져 편리할 것으로 판단했습니다.
- 이전 프로젝트에서 `getx`를 사용했을 때 `view` 구현 시 `context`에 따라 view가 제대로 구현되지 않는 어려움을 겪었습니다.

**문제점:**
- `riverpod` 구현 시 `view` 단에 불필요한 코드가 많아지는 것을 발견했습니다. 특히 `formz`의 `formState`에 따른 UI 관리 부분을 `ref.listen`으로 구현했는데, 이 부분이 반드시 `view`에서 코딩되어야 하는지에 대한 의문이 들었습니다.
- `ref.watch`로 모든 상태 구현이 UI로 갱신될 것으로 예상했으나, 별도로 `refresh`를 사용해야 하는 코드가 발생했습니다.

## 추가할 기능

- **건설 근로공제회 퇴직금 산정 기능 추가 예정**
- **QR 코드 연동:** `isar` 패키지 정보를 QR 코드에 담아, 스캐너로 스캔 시 데이터가 이동될 수 있는지 검토 후 추가할 계획입니다.


