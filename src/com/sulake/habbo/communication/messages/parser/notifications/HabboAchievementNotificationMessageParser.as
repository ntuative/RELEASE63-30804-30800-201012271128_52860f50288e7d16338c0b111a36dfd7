package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1277:int;
      
      private var var_1636:int;
      
      private var var_2174:int;
      
      private var var_1566:int;
      
      private var var_1276:int;
      
      private var var_1987:String = "";
      
      private var var_2404:String = "";
      
      private var var_2405:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1277 = param1.readInteger();
         this.var_1987 = param1.readString();
         this.var_1636 = param1.readInteger();
         this.var_2174 = param1.readInteger();
         this.var_1566 = param1.readInteger();
         this.var_1276 = param1.readInteger();
         this.var_2405 = param1.readInteger();
         this.var_2404 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1277;
      }
      
      public function get points() : int
      {
         return this.var_1636;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2174;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1566;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1276;
      }
      
      public function get badgeID() : String
      {
         return this.var_1987;
      }
      
      public function get achievementID() : int
      {
         return this.var_2405;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2404;
      }
   }
}
