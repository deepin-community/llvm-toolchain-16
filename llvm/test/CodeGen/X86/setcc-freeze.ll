; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-unknown-linux-gnu < %s 2>&1 | FileCheck %s

define i32 @f(ptr %p) {
; CHECK-LABEL: f:
; CHECK:       # %bb.0:
; CHECK-NEXT:    testb $8, 1(%rdi)
; CHECK-NEXT:    je .LBB0_1
; CHECK-NEXT:  # %bb.2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB0_1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp eq i16 %and, 0
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_false(ptr %p) {
; CHECK-LABEL: f_false:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movb $1, %al
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB1_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB1_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp ult i16 %and, 0
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_false2(ptr %p) {
; CHECK-LABEL: f_false2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movb $1, %al
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB2_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB2_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp ult i16 65535, %and
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_false3(ptr %p) {
; CHECK-LABEL: f_false3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movb $1, %al
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB3_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB3_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp slt i16 32767, %and
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_false4(ptr %p) {
; CHECK-LABEL: f_false4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movb $1, %al
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB4_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB4_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp sgt i16 %and, 32767
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_true(ptr %p) {
; CHECK-LABEL: f_true:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB5_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB5_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp sge i16 %and, -32768
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_true2(ptr %p) {
; CHECK-LABEL: f_true2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB6_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB6_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp uge i16 %and, 0
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_true3(ptr %p) {
; CHECK-LABEL: f_true3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB7_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB7_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp ule i16 0, %and
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}

define i32 @f_true4(ptr %p) {
; CHECK-LABEL: f_true4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:    jne .LBB8_2
; CHECK-NEXT:  # %bb.1: # %A
; CHECK-NEXT:    movl $10, %eax
; CHECK-NEXT:    retq
; CHECK-NEXT:  .LBB8_2: # %B
; CHECK-NEXT:    movl $20, %eax
; CHECK-NEXT:    retq
  %v = load i16, ptr %p, align 2
  %and = and i16 %v, 2048
  %cond = icmp ule i16 %and, 65535
  %cond.fr = freeze i1 %cond
  br i1 %cond.fr, label %A, label %B
A:
  ret i32 10
B:
  ret i32 20
}