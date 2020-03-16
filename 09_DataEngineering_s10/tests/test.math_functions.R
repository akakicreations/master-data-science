context("Testeando Math functions")

test_that("Testear básico", expect_equal(fibonacci(1), 1))
test_that("Testear básico", expect_equal(fibonacci(4), 5))

context("Testeando otra cosa")

test_that("...", expect_error(fibonacci(0), 1))
