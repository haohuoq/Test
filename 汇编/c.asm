;FILENAME:EXA131.ASM
.486
DATA  SEGMENT USE16
SUM   DB  '?','?'
MESG  DB  '25+9='
      DB  0,0,'$' ;以'$'结尾，没有输出会乱码
N1    DB  9,0F0H
N2    DB  25
DATA  ENDS
CODE  SEGMENT USE16
      ASSUME CS:CODE,DS:DATA
BEG:  MOV   AX,DATA
      MOV   DS,AX
      MOV   BX,OFFSET SUM
      MOV   AH,N1
      MOV   AL,N2
      ADD   AH,AL
      MOV   [BX],AH
      CALL  CHANG
      MOV   AH,9
      MOV   DX,OFFSET MESG
      INT   21H
      MOV   AH,4CH
      INT   21H
CHANG PROC
LAST: CMP BYTE PTR [BX],10
      JC  NEXT
      SUB BYTE PTR [BX],10
      INC BYTE PTR [BX+7]
      JMP LAST
NEXT: MOV DL,SUM
      ADD BYTE PTR [BX+8],DL
      ADD BYTE PTR [BX+7],30H
      ADD BYTE PTR [BX+8],30H
      RET
CHANG ENDP
CODE  ENDS
      END  BEG
