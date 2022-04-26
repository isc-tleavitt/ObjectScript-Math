Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestCombinations Extends %UnitTest.TestCase
{

Method TestSimpleCases()
{
    // Do $$$AssertEquals($$$Combinations(4,1),4)
    // Do $$$AssertEquals($$$Combinations(4,2),6)
    // Do $$$AssertEquals($$$Combinations(4,3),4)
}

Method TestEdgeCases()
{
    // Do $$$AssertEquals($$$Combinations(4,0),1)

    /* 
     * $$$Combinations(4,4) will fail.
     * Hint: What is 0!? What does pkg.yourcompany.math.Math:Factorial say it is?
     */
    
    // Do $$$AssertEquals($$$Combinations(4,4),1)

    /*
     * Advanced:
     * Test (and fix) k > n
     */
    
}

Method TestInvalidInput()
{
    /*
     * Advanced:
     * - Test (and fix) non-integer n, k
     * - Test (and fix) n < 0
     * - Test (and fix) k < 0
     */
}

}