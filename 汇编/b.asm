     ;FILENAME: EXA131.ASM
 .486
 DATA       SEGME NT    USE16
 SUM        DB  ?,?
 MESG       DB '25+9='
            DB 0,0,'$'
 N1         DB 9,0F0H
 N2         DB 25
 DATA       ENDS
 CODE       SEGMENT     USE16
            ASSUME CS:CODE,DS:DATA
 BEG:       MOV AX,DATA
            MOV DS,AX
            MOV BX,OFFSETSUM
            MOV AH,N1
            MOV AL,N1
            ADD AH,AL
            MOV [BX],AH
            CALL CHANG
            MOV AX,9
            MOV DX,OFFSET MESG
            INT 21H
            MOV AH,4CH
            INT 21H
CHANG:      PROC
LAST:       CMP BYTE PTR [BX],10
            JC NEXT
            SUB BYTE PTR [BX],10
            INC BYTE PTR [BX+7]
            JMP LAST
NEXT:       MOV CL,SUM
            ADD BYTE PTR [BX+8],SUM
            ADD BYTE PTR [BX+7],30H
            ADD BYTE PTR [BX+8]],30H
CHANG:      ENDP
CODE        ENDS
            END BEG

