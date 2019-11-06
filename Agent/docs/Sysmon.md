# Sysmon

기업에서는 정보유출 위험을 최소화하고 내부보안을 강화하기 위한 방안으로 **EDR(Endpoint Detection and Response) 등을 이용하여 사용자의 이상행위를 분석**하고 있다.



EndUser의 보안성을 강화하기 위해서는 Anti-virus, NAC 등의 다양한 제품군이 존재하지만, **최근에는 사용자의 행위분석 기반의 상관관계 분석이 중요**해짐에 따라 **EndUser에서 발생하는 이벤트 수집이 중요**해 졌다. Microsoft의 Sysinternals사에서 제공하는 **시스템 데이터 수집도구인** **Sysmon**을 이용하여 EndUser에서 발생하는 이벤트를 수집하자.



## Sysmon function

- 현재 프로세스와 상위 프로세스 전체에 대한 프로세스 생성여부를 기록
- 프로세스 이미지 파일의 해쉬를 제공하며 동시에 여러 개의 해쉬 사용 가능 (기본적으로 SHA1을 적용되며, MD5, SHA256, IMPHASH도 사용 가능)
- 네트워크 이벤트는 네트워크 연결을 시도하는 프로세스 정보, IP주소, PORT 정보, 호스트 이름​ 등을 기록
- 파일 생성시간의 변화를 감지하여 파일이 실제 생성된 시기를 파악하여 기록
- 특정 이벤트를 동적으로 포함시키거나 제외시키는 필터링 규칙 적용 가능



Sysmon 기본 설치 시 기록되는 이벤트 목록

- `Process create (with SHA1)`
- `Process terminate`
- `Driver loaded`
- `File creation time changed`
- `RawAccessRead`
- `CreateRemoteThread`
- `Sysmon service state changed`



| Evnet ID | Evnet Name                                    | Description                                                  |
| -------- | :-------------------------------------------- | ------------------------------------------------------------ |
| 1        | Process creation                              | 프로세스 생성 정보 제공                                      |
| 2        | A process changed a file creation time        | 프로세스에 의해 파일의 생성시간이 수정될 때 기록<br />공격자가 백도어의 파일 생성시간을 변경하여 운영체제에 의해 설치된 것으로 변조하는 것을 방지할 수 있다. |
| 3        | Network connection                            | 시스템에서 발생하는 TCP/UDP 네트워크 접속정보 기록<br />ProcessId, ProcessGUID 필드를 통해서 프로세스에 연결되며 호스트명, IP주소, PORT 번호 등의 정보 제공 |
| 4        | Sysmon service state changed                  | Sysmon 서비스의 상태 제공 (시작 \| 중지)                     |
| 5        | Process terminated                            | 프로세스 종료 정보 제공                                      |
| 6        | Driver loaded                                 | 시스템에 로드되는 드라이버 정보 제공                         |
| 7        | Image loaded                                  | 특정 프로세스에서 모듈이 로드될 때 기록되며 기본적으로 사용되지 않기 때문에 -l 옵션으로 설정 필요 |
| 8        | CreateRemoteThread                            | 프로세스가 다른 프로세스에서 스레드를 생성하는지 감시        |
| 9        | RawAccessRead                                 | 드라이브에서 읽기 작업을 수행하는지 감시                     |
| 10       | ProcessAccess                                 | 프로세스에서 다른 프로세스에 접근 시 기록                    |
| 11       | FileCreate                                    | 파일 생성 및 덮어쓰기 시에 기록                              |
| 12       | RegistryEvent<br />(Object create and delete) | 레지스트리 이벤트의 값 수정, 삭제, 설정, 이름변경 등을 기록  |
| 13       | RegistryEvent(Value Set)                      | 레지스트리 이벤트의 값 수정, 삭제, 설정, 이름변경 등을 기록  |
| 14       | RegistryEvent<br />(Key and Value Rename)     | 레지스트리 이벤트의 값 수정, 삭제, 설정, 이름변경 등을 기록  |
| 15       | FileCreateStreamHash                          | 파일스트림 생성 시 스트림 내의 해쉬를 기록                   |
| 16       | Error                                         | Sysmon에서 오류가 발생할 시 생성                             |

