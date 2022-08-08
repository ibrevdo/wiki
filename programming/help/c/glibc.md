
# GLIBC

## inttypes.h
fixed size integer types

## arpa/inet.h
definitions for internet operations

```c++
in_addr_t    inet_addr(const char *);
char        *inet_ntoa(struct in_addr);
const char  *inet_ntop(int, const void *restrict, char *restrict, socklen_t);
int          inet_pton(int, const char *restrict, void *restrict);
```

## Links
* POSIX standard            <https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/contents.html>
* Linux system calls        <http://man7.org/linux/man-pages/man2/syscalls.2.html>
* GNU C Library             <https://www.gnu.org/software/libc/>
* C standard library        <https://en.wikipedia.org/wiki/C_standard_library>
* GLIBC searching and sorting <https://www.gnu.org/software/libc/manual/html_node/Searching-and-Sorting.html>
* memfrob                   <https://linux.die.net/man/3/memfrob>
* strfry                    <http://man7.org/linux/man-pages/man3/strfry.3.html>
