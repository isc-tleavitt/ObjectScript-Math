Include pkg.yourcompany.math

Class pkg.yourcompany.math.test.math.TestCeiling Extends %UnitTest.TestCase
{

Method TestNegative()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Ceiling(-183.43)
	Set tExpected=-183
	Do $$$AssertEquals(tResults,tExpected,"Works with negative number")
}

Method TestPositive()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Ceiling(8394.6331)
	Set tExpected=8395
	Do $$$AssertEquals(tResults,tExpected,"Works with positive number")
}

Method TestOverHalf()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Ceiling(16.89)
	Set tExpected=17
	Do $$$AssertEquals(tResults,tExpected,"Works with over half decimal")
}

Method TestUnderHalf()
{
	Set tResults=##class(pkg.yourcompany.math.Math).Ceiling(16.29)
	Set tExpected=17
	Do $$$AssertEquals(tResults,tExpected,"Works with under half decimal")
}

Method TestMacro()
{
	Set tResults=$$$Ceiling(18374.17453)
	Set tExpected=18375
	Do $$$AssertEquals(tResults,tExpected,"Works with macro")
}

Method TestEmpty()
{
	Try {
		Set tResults=##class(pkg.yourcompany.math.Math).Ceiling()
	} Catch ex {
		Set tResults=$SYSTEM.Status.GetErrorText(ex.AsStatus())
	}
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResults,tExpected,"Throws appropriate error when no argument provided")
}

}
