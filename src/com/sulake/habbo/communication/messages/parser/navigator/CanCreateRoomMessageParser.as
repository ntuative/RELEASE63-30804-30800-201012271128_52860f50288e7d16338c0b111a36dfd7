package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomMessageParser implements IMessageParser
   {
      
      public static const const_1703:int = 0;
      
      public static const const_1603:int = 1;
       
      
      private var var_1559:int;
      
      private var var_2431:int;
      
      public function CanCreateRoomMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1559 = param1.readInteger();
         this.var_2431 = param1.readInteger();
         return true;
      }
      
      public function get resultCode() : int
      {
         return this.var_1559;
      }
      
      public function get roomLimit() : int
      {
         return this.var_2431;
      }
   }
}
