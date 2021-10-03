package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2115:int;
      
      private var var_2118:int;
      
      private var var_2120:int;
      
      private var var_2119:int;
      
      private var var_2116:int;
      
      private var var_2117:int;
      
      private var var_92:Array;
      
      private var var_200:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_92 = new Array();
         this.var_200 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2115 = param1.readInteger();
         this.var_2118 = param1.readInteger();
         this.var_2120 = param1.readInteger();
         this.var_2119 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_92.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_200.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2116 = param1.readInteger();
         this.var_2117 = param1.readInteger();
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2115;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2118;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2120;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2116;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2117;
      }
      
      public function get categories() : Array
      {
         return this.var_92;
      }
      
      public function get friends() : Array
      {
         return this.var_200;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2119;
      }
   }
}
