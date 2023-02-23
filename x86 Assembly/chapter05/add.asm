;计算ffff:0~ffff:b单元中的数据的和，结果储存在dx中

assume cs:code
code segment
	
	mov ax,0ffffh 
	mov ds,ax
	mov bx,0     ;首先初始化使得ds:ax指向ffff:0	
	mov dx,0	 ;初始化累加器dx，置为0
	mov cx,12    ;初始化循环计数寄存器cx,置为12
	
s:	mov al,[bx]
	mov ah,0
	add dx,ax    ;间接向dx加上((ds)*16 + (bx))单元的数值
	inc bx		 ;bx自增，偏移地址移动，ds:bx指向下一个单元
	loop s

	mov ax,4c00h
	int 21h
	
code ends
end