package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1793:int = 0;
      
      private var var_1794:int = 0;
      
      private var var_1487:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1793;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1794;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1487;
      }
      
      public function flush() : Boolean
      {
         this.var_1793 = 0;
         this.var_1794 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1793 = param1.readInteger();
         this.var_1794 = param1.readInteger();
         this.var_1487 = param1.readInteger();
         return true;
      }
   }
}
