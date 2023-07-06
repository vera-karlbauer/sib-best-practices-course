library(testthat)
local_edition(3)

source("fizz_buzz.R")

test_that("Check for regular", {
  expect_identical(fizz_buzz(1), ("1"))
  expect_identical(fizz_buzz(2), ("2"))
  expect_identical(fizz_buzz(4), ("4"))
  expect_identical(fizz_buzz(7), ("7"))
})

test_that("Check for fizz", {
  expect_identical(fizz_buzz(3), ("fizz"))
  expect_identical(fizz_buzz(6), ("fizz"))
  expect_snapshot_value(fizz_buzz(36))
})

test_that("Check for buzz", {
  expect_identical(fizz_buzz(5), ("buzz"))
  expect_identical(fizz_buzz(10), ("buzz"))
})

test_that("Check for fizzbuzz", {
  expect_identical(fizz_buzz(15), ("fizz_buzz"))
  expect_identical(fizz_buzz(30), ("fizz_buzz"))
})

test_that("Expect for buzz", {expect_snapshot(print(6))})
