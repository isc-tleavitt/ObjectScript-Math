Class pkg.yourcompany.math.test.utils.TestValidateRange Extends %UnitTest.TestCase
{

Method TestAllNull()
{
	Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange()
  Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when no argument provided")
}

Method TestValueNull()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(,2,8)
  Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when an first argument is empty")
}

Method TestMinNull()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(18,,49)
  Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when second argument is empty")
}

Method TestMaxNull()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(14,2)
  Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when third argument is empty")
}

Method TestPositiveValue()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(14,1,20)
	Set tExpected=$$$OK
	Do $$$AssertEquals(tResult,tExpected,"Works with positive values")
}

Method TestNegativeValue()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(-15,-20,-10)
	Set tExpected=$$$OK
	Do $$$AssertEquals(tResult,tExpected,"Works with negative values")
}

Method TestTooLow()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(20,50,100)
  Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Value out of range"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when value is out of range - too low")
}

Method TestTooHigh()
{
  Set tResult=##class(pkg.yourcompany.math.Utils).ValidateRange(100,0,20)
  Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Value out of range"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when value is out of range - too low")
}

}
