# 워크캘린더 (공수달력) 프로젝트

## 프로젝트 개요

**제작기간:** 2407년 01월 ~ 2408년 22일 (약 2개월)

이 프로젝트는 건설현장 노동자들의 근무 일정을 관리하고, 그에 따른 일당 및 근무 기록을 효과적으로 추적할 수 있도록 돕는 워크캘린더(공수달력) 애플리케이션입니다.

### **사용 목적**

- 사용자가 당일 일당을 입력하면, 해당 월의 총 공수(근로시간), 세후 계산 금액, 출근일수 등을 보여줍니다.
- 매월 급여날 관리사무소에서 제공하는 공수 기록과 비교하여 정확한 급여를 산정할 수 있도록 돕습니다.

### **다른 앱들과의 차이점**

- **목표 금액 비교:** 목표 금액을 설정하고, 해당 금액까지 남은 공수를 계산하여 보여줍니다.
- **실업급여 조건 산정:** 실업급여 조건에 충족되는지 여부를 자동으로 계산합니다.
- **공수 시각화:** 해당 월의 공수 내용을 원형 그래프로 시각화하여, 경쟁 앱 대비 가시성을 크게 개선하였습니다.

## **사용된 주요 패키지**

- **[riveprod](https://pub.dev/packages/riverpod)**
- **[isar](https://pub.dev/packages/isar)**
- **[flutter_formz](https://pub.dev/packages/flutter_formz)**
- **[table_calendar](https://pub.dev/packages/table_calendar)**

## **파일 구조 설명**

### **Repository**

- **`calculate_day`:** 근로 일수 및 주휴일수를 계산합니다. (주휴일수는 15시간 이상 근로 시 1일 추가)
- **`calendar_time_controller`:** `table_calendar`의 `markerbuilder` 상태를 변경하기 위해 `selectedDay`와 `focusedDay`를 1일 뒤로 변경하여 캘린더 상태를 조작합니다.
- **`formz_decimal`:** 근무 형태를 직접 입력 시, 숫자로 공수를 기재하면 `formState`의 상태를 변경합니다.
- **`formz_deletion`:** 모든 근무 데이터를 삭제하려면 'Delete file'을 직접 입력해야 하며, 입력된 값의 유효성을 검사합니다. `FormzStatus.submissionSuccess` 상태가 되면 지문 아이콘 버튼이 활성화되며 `isar.clear()` 메서드를 통해 데이터를 삭제할 수 있습니다.
- **`formz_model`:** 근로 조건 입력 시, 입력된 값에 대한 유효성을 검사합니다.
- **`isar_database`:** `isar` 패키지를 활용한 CRUD 작업을 수행합니다.

### **View Model**

- **`calendar_event_model`:** `calendarHistory`를 `map<DateTime, List<workHistory>>` 타입으로 변환하여 캘린더 위젯에 전달, UI를 갱신합니다.
- **`filted_source_model`:** `workHistory`와 `contract`에서 얻은 데이터를 기반으로 모든 인스턴스를 갱신하여 UI에 반영합니다.
- **`contract_model`:** 필요한 데이터를 인스턴스화하여 `update_dialog`의 버튼 UI에 사용됩니다.
- **`formz_decimal_model`:** 근무 형태를 직접 입력함에 따라 유효성 검사를 통해 UI 상태를 변경, 사용자가 인지할 수 있도록 합니다.
- **`formz_deletion_model`:** 모든 근무 데이터를 삭제할 때, 'Delete file' 입력의 유효성 여부에 따라 UI에 반영합니다.
- **`formz_menager_model`:** 근로 조건 입력 시, 유효성 상태를 쉽게 인지할 수 있도록 문자 형태로 UI에 나타냅니다.
- **`history_model`:** `workHistory`에 대한 CRUD 작업을 처리하며, 비즈니스 로직을 추가합니다. (View와 직접적인 연관 없음)

### **View UI**

- **`calendar`:** 캘린더 위젯을 구현합니다.
- **`chart`:** `main_screen` 하부에 그래프와 텍스트를 컨테이너 내에 포함시켜 보여줍니다.
- **`container`:** `workHistory` 상태에 따라 UI에 표시되는 컨테이너를 구현합니다.
- **`erase_dialog`:** 데이터 삭제 UI를 구현합니다.
- **`input_dialog`:** 근로 조건 등록에 대한 UI를 구현합니다.
- **`minor_issue`:** 리액티브하지 않은 단순한 UI 위젯들을 모아놓습니다.
- **`screen`:** 메인 화면을 구현합니다.
- **`update_dialog`:** 근로 등록에 관련된 UI를 전반적으로 구현합니다.

## **기능 구현 주요 이슈 및 해결책**

### 1. **Table Calendar의 상태 변경 문제**

**문제점:**  
`table_calendar` 패키지의 상태 변경은 `setState`나 `dispose` 메서드가 아닌, `focusdDay`와 `selectedDay` 프로퍼티들이 어떤 `DateTime` 값을 받느냐에 따라 이루어집니다.

**해결책:**  
CRUD 작업 후, `focusdDay`와 `selectedDay`에 지정된 `DateTime` 값의 하루 뒤 시점을 주입하여 상태를 변경시킵니다.

### 2. **Isar에 데이터 저장 후 UI 상태 변경 문제**

**문제점:**  
데이터를 저장하고 갱신한 후, 이를 캘린더 UI에 반영하는 과정에서 여러 작업이 병렬적으로 처리되어야 하는 어려움이 있었습니다.

**해결책:**
1. `addHistory`에서 데이터 추가
2. `calendarProvider`에서 `map<DateTime, List<workHistory>>` 타입으로 변경 후 `markerbuilder`에 전달
3. `refresh`를 통해 history 데이터 갱신
4. `focusdDay`, `selectedDay` 데이터 갱신 (UI 변경 목적)
5. `numericalSourceModelProvider`를 통해 history 데이터와 contract 데이터에서 얻은 정보를 계산하여 UI에 반영

이 과정에서 병렬 처리의 어려움을 해결하기 위해 `Future.delay`를 사용하여 각 기능에 딜레이를 추가했습니다.

## **상태 관리에 대한 고찰**

**Riverpod 사용 이유:**
- `bloc`, `provider`와 달리 상태 관리가 전역적으로 이루어져 편리할 것으로 판단했습니다.
- 이전 프로젝트에서 `getx`를 사용했을 때, `view` 구현 시 `context`에 따라 view가 제대로 구현되지 않는 어려움을 겪었습니다.

**문제점:**
- `riverpod` 구현 시 `view` 단에 불필요한 코드가 많아지는 것을 발견했습니다. 특히 `formz`의 `formState`에 따른 UI 관리 부분을 `ref.listen`으로 구현했는데, 이 부분이 반드시 `view`에서 코딩되어야 하는지에 대한 의문이 들었습니다.
- `ref.watch`로 모든 상태 구현이 UI로 갱신될 것으로 예상했으나, 별도로 `refresh`를 사용해야 하는 코드가 발생했습니다.

## **추가할 기능**

- **건설 근로공제회 퇴직금 산정 기능 추가 예정**
- **QR 코드 연동:** `isar` 패키지 정보를 QR 코드에 담아, 스캐너로 스캔 시 데이터가 이동될 수 있는지 검토 후 추가할 계획입니다.



