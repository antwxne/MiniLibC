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