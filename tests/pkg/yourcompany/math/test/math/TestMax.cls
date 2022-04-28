Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestMax Extends %UnitTest.TestCase
{

Method TestOneNumber()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Max(58372)
	Set tExpected=58372
	Do $$$AssertEquals(tResults,tExpected,"Works with 1 number")
}

Method TestTwoNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Max(1847,9428)
	Set tExpected=9428
	Do $$$AssertEquals(tResults,tExpected,"Works with 2 numbers")
}

Method TestThreeNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Max(4748,10394,8374)
	Set tExpected=10394
	Do $$$AssertEquals(tResults,tExpected,"Works with 3 numbers")
}

Method TestOneNegative()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Max(4748,-10394,8374)
	Set tExpected=8374
	Do $$$AssertEquals(tResults,tExpected,"Works with mix of positive and negative numbers")
}

Method TestAllNegative()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Max(-4748,-10394,-8374)
	Set tExpected=-4748
	Do $$$AssertEquals(tResults,tExpected,"Works with all negative numbers")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Max()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

Method TestMacro()
{
	Set tResults=$$$Max(15,32,91)
	Set tExpected=91
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

}
