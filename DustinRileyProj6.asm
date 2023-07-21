INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	intro BYTE "----- Boolean Calculator -----", 0
	op1 BYTE "1.  X AND Y", 0
	op2 BYTE "2.  X OR Y", 0
	op3 BYTE "3.  NOT X", 0
	op4 BYTE "4.  X XOR Y", 0
	op5 BYTE "5.  Exit program", 0
	prompt BYTE "Enter integer> ", 0
	andp BYTE "Boolean AND", 0
	orp BYTE "Boolean OR", 0
	notp BYTE "Boolean NOT", 0
	xorp BYTE "Boolean XOR", 0
	first BYTE "Input the first 32-bit hexadecimal operand:", 0
	second BYTE "Input the second 32-bit hexadecimal operand:", 0
	result BYTE "The 32-bit hexadecimal result is:", 0
	continue BYTE "Press any key to continue...", 0
	exitp BYTE "Thank you for using FHSU Boolean Calculator. Good-bye!", 0
	pressp BYTE "Press any key to exit..."
	f DWORD ?
	s DWORD ?
.code

AND_op proc
	mov edx, OFFSET andp			;point edx to and start
	call WriteString				;writes and to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	mov edx, OFFSET first			;point edx to first start
	call WriteString				;writes first to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard
	mov f, eax						;copy hex from keyboard into f
	mov edx, OFFSET second			;point edx to second start
	call WriteString				;writes second to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard
	mov edx, OFFSET result			;point edx to result start
	call WriteString				;writes result to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call WriteChar					;write a tab to console
	and eax, f						;and f and s
	call WriteHex					;writes hex result to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	ret
AND_op endp

OR_op proc
	mov edx, OFFSET orp				;point edx to or start
	call WriteString				;writes or to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	mov edx, OFFSET first			;point edx to first start
	call WriteString				;writes first to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard to eax
	mov f, eax						;copy hex from keyboard into f
	mov edx, OFFSET second			;point edx to second start
	call WriteString				;writes second to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard to eax
	mov edx, OFFSET result			;point edx to result start
	call WriteString				;writes result to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call WriteChar					;write a tab to console
	or eax, f						;or eax and f
	call WriteHex					;writes hex result to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	ret
OR_op endp

NOT_op proc
	mov edx, OFFSET notp			;point edx to not start
	call WriteString				;writes not to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	mov edx, OFFSET first			;point edx to first start
	call WriteString				;writes first to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard to eax
	mov edx, OFFSET result			;point edx to result start
	call WriteString				;writes result to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call WriteChar					;write a tab to console
	not f							;not f
	mov eax, f						;copy f to eax
	call WriteHex					;writes hex result to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	ret
NOT_op endp

XOR_op proc
	mov edx, OFFSET xorp			;point edx to xor start
	call WriteString				;writes xor to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	mov edx, OFFSET first			;point edx to first start
	call WriteString				;writes first to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard to eax
	mov f, eax						;copy hex from keyboard into f
	mov edx, OFFSET second			;point edx to second start
	call WriteString				;writes second to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call ReadHex					;reads hex from keyboard to eax
	mov edx, OFFSET result			;point edx to result start
	call WriteString				;writes result to console
	mov al, 9						;ascii 9 is tab for aligning input
	call WriteChar					;write a tab to console
	call WriteChar					;write a tab to console
	xor eax, f						;xor eax and f
	call WriteHex					;writes hex result to console
	call Crlf						;writes new line to console
	call Crlf						;writes new line to console
	ret
XOR_op endp

main proc
	L1:
		mov edx, OFFSET intro		;point edx to intro start
		call WriteString			;writes intro to console
		call Crlf					;writes new line to console
		call Crlf					;writes new line to console
		mov edx, OFFSET op1			;point edx to op1 start
		call WriteString			;writes op1 to console
		call Crlf					;writes new line to console
		mov edx, OFFSET op2			;point edx to op2 start
		call WriteString			;writes op2 to console
		call Crlf					;writes new line to console
		mov edx, OFFSET op3			;point edx to op3 start
		call WriteString			;writes op3 to console
		call Crlf					;writes new line to console
		mov edx, OFFSET op4			;point edx to op4 start
		call WriteString			;writes op4 to console
		call Crlf					;writes new line to console
		mov edx, OFFSET op5			;point edx to op5 start
		call WriteString			;writes op5 to console
		call Crlf					;writes new line to console
		call Crlf					;writes new line to console
		mov edx, OFFSET prompt		;point edx to prompt start
		call WriteString			;writes prompt to console
		call ReadChar				;waits to read input from keyboard
		call WriteChar				;writes the input from readchar to console
		call Crlf					;writes new line to console
		call Crlf					;writes new line to console
		cmp al, 50					;compares character input from keyboard to ascii 2
		jl La1						;jump to La1 if char input from keyboard is less than 2 (1)
		je La2						;jump to La2 if char input from keyboard is equalt to 2
		cmp al, 52					;compares character input from keyboard to ascii 4
		jl La3						;jump to La1 if char input from keyboard is less than 4 (3)
		je La4						;jump to La2 if char input from keyboard is equalt to 4
		jg La5						;jump to La1 if char input from keyboard is greater than 4 (5)
		La1:
			call AND_op
			jmp con
		La2:
			call OR_op
			jmp con
		La3:
			call NOT_op
			jmp con	
		La4:
			call XOR_op
		con:
			mov edx, OFFSET continue	;point edx to continue start
			call WriteString			;writes continue to console
			call ReadChar				;waits to read input from keyboard
			call Clrscr					;clears the console window
			jmp L1
		La5:
			mov edx, OFFSET exitp		;point edx to start of exitp
			call WriteString			;writes exitp to the console
			call Crlf					;writes new line to console
			mov edx, OFFSET pressp		;point edx to start of exitp
			call WriteString			;writes exitp to the console
			call ReadChar				;waits for any key press
			invoke ExitProcess, 0
main endp
end main