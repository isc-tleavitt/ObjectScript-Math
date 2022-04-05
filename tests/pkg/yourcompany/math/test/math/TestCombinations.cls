Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestCombinations Extends %UnitTest.TestCase
{

Method TestSimpleCases()
{
    // $$$Combinations(4,0) = 1
    // $$$Combinations(4,1) = 4
    // $$$Combinations(4,2) = 6
    // $$$Combinations(4,3) = 4
    // $$$Combinations(4,4) = 1
}

Method TestEdgeCases()
{
    // Test k > n
}

Method TestInvalidInput()
{
    // Test non-integer n, k
    // Test n < 0
    // Test k < 0
}

}