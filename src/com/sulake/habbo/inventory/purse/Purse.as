package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1674:int = 0;
      
      private var var_1675:int = 0;
      
      private var var_2547:int = 0;
      
      private var var_2546:Boolean = false;
      
      private var var_2351:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1674 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1675 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2547 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2546 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2351 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1674;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1675;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2547;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2546;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2351;
      }
   }
}
