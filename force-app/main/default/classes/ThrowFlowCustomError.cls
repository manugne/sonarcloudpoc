public class ThrowFlowCustomError
{
    public class ThrowFlowCustomException extends Exception{}
    @InvocableMethod
    public static void throwCustomFlowException(FlowInputs[] flowInput)
    {
        throw createCustomException(flowInput[0].errorMessage);
    
    
    }
    
    public class FlowInputs
    {
        @InvocableVariable
        public String errorMessage;
    
    }
    
    static ThrowFlowCustomException createCustomException(String message)
    {
        ThrowFlowCustomException ex=new ThrowFlowCustomException();
        ex.setMessage(message);
        return ex;
    
    }

}