Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestMin Extends %UnitTest.TestCase
{

Method TestOneNumber()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Min(58372)
	Set tExpected=58372
	Do $$$AssertEquals(tResults,tExpected,"Works with 1 number")
}

Method TestTwoNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Min(1847,9428)
	Set tExpected=1847
	Do $$$AssertEquals(tResults,tExpected,"Works with 2 numbers")
}

Method TestThreeNumbers()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Min(4748,10394,8374)
	Set tExpected=4748
	Do $$$AssertEquals(tResults,tExpected,"Works with 3 numbers")
}

Method TestOneNegative()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Min(4748,10394,-8374)
	Set tExpected=-8374
	Do $$$AssertEquals(tResults,tExpected,"Works with mix of positive and negative numbers")
}

Method TestAllNegative()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Min(-4748,-10394,-8374)
	Set tExpected=-10394
	Do $$$AssertEquals(tResults,tExpected,"Works with all negative numbers")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Min()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

Method TestMacro()
{
	Set tResults=$$$Min(15,32,91)
	Set tExpected=15
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

}
