{priority 4.2.2 17.07.2013}
C=COUNTER
{проверка выполняется ли спец регистрация(при спец регистрации создается талон с item_value=номеру окна)}
{или номеру окна и +100 в случае если это клиент ЮЛ (не должен отображатся на табло при первом вызове)}
IF(ARRAY(351) GT (TIME_NO-3)) 
BEGIN
	N=0
	I=1
	WHILE(I LE 10)
	BEGIN
		J=0
		WHILE(J LT GROUP_QUEUE(I))
		BEGIN
			IF(GROUP_QUEUE_CUSTOMER_ITEM(I J ITEM_VALUE) EQ C)
			BEGIN
				FUNC_CALL_TRACK(C GROUP_QUEUE_CUSTOMER_ITEM(I J ITEM_TRACK) 6 0 0)
				0
				N=1
			END
			IF(GROUP_QUEUE_CUSTOMER_ITEM(I J ITEM_VALUE) EQ (C+100))
			BEGIN
				FUNC_CALL_TRACK(C GROUP_QUEUE_CUSTOMER_ITEM(I J ITEM_TRACK) 6 1 0)
				0
				N=1
			END
			J=J+1
		END
		I=I+1
	END
	{если клиент не найден по спец. рег. то возрашаем 0}
	IF(N EQ 0)
		0
	IF(ARRAY(351) LT (TIME_NO-5))
		SETARRAY(350 0)
END 
ELSE 
BEGIN
	{штатный режим приориета}
	{идем по всем клиентам, которые ожидают первичного вызова}
	{простые клиента}
	{1	1 КЛАСС 1 УРОВЕНЬ}
	{2	1 КЛАСС 2 УРОВЕНЬ}
	{3	1 КЛАСС ПЕРЕВЕДЕННЫЕ 1 уровень}
	{4	1 КЛАСС ПЕРЕВЕДЕННЫЕ 2 уровень}
	{клиенты сбербанка по ПК}
	{5	2 КЛАСС 1 УРОВЕНЬ}
	{6	2 КЛАСС 2 УРОВЕНЬ}
	{7	2 КЛАССА ПЕРЕВЕДЕННЫЕ 1 уровень}
	{8	2 КЛАССА ПЕРЕВЕДЕННЫЕ 2 уровень}
	{ЮЛ клиенты (спец регистрация, у них item_value=100+counter)}
	{9	КЛИЕНТЫ ОТ ЮР ЛИЦ}
	{VIP клиенты}
	{10	3 КЛАСС  1 УРОВЕНЬ}
	{11	3 КЛАСС  2 УРОВЕНЬ}
	{12	3 КЛАСС ПЕРЕВЕДЕННЫЕ 1 уровень}
	{13	3 КЛАСС ПЕРЕВЕДЕННЫЕ 2 уровень}
	
	L=COUNTER_LOGIN_ID(C)
	A=ARRAY(600+C) {массив с доступностью операций по окнам}
	V=STRSUB(ARRAY(1111) L L)  
	T=0 {макс время ожид}
	N=0 {выбранная кнопка}
	Y=1 {уровень приориета}
	O=0 {ITEM_TRACK}
	
	I=1
	WHILE(I LE 10)
	BEGIN
		{получаем доступность и уровень операции в этом окне для тек. сотрудника}
		Q=STRSTN(STRSUB(A I I))*STRSTN(STRSUB(ARRAY(1100+I) L L))
		{переварачиваем уровень 1=2 и 2=1}
		IF(Q EQ 1)
			Q=2
		ELSE IF(Q EQ 2)
			Q=1
		{если операции может быть обслуженна}
		IF(Q GT 0)
		BEGIN
			J=I
			IF(BUTTON_QUEUE(J) GT 0)
				IF((BUTTON_RWT(J) GT T AND Q EQ Y) OR Q GT Y) {сравниваем время и уровень}
				BEGIN
					Y=Q
					T=BUTTON_RWT(J)
					N=J
				END
			J=I+20
			IF(BUTTON_QUEUE(J) GT 0)
			IF(BUTTON_RWT(J) GT T AND ((Q+4) EQ Y) OR ((Q+4) GT Y)) {сравниваем время и уровень}
				BEGIN
					Y=Q+4
					T=BUTTON_RWT(J)
					N=J
				END
			IF(V EQ "1") {проверяем доступность вызова вип клиентов для сотрудника}
			BEGIN
				J=I+40
				IF(BUTTON_QUEUE(J) GT 0)
					IF((BUTTON_RWT(J) GT T AND ((Q+9) EQ Y) OR ((Q+9) GT Y))  AND V EQ "1")  {сравниваем время и уровень}
					BEGIN
						Y=Q+9
						T=BUTTON_RWT(J)
						N=J
					END
			END
		END
		I=I+1
	END
	
	
	
	{поиск по переведенном, отличие в том что результатом будет item_track, так как группа 1 а клиенты могут быть с разными классами}
	{поиск клиентов по переводу в операцию НАЧАЛО}
	J=0 
	WHILE(J LT GROUP_QUEUE(34))
	BEGIN
		K=GROUP_QUEUE_CUSTOMER_ITEM(34 J ITEM_ENTER_BUTTON)
		R=TIME_NO-GROUP_QUEUE_CUSTOMER_ITEM(34 J ITEM_START)
		S=GROUP_QUEUE_CUSTOMER_ITEM(34 J ITEM_BUTTON)
		P=GROUP_QUEUE_CUSTOMER_ITEM(34 J ITEM_TRACK)
		Q=STRSTN(STRSUB(A S-180 S-180))*STRSTN(STRSUB(ARRAY(1100+S-180) L L)) 
		IF(Q EQ 1)
			Q=2
		ELSE IF(Q EQ 2)
			Q=1
		IF(Q GT 0)
		BEGIN
			IF(K GE 41 AND K LE 50 )
			BEGIN
				IF(((R GT T) AND  (11+Q EQ Y)) OR (11+Q GT Y))
				BEGIN
					Y=11+Q
					T=R
					N=S
					O=P 
				END
			END
			IF(K GE 21 AND K LE 30)
			BEGIN
				IF(((R GT T) AND  (6+Q EQ Y)) OR (6+Q GT Y))
				BEGIN
					Y=6+Q
					T=R
					N=S
					O=P 
				END
			END
			IF(K GE 1 AND K LE 10)
			BEGIN
				IF(((R GT T) AND  (2+Q EQ Y)) OR (2+Q GT Y))
				BEGIN
					Y=2+Q
					T=R
					N=S
					O=P 
				END
			END
		END
		IF(GROUP_QUEUE_CUSTOMER_ITEM(34 J ITEM_VALUE) GT 100)
			IF((R GT T) OR (9 GT Y))
			BEGIN
				Y=9
				T=R
				N=S
				O=P 
			END
		J=J+1
	END
	{поиск клиентов по переводу в операцию КОНЕЦ}
	
	{поиск клиентов по переводу в окна НАЧАЛО}
	J=0 
	WHILE(J LT GROUP_QUEUE(31))
	BEGIN
		IF(GROUP_QUEUE_CUSTOMER_ITEM(31 J ITEM_BUTTON) EQ (60+C))
		BEGIN
			K=GROUP_QUEUE_CUSTOMER_ITEM(31 J ITEM_ENTER_BUTTON)
			R=TIME_NO-GROUP_QUEUE_CUSTOMER_ITEM(31 J ITEM_START)
			S=GROUP_QUEUE_CUSTOMER_ITEM(31 J ITEM_BUTTON)
			P=GROUP_QUEUE_CUSTOMER_ITEM(31 J ITEM_TRACK)
			Z=ARRAY(3000+P)
			IF(Z EQ 0) 
				Z=K
			IF(Z GE 21 AND Z LE 30)
				Z=Z-20
			IF(Z GE 41 AND Z LE 60)
				Z=Z-40
			IF(Z GE 181 AND Z LE 190)
				Z=Z-180
			Q=STRSTN(STRSUB(A Z Z))*STRSTN(STRSUB(ARRAY(1100+Z) L L))
			IF(Q EQ 1)
				Q=2
			ELSE 
			IF(Q EQ 2)
				Q=1
			IF(Q GE 0)
			BEGIN
				IF (Q EQ 0) 
					Q=2
				IF(K GE 41 AND K LE 50 )
				BEGIN
					IF(((R GT T) AND (11+Q EQ Y)) OR (11+Q GT Y))
					BEGIN
						Y=11+Q
						T=R
						N=S
						O=P 
					END
				END
				IF(K GE 21 AND K LE 30)
				BEGIN
					IF(((R GT T) AND (6+Q EQ Y)) OR (6+Q GT Y))
					BEGIN
						Y=6+Q
						T=R
						N=S
						O=P 
					END
				END
				IF(K GE 1 AND K LE 10)
				BEGIN
					IF(((R GT T) AND (2+Q EQ Y)) OR (2+Q GT Y))
					BEGIN
						Y=2+Q
						T=R
						N=S
						O=P 
					END
				END
			END
			
			IF(GROUP_QUEUE_CUSTOMER_ITEM(31 J ITEM_VALUE) GT 100)
				IF((R GT T) OR (9 GT Y))
				BEGIN
					Y=9
					T=R
					N=S
					O=P 
				END
		END
		J=J+1
	END
	{поиск клиентов по переводу в окна КОНЕЦ}

	{если был найден переведенный с отличаюшимся и высшем уровнем то вызваем его по треку}
	IF(O GT 0) 
	BEGIN
		FUNC_CALL_TRACK(C O 6 0 0)
		0
	END
	ELSE {елси нет то вызываем по кнопке}
		N
END