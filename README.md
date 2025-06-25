## 워크캘린더_IOS 공수어플 최고평점(ver 1.4.1)

### 📅 프로젝트 개요
건설현장 노동자들의 근무 일당(공수)을 관리하는 애플리케이션입니다.

- 타 공수 관리 어플 대비 직관적이고 사용성이 뛰어난  UI/UX 제공
- 퇴직금 정산 및 실업급여 수급 가능 여부 확인 기능 제공
- 복사 & 붙여넣기 지원 으로 빠른 데이터 백업 및 공유 가능

---

### ⏰ 개발 기간
**첫 프로젝트 제작**: 2024.07.01 ~ 2024.08.22

**첫 앱스토어 출시**: 2024.08.12

- iOS 앱스토어에 v1.0 등록
- 필수 기능(근무일 기록, 임금 계산, 데이터 내보내기) 포함  

**프로젝트 보강**: 2024.08.22 ~

- [📌 커뮤니티에 배포 후 피드백 수집](https://gall.dcinside.com/mgallery/board/view/?id=nogada&no=991753&search_pos=-986432&s_type=search_subject_memo&s_keyword=어플리케이션&page=1)
- [📌 커뮤니티에 배포 후 피드백 수집](https://gall.dcinside.com/mgallery/board/view/?id=nogada&no=992850&s_type=search_subject_memo&s_keyword=어플리케이션&search_pos=-986432&page=1)
- [📌 커뮤니티에 배포 후 피드백 수집](https://gall.dcinside.com/mgallery/board/view/?id=nogada&no=996040&s_type=search_subject_memo&s_keyword=어플리케이션&search_pos=-986432&page=1)

**안드로이드 비공개테스트**: 2024.11.21

**UI 전면교체**: 2025.1.13

**안드로이드 출시**: 2025.02.17

## 🎯 주요 기능

- 공수 입력에 따른 정보제공(금액,출력일수,세후금액,누적근로일수)
- 퇴직공제금산정 및 실업급여 수급 가능 여부 확인 
- 날짜 범위 산정 후 누적금액, 기타정보 제공  
- 월별 공수 차트 제공 


## 🛠 기술 스택

`riverpod` | `sqlite` | `flutter_formz` | `table_calendar` | `keyboard_actions` | `archive` | `super_clipboard`|


## 📁 프로젝트 구조
### Repository

- back_up: 데이터 백업 관리, base64로 인코딩 후 파일로 저장, json으로 변환
- formz: 근로조건, 공수입력시 입력값 검증 후 UI 변경
- sqlite: contract,history crud 데이터베이스 관리
- time: 캘린더 UI의 상태변경을 위한 DateTime 관리
- transter_data_goolge_vision:
- view_controll: UI 상태변경을 위한 상태관리

### View Model

- filted_instance_model: history,contract에서 필터링되는 값들 관리
- formz_model: formz_validator를 통한 입력값 검증
- instance_provider_model:UI에 전달되는 instace값 관리
- sqlite_model: 데이터베이스 CRUD 작업 수행


### View UI
1. **calendar**: 캘린더 위젯

- range_picker_component: 날짜 범위선택 이후 근로기록 및 임금계산

2. **dialog**: 다이얼로그 UI

- archive_dialog: 총 근로일수 및 성과 관리 다이얼로그
- backup_dialog: 데이터 백업 다이얼로그
- input_dialog: 근로 조건 입력 다이얼로그
- memo_dialog: 메모 다이얼로그
- selction_conract_form: 데이터 백업 다이얼로그

3. **main_scrren_component**: 메인스크린 UI

- chart_box_component: 월별 공수 차트 박스
- column_box_component: 근로신고일수,근로일수를 보여주는 박스
- main_box_component: 월별공수,세율,공수 및 캘린더 컨트롤박스
- under_box_button_component: 하단에 위치한 다이얼로그 버튼모음

4. **minor_issue**: 기타 UI 위젯
5. **screen**: 메인 화면


## 🚀 주요 기술적 해결 과제
### 1. table_calendar 상태 관리
**문제점**
- table_calendar내에서 UI변경은 setState로 변경 불가

**해결방안**
- time_controller 클래스 구현
- focusDay, selectedDay 값 조정으로 상태 변경

### 2. Database 상태 관리
**문제점**
- 데이터 저장 후 UI 갱신 시 병렬 처리 문제

**해결방안**
1. addHistory로 데이터 추가
2. calendarProvider로 데이터 타입 변환
3. history 데이터 갱신
4. UI 상태 갱신
5. Future.delay를 통한 순차적 처리

### 3. Android 호환성
**문제점**
- isar 패키지 호환성 이슈

**해결방안**
- sqlite로 데이터베이스 변경

## 🔮 향후 계획
### 추가 예정 기능
1. **firebase_remote_config**
    - 사용자 일당 데이터 분석 자료 제시
    - 통계 기반 비교분석 기능

2. **google ml kit text recognition**
    
    - 다른 어플리케이션으로부터 데이터 마이그레이션 자동화

## ⚠️ 한계점 및 개선 방향
1. **에니메이션 관리**
    - Hooks 도입 검토

2. **폼 관리**
    - flutter_formz에서 form_validator로 마이그레이션 검토


