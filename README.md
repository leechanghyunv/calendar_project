# 건설현장 워크캘린더 (공수달력)

## 📅 프로젝트 개요
건설현장 노동자들의 근무 일정을 관리하고, 일당 및 근무 기록을 효과적으로 추적할 수 있는 워크캘린더 애플리케이션입니다.

### ⏰ 개발 기간
- **첫 프로젝트 제작**: 2024.07.01 ~ 2024.08.22
- **앱스토어 출시**: 2024.08.12
- **프로젝트 보강**: 2024.08.22 ~
    - 커뮤니티 배포 후 사용자 반응 모니터링
    - 당근마켓 건당 알바 고용 후 설문, 모니터링
    - 카카오톡 오픈체팅방에서 사용자 피드백 수집
- **현재 버전**: 1.3.3
- **안드로이드 비공개테스트**: 2024.11.21

## 🎯 주요 기능
### 사용 목적
- 당일 일당 입력 시 월별 총계 자동 계산
    - 총 공수(근로시간)
    - 세후 계산 금액
    - 출근일수
- 관리사무소 공수 기록과 비교 가능

### 차별화 포인트
#### 1. 간편한 백업시스템
- `super_clipboard` 패키지 활용으로 백업 간소화(고연령 사용자 대응)
- 이메일, 카카오톡 메시지에 공수 데이터 저장 및 복원 기능
- iOS-Android 간 호환 가능한 백업 시스템

#### 2. 목표 관리 기능
- 목표 금액 설정
- 목표 달성까지 필요한 공수 계산
- 건설근로공제 퇴직금 산정 기능

## 🛠 기술 스택
### 주요 패키지
- riverpod
- sqlite
- flutter_formz
- table_calendar
- keyboard_actions

## 📁 프로젝트 구조
### Repository
1. **calculate_day**
    - 근로 일수 및 주휴일수 계산
    - 주휴일수: 15시간 이상 근로 시 1일, 야간근무 시 1일 추가

2. **calendar_time_controller**
    - table_calendar의 markerBuilder 상태 관리
    - selectedDay와 focusDay 상태 제어

3. **copyJsonToClipboard**
    - super_clipboard를 활용한 데이터 백업

4. **formz_decimal**
    - 근무 형태 입력 시 formState 상태 관리

5. **formz_deletion**
    - 데이터 삭제 기능
    - 'Delete file' 입력 검증

6. **formz_model**
    - 근로 조건 입력 값 유효성 검사

7. **sqlite_database**
    - CRUD 작업 수행

### View Model
1. **calendar_event_model**
    - 캘린더 위젯 데이터 관리
2. **filtered_source_model**
    - workHistory와 contract 데이터 통합 관리
3. **contract_model**
    - update_dialog UI 데이터 관리
4. **formz_decimal_model**
    - 근무 형태 입력 UI 상태 관리
5. **formz_deletion_model**
    - 데이터 삭제 UI 상태 관리
6. **formz_manager_model**
    - 근로 조건 입력 UI 상태 관리
7. **formz_memo_model**
    - 메모 입력 reactive UI 관리
8. **history_model**
    - workHistory CRUD 작업 처리

### View UI
1. **calendar**: 캘린더 위젯
2. **chart**: 그래프 및 통계 UI
3. **container**: 상황별 컨테이너
4. **erase_dialog**: 데이터 삭제 UI
5. **input_dialog**: 근로조건 등록 UI
6. **minor_issue**: 기타 UI 위젯
7. **screen**: 메인 화면
8. **update_dialog**: 공수 이벤트 등록

## 🚀 주요 기술적 해결 과제
### 1. table_calendar 상태 관리
**문제점**
- setState로 UI 상태 변경 불가

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

3. **상태관리**
    - GetX 도입 검토

