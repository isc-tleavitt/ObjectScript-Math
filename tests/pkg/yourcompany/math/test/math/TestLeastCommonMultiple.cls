Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestLeastCommonMultiple Extends %UnitTest.TestCase
{

Method TestTwoNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple(3,8)
	Set tExpected=24
	Do $$$AssertEquals(tResults,tExpected,"Works with 2 numbers")
}

Method TestThreeNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple(7,3,8)
	Set tExpected=168
	Do $$$AssertEquals(tResults,tExpected,"Works with 3 numbers")
}

Method TestTwoNumbersWithOne()
{
	Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple(1,15)
	Set tExpected=15
	Do $$$AssertEquals(tResults,tExpected,"Works with 2 numbers where one of them is 1")
}

Method TestThreeNumbersWithOne()
{
	Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple(1,8,15)
	Set tExpected=120
	Do $$$AssertEquals(tResults,tExpected,"Works with 3 numbers where one of them is 1")
}

Method TestZero()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple(0,8)
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Cannot compute LeastCommonMultiple of 0"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when 0 provided as an argument")
}

Method TestLarge()
{
	Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple(58372,94382,38942)
	Set tExpected=53635460155492
	Do $$$AssertEquals(tResults,tExpected,"Works with large numbers")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).LeastCommonMultiple()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

Method TestShortMethod()
{
	Set tResults=##class(pkg.yourcompany.math.Math).LCM(7,3,8)
	Set tExpected=168
	Do $$$AssertEquals(tResults,tExpected,"Works with short name method")
}

Method TestLongMacro()
{
	Set tResults=$$$LeastCommonMultiple(15,32,91)
	Set tExpected=43680
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

Method TestShortMacro()
{
	Set tResults=$$$LCM(15,32,91)
	Set tExpected=43680
	Do $$$AssertEquals(tResults,tExpected,"Works with short name macro")
}

}
