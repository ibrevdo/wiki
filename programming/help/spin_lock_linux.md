
General spinlock notes
---------------------------------------
https://stackoverflow.com/questions/6603404/when-is-pthread-spin-lock-the-right-thing-to-use-over-e-g-a-pthread-mutex
https://stackoverflow.com/questions/14723924/using-spinlocks-in-user-space-application
https://man7.org/linux/man-pages/man3/pthread_spin_lock.3.html

TOREAD:
Using pthread spin locks (from Oracle programming guide)
https://docs.oracle.com/cd/E37838_01/html/E61057/ggecq.html

TOREAD:
Using spinlocks in linux kernel modules - example
https://tuxthink.blogspot.com/2013/06/using-spinlock-in-linux-example.html


* Example of code after impementing spin lock using GCC's built in atomics
https://community.arm.com/support-forums/f/architectures-and-processors-forum/6558/spin-lock-implementation-for-aarch64----how-to-enforce-acquire-semantics
https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html


ARM spinlock implementation
--------------------------------------
http://linuxforthenew.blogspot.com/2013/04/spinlock-implementation-in-arm-linux.html

WFE - Wait for event. This is an ARM instruction which puts the ARM core into a lower power state. 
The core logic is off but the wake-up mechanism and the RAM arrays are kept on. 
This is usally the first thing that the cpu does when it goes into idle. 
The wake-up from this very very fast, hence it is used in spinlocks. 
The wake is from a external event from another processor or interrupt. 
If you notice carefully we are technically not spinning during a spinlock ;-). 
Spinning is such a waste of power. But, we are not getting scheduled out as well. 
So, from the process point of view it is still holding the CPU.

SEV - Send Event. This to send an event to another Processor in the system to wake it up from WFE state to start executing code.

BARRIERS - Because of usage of Out-Of-Order execution pipeline, if current instruction done does not mean
that previous instruction is completeded too. When implementing spin_lock there is a need to ensure
that all previous instructions are done, so barrier instruction is used

LDREX, STREX - load/store values from memory to register (or from register to memory) exclusively

ARM Assembly Code example
-----------------------------
	MOV     R1, #0x1            ; Initialize the 'lock taken' value
try
    LDREX   R0, [LockAddr]      ; Load the lock value
    CMP     R0, #0              ; Is the lock free?
    ITT     EQ                  ; IT instruction for STREXEQ and CMPEQ
    STREXEQ R0, R1, [LockAddr]  ; Try and claim the lock
    CMPEQ   R0, #0              ; Did this succeed?
    BNE     try                 ; No - try again
    ....                        ; Yes - we have the lock.

http://naveengopala-embeddedlinux.blogspot.com/2014/07/spinlock-implementation-in-arm.html

* example of implementation of spinlock in linux kernel code
In Linux, the ARM implementation can be seen arch/arm/include/asm/spinlock.h
https://elixir.bootlin.com/linux/v4.4/source/arch/arm64/include/asm/spinlock.h

* spinlock implemetation in Arm Linux kernel
https://saiparancs.wordpress.com/2012/06/29/spinlock-implementation-in-arm-linux-kernel-28540/
https://gist.github.com/3018642
https://gist.github.com/3018644


