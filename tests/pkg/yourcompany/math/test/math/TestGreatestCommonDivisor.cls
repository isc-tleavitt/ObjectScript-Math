Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestGreatestCommonDivisor Extends %UnitTest.TestCase
{

Method TestTwoNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).GreatestCommonDivisor(252,105)
	Set tExpected=21
	Do $$$AssertEquals(tResults,tExpected,"Works with 2 numbers")
}

Method TestThreeNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).GreatestCommonDivisor(8,40,100)
	Set tExpected=4
	Do $$$AssertEquals(tResults,tExpected,"Works with 3 numbers")
}

Method TestTwoNumbersWithOne()
{
	Set tResults=##class(pkg.yourcompany.math.Math).GreatestCommonDivisor(1,15)
	Set tExpected=1
	Do $$$AssertEquals(tResults,tExpected,"Works with 2 numbers where one of them is 1")
}

Method TestThreeNumbersWithOne()
{
	Set tResults=##class(pkg.yourcompany.math.Math).GreatestCommonDivisor(1,8,15)
	Set tExpected=1
	Do $$$AssertEquals(tResults,tExpected,"Works with 3 numbers where one of them is 1")
}

Method TestZero()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).GreatestCommonDivisor(0,8)
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Cannot compute GreatestCommonDivisor of 0"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when 0 provided as an argument")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).GreatestCommonDivisor()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

Method TestShortMethod()
{
	Set tResults=##class(pkg.yourcompany.math.Math).GCD(8,40,100)
	Set tExpected=4
	Do $$$AssertEquals(tResults,tExpected,"Works with short name method")
}

Method TestLongMacro()
{
	Set tResults=$$$GreatestCommonDivisor(8,40,100)
	Set tExpected=4
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

Method TestShortMacro()
{
	Set tResults=$$$GCD(8,40,100)
	Set tExpected=4
	Do $$$AssertEquals(tResults,tExpected,"Works with short name macro")
}

}
