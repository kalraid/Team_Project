select host, user FROM mysql.user;

GRANT ALL privileges ON *.* to 'root'@'%' identified BY '12345678' with grant option;


use spring;
drop table stretching;
CREATE TABLE stretching (
	stretchingnum INTEGER AUTO_INCREMENT PRIMARY KEY, 
    stretchingtitle VARCHAR(1000) NOT NULL,
	stretchingcontent1 VARCHAR(1000) NOT NULL,
	stretchingcontent2 VARCHAR(1000), 
	stretchingcontent3 VARCHAR(1000),
	stretchingcontent4 VARCHAR(1000),
	stretchingcontent5 VARCHAR(1000),
	stretchingcontent6 VARCHAR(1000),
    stretchingcontent7 VARCHAR(1000),
    stretchingcontent8 VARCHAR(1000)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;
select * from stretching;

INSERT INTO stretching (stretchingtitle,stretchingcontent1,stretchingcontent2,stretchingcontent3,stretchingcontent4,stretchingcontent5) VALUES ('거북목 스트레칭','똑바로 선 상태에서 머리를 좌우로 가볍게 1/3 가량 돌려준다.\r\n\r\n 이 동작을 약 10회 천천히 반복한다.','두 팔을 손끝까지 쭉 편 채로 앞으로 올린다.\r\n\r\n두 팔을 만세 하듯 위로 천천히 올린다.\r\n\r\n위, 아래로 올렸다 내리기를 5회 반복한다.','양어깨를 동시에 위로 올린다.\r\n\r\n양어깨의 힘을 빼면서 아래로 툭 떨어뜨린다.\r\n\r\n이 동작을 10회 반복한다.','허리를 펴고 앉거나 선 자세를 취한다.\r\n\r\n한 손으로 머리 위를 감싸고, 손에 힘을 주어 머리를 아래로 당긴다.\r\n\r\n한 회에 15초 정도로, 3회 실시한다.','양손을 깍지 끼고 뒤통수에 댄다.\r\n\r\n목 뒷덜미 근육이 펴지는 느낌이 나도록 양손으로 누른다.\r\n\r\n한 회에 15초로, 3회 실시한다.');
INSERT INTO stretching (stretchingtitle,stretchingcontent1,stretchingcontent2,stretchingcontent3,stretchingcontent4,stretchingcontent5,stretchingcontent6) VALUES('키크는 스트레칭','다리는 어깨너비보다 넓게 벌린 후 무릎을 구부린다\r\n\r\n양 손으로 무릎을 잡고 오른쪽 어깨를 앞쪽으로 내밀며 비틀어서 자세를 10간 유지한다\r\n\r\n왼쪽, 오른쪽 번갈아 가며 똑같이 반복한다','땅에 배를 대고 누운 뒤, 양 손을 가슴 옆 부분의 바닥을 짚어준다\r\n\r\n팔을 천천히 피면서 머리, 가습, 배 순서로 이어지는 느낌으로 상체를 들어올린다\r\n\r\n시선은 위쪽을 향한 채 10초간 유지한다','양 다리를 벌려 두 발바들을 붙이고 척추를 곧게 세운 뒤 허리를 앞으로 뻗어 상체를 바닥으로 천천히 내린다\r\n\r\n꼬리뼈를 뒤로 빼주고 10간 유지한다','두 손으로 발목을 잡고 상체를 천천히 내려준다\r\n\r\n전신에 신경이 자극되도록 발 끝을 몸 쪽으로 당긴다','다리를 최대한 벌리고 두 손을 머리 위로 올린 뒤 상체를 바닥으로 천천히 내린다','바닥에 편안하게 누워 숨을 내쉬면서 몸 전체를 쭉쭉 밀어낸다\r\n\r\n발 끝을 몸 안쪽으로 당겨 구부려 비틀기 동작을한다');
INSERT INTO stretching (stretchingtitle,stretchingcontent1,stretchingcontent2,stretchingcontent3,stretchingcontent4,stretchingcontent5,stretchingcontent6) VALUES('아킬레스건 스트레칭','양 다리를 어깨 너비로 살짝 벌린 상태에서 발뒤꿈치만 최대한 들었다 내렸다를 10회 이상 반복해줍니다\r\n\r\n이때 종아리가 당기는 듯한 느낌이 들도록 올려줍니다','바르게 선 상태에서 양 발바닥을 바닥에 붙이고 상체만 천천히 내려와 두 팔로 바닥을 지탱해줍니다.\r\n\r\n삼각형 상태를 만들어주어 종아리가 당기는 듯한 느낌이 들도록 1분동안 유지해줍니다','계단이나, 책을 쌓아두어 두 발을 얹습니다.\r\n\r\n이 때 발바닥 앞쪽 부분만 걸쳐주어 몸의 무게 중심을 잘 잡아줍니다.\r\n\r\n그 상태에서 천천히 양 발을 아래로 당겨주었다가 다시 올라옵니다.\r\n\r\n주변 상황이 여의치 않다면 손으로 직접 해줍니다.\r\n\r\n발바닥 앞쪽을 손바닥으로 잡고 천천히 안쪽으로 당겨 종아리가 당기도록 해줍니다.','발가락을 안쪽으로 구부렸다가 바깥쪽으로 구부려 내려줍니다.\r\n\r\n10회 이상 반복해줍니다.','의자나 테이블에 운동밴드를 묶어 한쪽 발에 걸어줍니다.\r\n\r\n걸어둔 한 쪽 다리의 발목을 곧게 유지해주면서 천천히 바깥으로 뻗어주었다가 내렸다를 반복합니다.\r\n\r\n반대쪽 다리도 진행해주며 각 10회씩 반복해줍니다.','통증이 없어졌다하여 방심하고 무리한 행동을 하면 재발 할 수 있기 때문에,\r\n\r\n아킬레스건의 관련 질환을 예방하기 위해서는\r\n\r\n발등과 발뒤꿈치를 보호해주는 신발을 착용해주고,\r\n\r\n족욕을 자주 해주어 피로해진 근육을 풀어주는 것도 방법입니다.');
INSERT INTO stretching (stretchingtitle,stretchingcontent1,stretchingcontent2,stretchingcontent3,stretchingcontent4,stretchingcontent5,stretchingcontent6,stretchingcontent7) VALUES('허리 통증 완화','다리를 펴고 앉은상태에서 한쪽다리를 접은뒤 팔로 발끝을 잡고 스트레칭 해줍니다.\r\n\r\n다른다리도 똑같이 스트레칭 해줍니다.','다리를 아빠다리를 한뒤 팔로 무릎을 눌러주시면서 스트레칭 해줍니다.','엎드리면서 다리한쪽을 가슴쪽으로 굽히면서 상체는 업드려 줍니다.\r\n\r\n다른 다리도 똑같이 스트레칭 해줍니다.','오른쪽 다리를 무릎 바깥쪽에 세우면서 왼쪽팔로 무릎을 밀면서 몸을 오른쪽으로 최대한 돌린다.\r\n\r\n오른손은 엉덩이쉬 바닥을 집고 시선도 뒤로 바라봅니다.\r\n\r\n왼쪽다리도 똑같이 해줍니다.','앞쪽으로 누우신후 오른쪽발을 들어 양손으로 감싸쥐고 가슴쪽으로 올립니다\r\n\r\n그뒤 왼다리를 오른쪽무릎에 걸쳐 눌러줍니다. \r\n\r\n왼쪽다리도 똑같이 스트레칭 해줍니다.','양팔을 벌리고 누우신뒤 왼쪽다리를 세우고 오른손으로 왼쪽무릎을 눌러 오른쪽으로 최대한 넘겨줍니다.\r\n\r\n시선은 왼쪽으로 향하고 어깨가 뜨지않게 주의하셔야 합니다.\r\n\r\n다리 바꿔서 똑같이 스트레칭 해줍니다.','무릎을 꿇으신후 상체를 숙여주시면서 스트레칭 해줍니다');
INSERT INTO stretching (stretchingtitle,stretchingcontent1,stretchingcontent2,stretchingcontent3) VALUES('잠 잘못 잤을때','목이 아픈 쪽 팔을 조금씩 뒤로 잡아당겨 올려줍니다\r\n\r\n자연스럽게 멈춘 위치에서 20초간 유지합니다.\r\n\r\n이 스트레칭 2회 반복합니다','아픈 쪽 손을 팔꿈치 각도 120도를 들어 만세 자세를 합니다\r\n\r\n이 각도 그대로 팔을 가볍게 뒤로 잡아당겨서 20초간 유지합니다 \r\n\r\n이 두 번째 방법도 2세트씩 반복합니다','아픈 쪽 손바닥으로 등 뒤에 벨트 가운데 위치를 가볍게 눌러줍니다\r\n\r\n그리고 그대로 팔꿈치를 뒤로 잡아당겨 20초간 유지하는 동작을 역시나 2세트 반복합니다');

drop table firstaid;
CREATE TABLE firstaid (
	firstaidnum INTEGER AUTO_INCREMENT PRIMARY KEY, 
    firstaidtitle VARCHAR(1000) NOT NULL,
	firstaidcontent1 VARCHAR(1000) NOT NULL,
	firstaidcontent2 VARCHAR(1000), 
	firstaidcontent3 VARCHAR(1000),
	firstaidcontent4 VARCHAR(1000),
	firstaidcontent5 VARCHAR(1000),
	firstaidcontent6 VARCHAR(1000),
    firstaidcontent7 VARCHAR(1000),
    firstaidcontent8 VARCHAR(1000)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;
select * from firstaid;

INSERT INTO firstaid (firstaidtitle,firstaidcontent1,firstaidcontent2,firstaidcontent3,firstaidcontent4) VALUES('성인 심폐소생술','환자를 바로 눕힌 후 어깨를 가볍게 치면서 의식이 있는지, 숨을 정상적으로 쉬는지 확인한다\r\n\r\n주변 사람들에게 119 호출 및 자동제세동기를 가져올 것을 요청한다.','가슴의 중앙인 흉골의 아래쪽 절반부위에 손바닥을 위치시킨다.\r\n\r\n양손을 깍지 낀 상태로 손바닥의 아래 부위만을 환자의 흉골부위에 접촉시킨다','시술자의 어깨는 환자의 흉골이 맞닿는 부위와 수직이 되게 위치한다\r\n\r\n양쪽 어깨 힘을 이용하여 분당 100~120회 정도의 속도로 5cm 이상 깊이로 강하고 빠르게 30회 눌러준다.','한 손으로 턱을 들어 올리고, 다른 손으로 머리를 뒤로 젖혀 기도를 개방시킨다\r\n\r\n머리를 젖힌 손의 검지와 엄지로 코를 막는다.\r\n\r\n가슴 상승이 눈으로 확인될 정도로 1초 동안 인공호흡을 2회 실시한다.');
INSERT INTO firstaid (firstaidtitle,firstaidcontent1,firstaidcontent2,firstaidcontent3,firstaidcontent4) VALUES('소아 심폐소생술','환자를 바로 눕힌 후 어깨를 가볍게 치면서 의식이 있는지, 숨을 정상적으로 쉬는지 확인한다.\r\n\r\n주변 사람들에게 119 호출 및 자동제세동기를 가져올 것을 요청한다','압박할 위치는 양쪽 젖꼭지 부위를 잇는 선의 정 중앙의 바로 아래 부분이다\r\n\r\n한 손으로 손바닥의 아래 부위만을 환자의 흉골부위에 접촉시킨다.','시술자의 어깨는 환자의 흉골이 맞닿는 부위와 수직이 되게 위치한다.\r\n\r\n한 손으로 1분당 100~120회 정도의 속도와 5cm 이상 깊이로 강하고 빠르게 30회 눌러준다.','한 손으로 턱을 들어 올리고, 다른 손으로 머리를 뒤로 젖혀 기도를 개방시킨다\r\n\r\n머리를 젖힌 손의 검지와 엄지로 코를 막는다.\r\n\r\n가슴 상승이 눈으로 확인될 정도로 1초 동안 인공호흡을 2회 실시한다.');
INSERT INTO firstaid (firstaidtitle,firstaidcontent1,firstaidcontent2,firstaidcontent3,firstaidcontent4) VALUES('영아 심폐소생술','환자를 바로 눕힌 후 발바닥을 가볍게 치면서 의식이 있는지, 숨을 정상적으로 쉬는지 확인한다.\r\n\r\n주변 사람들에게 119 호출 및 자동제세동기를 가져올 것을 요청한다.','압박할 위치는 양쪽 젖꼭지 부위를 잇는 선 정 중앙의 바로 아래 부분이다\r\n\r\n검지와 중지 또는 중지와 약지 손가락을 모은 후 첫마디 부위를 환자의 흉골부위에 접촉시킨다','시술자의 손가락은 환자의 흉골이 맞닿는 부위와 수직이 되게 위치한다.\r\n\r\n1분당 100~120회의 속도와 4cm 이상의 깊이로 강하고 빠르게 30회 눌러준다','한 손으로 귀와 바닥이 평행할 정도로 턱을 들어 올리고, 다른 손으로 머리를 뒤로 젖힌다.\r\n\r\n환자의 입과 코에 동시에 숨을 불어 넣을 준비를 한다.\r\n\r\n가슴 상승이 눈으로 확인될 정도로 1초 동안 인공호흡을 2회 실시한다.');
INSERT INTO firstaid (firstaidtitle,firstaidcontent1,firstaidcontent2,firstaidcontent3,firstaidcontent4) VALUES('자동 심장충격기','자동 심장충격기의 전원을 켠다. 전원이 들어오면 음성이 나오면서 절차를 안내해준다','상체를 노출시킨 후 우측 쇄골 아래쪽에 패드를 부착한다.\r\n\r\n또 다른 패드는 좌측 유두 바깥쪽 아래의 겨드랑이 중앙선에 부착한다\r\n\r\n각 패드의 표면에는 부착할 위치가 어디인지 그림으로 표시되어 있으므로 참고한다.','패드에 연결된 선을 기계에 꽂는다.\r\n\r\n기계에서 자동으로 심장리듬 분석 중이라는 말이 나온다\r\n\r\n심장 분석에 오류가 나지 않도록 환자에게 닿지 않도록 떨어진다.','제세동이 필요하다면 기계가 자동으로 충전을 하며, 충전 후 제세동 버튼을 누르라는 메시지가 나온다\r\n\r\n버튼을 누르기 전 주변 사람들에게 환자와 떨어지도록 다시 주의를 준다.\r\n\r\n제세동버튼을 누르면 환자에게 제세동을 위한 전기충격이 가해지게 된다.\r\n\r\n전기충격이 필요없거나, 전기 충격이 주어지고 나서는 즉시 심폐소생술을 시행한다.\r\n\r\n기계는 2분마다 심장리듬을 분석한다.\r\n\r\n심폐소생술 도중에 기계에서 음성 지시기 나오면 기계의 지시에 따라서 위의 절차를 반복하도록 한다.');
INSERT INTO firstaid (firstaidtitle,firstaidcontent1,firstaidcontent2,firstaidcontent3,firstaidcontent4,firstaidcontent5) VALUES('성인 기도 이물 폐쇄','환자가 숨쉬기 힘들어 하거나 목을 감싸 괴로움을 호소할 경우 기도폐쇄로 판단한다.\r\n\r\n주변 사람들에게 119를 불러달라고 요청한다.','만약 말을 할 수 있다면 기도가 완전히 막힌 것은 아니며, 대부분의 경우 기침이 가능하다.\r\n\r\n힘있게 기침을 해서 이물을 뱉어내도록 유도한다.\r\n\r\n이때, 환자가 자발적으로 기침을 하여 이물을 빼내려는 노력을 중단시키거나 방해하지 않도록 한다','환자의 등 뒤에서 주먹 쥔 손을 배꼽과 명치 중간 정도에 위치시킨다.\r\n\r\n배꼽과 명치 중간 위치에 주먹 쥔 손의 엄지 손가락이 배에 닿도록 놓는다\r\n\r\n다른 한 손으로 주먹을 감싼다.','한쪽 다리는 환자의 다리 사이로, 다른 한쪽 다리는 뒤로 뻗어 균형을 잡는다.\r\n\r\n팔에 강하게 힘을 주면서 배를 안쪽으로 누르면서 상측 방향으로 5회 당겨준다','임신한 여성이나 비만이 심한 사람의 경우 가슴 부위를 밀어낸다.');
INSERT INTO firstaid (firstaidtitle,firstaidcontent1,firstaidcontent2,firstaidcontent3,firstaidcontent4) VALUES('영아 기도 이물 폐쇄','쉰 숨소리, 쉰 울음소리가 들리거나 얼굴에 청색증이 관찰될 경우 기도폐쇄로 판단한다\r\n\r\n주변 사람들에게 119를 불러달라고 요청한다','왼손으로는 환자의 턱을, 오른손으로는 환자의 뒤통수를 감싸면서 천천히 안아 올린다\r\n\r\n왼쪽 허벅지 위에 머리가 아래를 향하도록 엎드려 놓는다.\r\n\r\n손바닥 밑 부분으로 등의 중앙부를 세게 5회 두드린다','환자의 턱과 뒤통수를 다시 손으로 감싸 들어 올린다\r\n\r\n반대쪽 허벅지 위에 머리가 아래를 향하도록 바로 눕힌다. \r\n\r\n양쪽 젖꼭지를 잇는 선의 중앙 부위의 바로 아래 부위에 두개의 손가락을 위치시킨다. 심폐소생술에서 시행하는 가슴 압박과 비슷하게 강하고 날카롭게 5회 눌러준다.','의자에 앉아서 하면 올바른 자세로 환자의 등/가슴을 보다 쉽고 정확하게 압박할 수 있다.');
drop table jiap;
CREATE TABLE jiap (
	jiapnum INTEGER AUTO_INCREMENT PRIMARY KEY, 
    jiaptc VARCHAR(1000) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

select * from jiap;
INSERT INTO jiap (jiaptc) VALUES('잠이 부족할 때 지압 방법\r\n\r\n엄지, 중지, 새끼손가락을 부드럽게 마사지하듯 문지르기');
INSERT INTO jiap (jiaptc) VALUES('허리가 아플 때 지압방법\r\n\r\n손을 쫙 편 상태에서 중지와 연결된 손등 뼈 양쪽을 꾹꾹 누르기');
INSERT INTO jiap (jiaptc) VALUES('스트레스 받을 때 지압방법\r\n\r\n손가락 사이사이를 주물러 손의 피로 풀어주기\r\n\r\n손등을 쓰담쓰담 마사지하며 마음 가라앉히기');
INSERT INTO jiap (jiaptc) VALUES('두통 지압방법\r\n\r\n중지의 첫마디 지점을 누르기\r\n\r\n손바닥과 손목이 만나는 가운데 점을 지긋이 누르기');
INSERT INTO jiap (jiaptc) VALUES('어깨가 결릴 때 지압방법\r\n\r\n중지의 양옆 부분을 반대 엄지손가락으로 눌러 풀기\r\n\r\n검지, 중지, 약지를 한 손가락씩 손등 쪽으로 쭉쭉 젖히기');
INSERT INTO jiap (jiaptc) VALUES('식욕억제 지압방법\r\n\r\n다이어트 중일 때 손바닥 가운데 부분을 눌러주기\r\n\r\n식욕억제에 도움을 준다고 합니다.');
INSERT INTO jiap (jiaptc) VALUES('만성피로 지압방법\r\n\r\n깍지를 낀 양 손바닥 아래 골프공과 같은 둥근 물체를 쥐고 3분 동안 꾹 누르듯 굴리기\r\n\r\n지압볼을 양 손에 쥐고 움켜쥐어도 좋습니다.');
INSERT INTO jiap (jiaptc) VALUES('눈이 침침할 때 지압방법\r\n\r\n가운데 손가락 양옆을 꾹꾹 누르거나 잡고 돌리기\r\n\r\n가운데 손가락 지문 중앙을 손톱으로 누르며 자극하기');
INSERT INTO jiap (jiaptc) VALUES('소화불량 지압방법\r\n\r\n엄지와 검지 사이 부분을 5분 정도 지긋이 누르기\r\n\r\n원을 그리듯이 마사지를 해주는 것이 좋다.');
INSERT INTO jiap (jiaptc) VALUES('생리통 지압방법\r\n\r\n손바닥 아랫부분을 지압하면 생리통에 도움이 된다.');