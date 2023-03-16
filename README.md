# **DBLUE**

**기획의도**

무슨 수업을 들을지 어려움을 느끼는 학생들을 위해 강의 평가를 보고 선택의 폭을 넓힐 수 있는 기회가 생기고 학생들 서로간의 원활한 소통과 공감을 이끌어내고 생각을 편하게 나눌 수 있는 강의평가 사이트.

**주요기능**

사용자들이 강의를 선택해서 강의 평가를 하고 강의의 평점 및 강의평가를 볼 수 있는 기능을 가지고 있으며

강의평가는 추천, 최신순으로 정렬할 수 있다.

1. 사용자 :  회원가입, 로그인, 강의평가 작성, 마이페이지
2. 게시판 :  공지사항, 강의(기본정보및 평균 평점)
3. 관리자 :  회원 관리, 공지사항 관리, 강의 관리. 강의평가 관리

![image](https://user-images.githubusercontent.com/111633448/207930491-913f5867-1445-4f04-a8da-3d4a77b327a0.png)
- 페이지 권한 구성도

🗓️ **작업기간** : 2021.11.04 ~ 2021.12.02

👨‍💻 **투입인원** : 2명

📒 **주요업무** 

- 기획 및 디자인 - 레이아웃, 웹 디자인 제작
- DB 설계 및 구축 - 강의평가, 강의, 유저, 추천수, 공지사항 DB 설계 및 구축
- 페이지 주요 로직 작성 - 강의평가 작성 및 삭제 기능,강의 검색 기능, 최신/추천순 정렬 기능
- Chart.js를 이용해 강의평가 평균점수 그래프화 기능 개발

🌱 **스킬 및 사용툴**

`HTML5` `css3` `jquery` `Eclipse`

✉️ **아쉬운 점 및 발전 방안**

- JavaScript와 Css3에 대한 숙련도가 많이 부족하고 개발기간이 짧아서 백엔드보다 프론트엔드에 시간을 많이 쏟았다. 다음 프로젝트에선 이 부분을 보완하려고 한다.
- MVC 모델 1 패턴으로 아키텍처를 구성해 개발 구현은 용이했지만 확장성에서 많은 제약이 있었다. 다음 프로젝트에서는 확장성에 중점을 두고 진행을 해야겠다고 느꼈다.
- 개발기간이 짧아 마이페이지, 장바구니 기능, 내가 쓴글, admin페이지 구현이 미흡했다.
- 벤치마킹을 한 사이트와 거의 비슷한 디자인으로 만들어서 다른 디자인으로 만들었으면 좀 더 개성있는 디자인을 적용할 수 있을 것 같다.
- 시간표를 작성할 수 있는 기능과 새로운 강의 알람 기능을 추가하여 강의평가뿐만 아니라 강의에 대해 전반적으로 다루는 사이트로 활용 가능할 것 같다.

🖌️ **UI 및 세부 기능 이미지**
---
![image](https://user-images.githubusercontent.com/111633448/207930962-eb63c6fe-b612-4db4-a024-38517388c9f7.png)
* 메인 페이지
![image](https://user-images.githubusercontent.com/111633448/207931065-c156e677-2f19-459a-8087-3d785555e904.png)
* 공지사항 페이지
![image](https://user-images.githubusercontent.com/111633448/207930671-ae4d269a-cdf1-4db9-a04d-662263ea5622.png)
* 강의평가 작성 페이지
![image](https://user-images.githubusercontent.com/111633448/207931221-cd79e488-d07b-438b-ad4f-8bc791253624.png)
* 강의 검색 페이지
![image](https://user-images.githubusercontent.com/111633448/207931237-2e81e9aa-48ef-45ae-be0a-6a56d2541407.png)
* 강의평가 열람 페이지
![image](https://user-images.githubusercontent.com/111633448/207932900-8726ec25-834c-4b34-9a53-aef354368d34.png)
* 마이 페이지
![image](https://user-images.githubusercontent.com/111633448/207932981-8a0e3ebb-4349-4cf8-ac7c-f85f776d7f8e.png)
* 회원정보 수정 페이지
![image](https://user-images.githubusercontent.com/111633448/207933553-9dea6eed-a733-4a1a-8d64-8d64f2c26a15.png)
* 내가 쓴 글 페이지
![image](https://user-images.githubusercontent.com/111633448/207933796-83ce635c-3532-439d-9d4f-e5411a74caf7.png)
* admin페이지
![image](https://user-images.githubusercontent.com/111633448/207934498-e69cba9b-2dd8-4d81-bdb9-82181db326d5.png)'
* ERD
