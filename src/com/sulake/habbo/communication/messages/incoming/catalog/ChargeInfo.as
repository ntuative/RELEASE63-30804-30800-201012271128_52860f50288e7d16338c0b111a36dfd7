package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2473:int;
      
      private var var_2472:int;
      
      private var var_1089:int;
      
      private var var_1091:int;
      
      private var var_1487:int;
      
      private var var_2471:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2473 = param1.readInteger();
         this.var_2472 = param1.readInteger();
         this.var_1089 = param1.readInteger();
         this.var_1091 = param1.readInteger();
         this.var_1487 = param1.readInteger();
         this.var_2471 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2473;
      }
      
      public function get charges() : int
      {
         return this.var_2472;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1089;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1091;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2471;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1487;
      }
   }
}
