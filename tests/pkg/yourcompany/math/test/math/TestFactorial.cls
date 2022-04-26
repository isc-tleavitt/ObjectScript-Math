Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestFactorial Extends %UnitTest.TestCase
{

Method TestSmall()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Factorial(6)
	Set tExpected=720
	Do $$$AssertEquals(tResults,tExpected,"Works with small number: 6")
}

Method TestMax()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Factorial(23)
	Set tExpected=25852016738884976640000
	Do $$$AssertEquals(tResults,tExpected,"Works with large number: 23")
}

Method TestTooLarge()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Factorial(35)
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Value out of range"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when value out of range")
}

Method TestTooSmall()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Factorial(-35)
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Value out of range"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when value out of range")
}

Method TestOne()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Factorial(1)
	Set tExpected=1
	Do $$$AssertEquals(tResults,tExpected,"Works with base case: 1")
}

Method TestZero()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Factorial(0)
	Set tExpected=0
	Do $$$AssertEquals(tResults,tExpected,"Works with base case: 0")
}

Method TestNegativeEven()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Factorial(-16)
	Set tExpected=-20922789888000
	Do $$$AssertEquals(tResults,tExpected,"Works with negative even number: -16")
}

Method TestNegativeOdd()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Factorial(-15)
	Set tExpected=-1307674368000
	Do $$$AssertEquals(tResults,tExpected,"Works with negative odd number: -15")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Factorial()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

Method TestMacro()
{
	Set tResults=$$$Factorial(16)
	Set tExpected=20922789888000
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

}
