Class pkg.yourcompany.math.test.utils.TestValidateInput Extends %UnitTest.TestCase
{

Method TestNull()
{
    Set tResult=##class(pkg.yourcompany.math.Utils).ValidateInput()
    Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when no argument provided")
}

Method TestEmptyString()
{
    Set tResult=##class(pkg.yourcompany.math.Utils).ValidateInput("")
    Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when empty string provided as input")
}

Method TestEmptyArray()
{
    Set tArray($I(tArray))=""
    Set tResult=##class(pkg.yourcompany.math.Utils).ValidateInput(tArray...)
    Set tResult=$SYSTEM.Status.GetErrorText(tResult)
	Set tExpected="ERROR #5001: Input must not be empty"
	Do $$$AssertEquals(tResult,tExpected,"Throws appropriate error when empty array provided as input")
}

Method TestNumber()
{
    Set tResult=##class(pkg.yourcompany.math.Utils).ValidateInput(17)
	Set tExpected=$$$OK
	Do $$$AssertEquals(tResult,tExpected,"Works with 1 number")
}

Method TestArray()
{
    Set tArray($I(tArray))=17
    Set tResult=##class(pkg.yourcompany.math.Utils).ValidateInput(tArray...)
	Set tExpected=$$$OK
	Do $$$AssertEquals(tResult,tExpected,"Works with array containing 1 number")
}

}
