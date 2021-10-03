package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1216:Boolean;
      
      private var var_2592:int;
      
      private var var_1846:int;
      
      private var var_1845:int;
      
      private var var_2593:int;
      
      private var var_2594:int;
      
      private var var_2591:int;
      
      private var var_2231:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1216;
      }
      
      public function get commission() : int
      {
         return this.var_2592;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1846;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1845;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2594;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2593;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2591;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2231;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1216 = param1.readBoolean();
         this.var_2592 = param1.readInteger();
         this.var_1846 = param1.readInteger();
         this.var_1845 = param1.readInteger();
         this.var_2594 = param1.readInteger();
         this.var_2593 = param1.readInteger();
         this.var_2591 = param1.readInteger();
         this.var_2231 = param1.readInteger();
         return true;
      }
   }
}
