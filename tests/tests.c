/*
** EPITECH PROJECT, 2021
** MiniLibC
** File description:
** tests
*/

#include "tests.h"
#include <criterion/criterion.h>

Test(strlen, small)
{
    char *str = "PLOUF";
    size_t got = my_strlen(str);
    size_t expected = strlen(str);

    cr_expect_eq(expected, got, "Got: %zu | Expected: %zu\n", got, expected);
}

Test(strlen, medium)
{
    char *str = "PLOUFkjdzhfdadlhddjfd";
    size_t got = my_strlen(str);
    size_t expected = strlen(str);

    cr_expect_eq(expected, got, "Got: %zu | Expected: %zu\n", got, expected);
}

Test(strlen, big)
{
    char *str = "PLOUFkjdzhfdadlhddjfdlkadadsjkadlkjada" \
    "akjsafahfashfasjfhafsmhamfshamsfjah";
    size_t got = my_strlen(str);
    size_t expected = strlen(str);

    cr_expect_eq(expected, got, "Got: %zu | Expected: %zu\n", got, expected);
}

Test(strcmp, ok)
{
    const char *str1 = "PLOUF";
    const char *str2 = "PLOUF";
    int got = my_strcmp(str1, str2);
    int expected = strcmp(str1, str2);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}


Test(strcmp, KO_1)
{
    const char *str1 = "adasadsads";
    const char *str2 = "PLOUF";
    int got = my_strcmp(str1, str2);
    int expected = strcmp(str1, str2);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}

Test(strcmp, KO_2)
{
    const char *str1 = "PLOU";
    const char *str2 = "PLOUF";
    int got = my_strcmp(str1, str2);
    int expected = strcmp(str1, str2);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}


Test(strcmp, KO_3)
{
    const char *str1 = "PLOUF1";
    const char *str2 = "PLOUF";
    int got = my_strcmp(str1, str2);
    int expected = strcmp(str1, str2);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}

Test(strncmp, ok)
{
    const char *str1 = "PLOUF";
    const char *str2 = "PLOUF";
    size_t n = 3;
    int got = my_strncmp(str1, str2, n);
    int expected = strncmp(str1, str2, n);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}


Test(strncmp, ok_n_sup)
{
    const char *str1 = "PLOUF";
    const char *str2 = "PLOUF";
    size_t n = 200;
    int got = my_strncmp(str1, str2, n);
    int expected = strncmp(str1, str2, n);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}


Test(strncmp, ko)
{
    const char *str1 = "PLAF";
    const char *str2 = "PLOUF";
    size_t n = 3;
    int got = my_strncmp(str1, str2, n);
    int expected = strncmp(str1, str2, n);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}


Test(strncmp, ko_n_sup)
{
    const char *str1 = "PLAF";
    const char *str2 = "PLOUF";
    size_t n = 2000;
    int got = my_strncmp(str1, str2, n);
    int expected = strncmp(str1, str2, n);

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}

Test(memcpy, test_tutorialspoint)
{
    const char src[50] = "http://www.tutorialspoint.com";
    char got[50];
    char expected[50];

    my_memcpy(got, src, strlen(src) + 1);
    memcpy(expected, src, strlen(src) + 1);

    cr_expect_str_eq(expected, got, "Got: %s | Expected: %s\n", got, expected);
}

Test(memset, test_tutorialspoint)
{
    char expected[50];
    char got[50];
    strcpy(expected,"This is string.h library function");
    strcpy(got,"This is string.h library function");


    memset(expected,'$',7);
    my_memset(got, '$', 7);
    cr_expect_str_eq(expected, got, "Got: %s | Expected: %s\n", got, expected);
}

Test(memmove, test_tutorialspoint)
{
    char expected[] = "Firststring";
    char got[] = "Firststring";
    const char b[] = "Secondstring";

    memmove(expected, b, 9);
    my_memmove(got, b, 9);
    cr_expect_str_eq(expected, got, "Got: %s | Expected: %s\n", got, expected);
}

Test(strcasecmp, min)
{
    char str1[] = "plouf";
    char str2[] = "plouf";
    char got = my_strcasecmp(str1, str2);
    char expected = strcasecmp(str1, str2);;

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}

Test(strcasecmp, maj)
{
    char str1[] = "PLOUF";
    char str2[] = "PLOUF";
    char got = my_strcasecmp(str1, str2);
    char expected = strcasecmp(str1, str2);;

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}

Test(strcasecmp, mix)
{
    char str1[] = "PlOuF";
    char str2[] = "PLOUF";
    char got = my_strcasecmp(str1, str2);
    char expected = strcasecmp(str1, str2);;

    cr_expect_eq(expected, got, "Got: %d | Expected: %d\n", got, expected);
}

Test(strchr, start)
{
    char str1[] = "PlOuF";
    char *got = my_strchr(str1, 'P');
    char *expected = strchr(str1, 'P');

    cr_expect_str_eq(expected, got, "Got: %s | Expected: %s\n", got, expected);
}

Test(strchr, mid)
{
    char str1[] = "PlOuF";
    char *got = my_strchr(str1, 'O');
    char *expected = strchr(str1, 'O');

    cr_expect_str_eq(expected, got, "Got: %s | Expected: %s\n", got, expected);
}

Test(strchr, end)
{
    char str1[] = "PlOuF";
    char *got = my_strchr(str1, '\0');
    char *expected = strchr(str1, '\0');

    cr_expect_str_eq(expected, got, "Got: %s | Expected: %s\n", got, expected);
}

Test(strchr, undefined)
{
    char str1[] = "PlOuF";
    char *got = my_strchr(str1, 'z');

    cr_expect_null(got);
}