--HELLO WORLD OUTPUT

main :: IO ()
main = putStrLn "Hello, World!"



--IMMUTABILITY
--once a value is bound to a name, it cannot be changed

x :: Int
x = 5
-- You CANNOT do this in Haskell:
-- x = 6   -- this isn't "reassignment," it's a compile error (duplicate definition)
--SOLUTION
y :: Int
y = x + 1   -- y is 6, but x is still 5, unchanged

multiply :: Int -> Int -> Int
multiply x y = x * y

calculateTotal :: Int -> Int -> Int -> Int
calculateTotal price quantity tax = price * quantity + tax


main :: IO ()
main = do 
    print(multiply 6 7)
    print(calculateTotal 300 6 127) --haskell is layout sensitive
    
{-
    * same input will always give same output
 * no side effects, no print no I/O, no modifying the variable outside the function
  unlike main that gives the I/O- printing to the console which is a side effect
  -}

--REFERENTIAL TRANSAPRENCY
{-
 if a function always returns the same output for the same input and has no side effects,
 then any call to it is just a stand-in for a value, and you can swap one for the other freely.
 -}

cube :: Int -> Int
cube x = x * x * x

main :: IO ()
main = do 
    let result1=cube 3 + 20
    let result2=27 + 20
    
    print result1
    print result2

-- All two definitions above compute the same value, and you could
-- swap any one for another anywhere in the program with zero change in behavior.

--FIRST ORDER FUNCTIONS
--functions are treated like any other value in the language — an Int, a String, a Bool. You can:

--assign a function to a name
--pass a function as an argument
--return a function as a result
--store functions in a list


celsiusToFahrenheit :: Double -> Double
celsiusToFahrenheit c = c * 9 / 5 + 32

main :: IO ()
main = do
    let converter = celsiusToFahrenheit

    print (converter 20)
    print (converter 30)

--HIGER ORDER FUNCTIONS
-- Takes a function AND uses it — this is only possible because
-- functions are first-class (step 2) and safe to pass around
-- because they're pure/immutable (step 1)

applyDiscount :: (Double -> Double) -> Double -> Double
applyDiscount discount price = discount price

tenPercentOff :: Double -> Double
tenPercentOff price = price * 0.9

main :: IO ()
main = do
    print (applyDiscount tenPercentOff 1000)