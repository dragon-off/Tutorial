<%
R=(${reset}0)/10
IF(R EQ 0)
	R=0

IF(R EQ 1)
	BEGIN
		I=1
		WHILE(I LE 40)
		BEGIN				
			SETARRAY(600+I "000000000000000000000000000000F0")

			I=I+1
		END
	END
ELSE
	BEGIN
	L=""
	A=${matrix}
	B=${nums}
	C=(${len}0)/10
	A
	I=0
	"\n<br>"
	WHILE(I LT C)
		BEGIN
		Y=STRSTN(STRSUB(B I*2+1 (I+1)*2))+600
		IF(I LT 1)
			L=STRNTS(STRSTN(STRSUB(B I*2+1 (I+1)*2)))
		ELSE
			L=L+","+STRNTS(STRSTN(STRSUB(B I*2+1 (I+1)*2)))
		H=STRSUB(A I*32+1 (I+1)*32)
		H=H+" "
		SETARRAY(Y H)
		I*32+1"\t"(I+1)*32"\t" Y " menyaem na " H  "\n<br>"
		I=I+1
		END
	END
FUNC_EVENT_SEND(141 1 "OPCATPRIORITY prior=\""+L+"\" END")
%>