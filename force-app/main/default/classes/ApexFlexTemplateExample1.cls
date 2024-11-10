public with sharing class ApexFlexTemplateExample1 {
     
    @InvocableMethod(
      // Matches the API Name of the template
      CapabilityType='FlexTemplate://mb_flex_1')
    public static List<Response> getPrompt(List<Request> requests) {
        Request input = requests[0];
        List<Response> responses = new List<Response>();
        Response output = new Response();
        responses.add(output);
   
        output.Prompt = 'generate a summary using the following info:';
        // account_1 matches the API Name for the input
        output.Prompt += '\nAccount 1: ' + input.account_1.Name;
        output.Prompt += '\nAccount 2: ' + input.account_2.Name;
        output.Prompt += '\nCase Number: ' + input.case_1.CaseNumber;

        return responses;
    }
 
    // Type and API Name of all variables must match the template
    public class Request {
        @InvocableVariable(required=true)
        public Account account_1;
        @InvocableVariable(required=true)
        public Account account_2;
        @InvocableVariable(required=true)
        public Case case_1;
    }

    public class Response {
        @InvocableVariable
        public String Prompt;
    }
}
