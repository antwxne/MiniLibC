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

