/*
** EPITECH PROJECT, 2021
** MiniLibC
** File description:
** tests
*/

#ifndef __TESTS_H_
#define __TESTS_H_

#include <string.h>

size_t my_strlen(char *str);
int my_strcmp(const char *s1, const char *s2);
int my_strncmp(const char *s1, const char *s2, size_t n);
void *my_memcpy(void *dest, const void *src, size_t n);
void *my_memset(void *s, int c, size_t n);
void *my_memmove(void *dest_str, const void *src_str, size_t number);
int my_strcasecmp(const char *s1, const char *s2);
char *my_strchr(const char *s, int c);
char *my_rindex(const char *s, int c);
char *my_strstr(const char *haystack, const char *needle);
char *my_strpbrk(const char *s, const char *accept);
size_t my_strcspn(const char *s, const char *reject);

#endif // __TESTS_H_
