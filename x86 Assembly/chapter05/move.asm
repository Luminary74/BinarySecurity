;将内存ffff:0~ffff:b单元中的数据复制到0:200~0:20b中。   
;0:200~0:20b可以用0020:0~0020:b描述

assume cs:code
code segment
	
	mov bx,0
	mov cx,0
	
s: 	mov ax,0ffffh
	mov ds,ax
	mov dl,[bx]			;将ffff:bx的数据送入dl
	
	mov ax,0020h
	mov ds,ax
	mov [bx],dl         ;将dl中的数据送入0020:bx
	
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
code ends
end
