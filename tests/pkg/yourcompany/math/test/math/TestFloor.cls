Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestFloor Extends %UnitTest.TestCase
{

Method TestNegative()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Floor(-183.43)
	Set tExpected=-184
	Do $$$AssertEquals(tResults,tExpected,"Works with negative number")
}

Method TestPositive()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Floor(8394.6331)
	Set tExpected=8394
	Do $$$AssertEquals(tResults,tExpected,"Works with positive number")
}

Method TestOverHalf()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Floor(16.89)
	Set tExpected=16
	Do $$$AssertEquals(tResults,tExpected,"Works with over half decimal point")
}

Method TestUnderHalf()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Floor(16.29)
	Set tExpected=16
	Do $$$AssertEquals(tResults,tExpected,"Works with under half decimal point")
}

Method TestMacro()
{
	Set tResults=$$$Floor(18374.17453)
	Set tExpected=18374
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Floor()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

}
