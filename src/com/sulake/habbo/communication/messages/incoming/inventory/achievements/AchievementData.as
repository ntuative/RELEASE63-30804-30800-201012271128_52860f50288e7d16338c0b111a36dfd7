package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1277:int;
      
      private var var_271:String;
      
      private var var_2363:int;
      
      private var var_2174:int;
      
      private var var_1566:int;
      
      private var var_2364:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1277 = param1.readInteger();
         this.var_271 = param1.readString();
         this.var_2363 = param1.readInteger();
         this.var_2174 = param1.readInteger();
         this.var_1566 = param1.readInteger();
         this.var_2364 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_271;
      }
      
      public function get level() : int
      {
         return this.var_1277;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2363;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2174;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1566;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2364;
      }
   }
}
