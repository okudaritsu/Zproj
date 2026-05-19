; PROJECTNAME.s
%include "PROJECTNAME.inc"
bits 32
global _start

Section .data

Section .text
    _start:
	nop

    _end:
	mov eax,0x01
	xor ebx,ebx
	int 0x80


