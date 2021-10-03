package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1119:String;
      
      private var var_1222:Array;
      
      private var var_992:Array;
      
      private var var_1693:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1119;
      }
      
      public function get choices() : Array
      {
         return this.var_1222.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_992.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1693;
      }
      
      public function flush() : Boolean
      {
         this.var_1119 = "";
         this.var_1222 = [];
         this.var_992 = [];
         this.var_1693 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1119 = param1.readString();
         this.var_1222 = [];
         this.var_992 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1222.push(param1.readString());
            this.var_992.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1693 = param1.readInteger();
         return true;
      }
   }
}
