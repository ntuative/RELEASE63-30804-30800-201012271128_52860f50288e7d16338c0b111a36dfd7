package com.sulake.habbo.communication.messages.parser.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AchievementsScoreMessageParser implements IMessageParser
   {
       
      
      private var var_684:int;
      
      public function AchievementsScoreMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_684 = param1.readInteger();
         return true;
      }
      
      public function get score() : int
      {
         return this.var_684;
      }
   }
}
