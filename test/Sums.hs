module Sums where

import Test.QuickCheck
-- import Test.QuickCheck.Gen (oneof)

data Sum a b = First a | Second b deriving (Eq, Show)

sumGenEqual :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenEqual = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ First a, return $ Second b]

sumGenFirstPlease :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenFirstPlease = do
  a <- arbitrary
  b <- arbitrary
  frequency [(10, return $ First a), (1, return $ Second b)]

sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenFirstPlease

-- instance (Arbitrary a, Arbitrary b) => Arbitrary (Sum a b) where
--   arbitrary = sumGenEqual

main :: IO ()
main = do
  sample sumGenCharInt