package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_418:int = 0;
       
      
      private var var_2275:int = 0;
      
      private var var_1336:Dictionary;
      
      private var var_1674:int = 0;
      
      private var var_1675:int = 0;
      
      private var var_2351:Boolean = false;
      
      private var var_2350:int = 0;
      
      private var var_2352:int = 0;
      
      public function Purse()
      {
         this.var_1336 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2275;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2275 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1674;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1674 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1675;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1675 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1674 > 0 || this.var_1675 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2351;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2351 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2350;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2350 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2352;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2352 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1336;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1336 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1336[param1];
      }
   }
}
