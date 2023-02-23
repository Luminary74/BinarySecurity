;向内存0:200~0:23F依次传送数据0~63（3FH）

assume cs:code
code segment
	mov ax,0
	mov ds,ax
	mov bx,0200h
	mov cx,64

s:	mov [bx],bl
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
code ends
end