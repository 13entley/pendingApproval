@IsTest(SeeAllData=true)
public with sharing class TEST_AccountController2 {

    @IsTest
    public static void test_getApprovalCount(){
        String activeAppProcess = [SELECT ProcessDefinitionId FROM ProcessInstance];
		Approval.ProcessSubmitRequest app = new Approval.ProcessSubmitRequest();
		app.setObjectId(Account.id);
		Approval.ProcessResult result = Approval.process(app);
		Test.startTest();
        Integer result = AccountController2.getApprovalCount();
        Test.stopTest();
        System.assertEquals(result, 1);

    @IsTest
    public static String test_getUserFirstName(){
        Id userId = UserInfo.getUserId();

        List<User> userList = [SELECT Id, FirstName FROM User WHERE Id =: userId];
        Test.startTest();
        String returnedName = AccountController2.getFirstName();
        Test.stopTest();
        System.assertEquals(returnedName, 'Eric');

    }
}