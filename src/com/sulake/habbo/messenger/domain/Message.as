package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_588:int = 1;
      
      public static const const_669:int = 2;
      
      public static const const_807:int = 3;
      
      public static const const_1000:int = 4;
      
      public static const const_626:int = 5;
      
      public static const const_1041:int = 6;
       
      
      private var _type:int;
      
      private var var_1146:int;
      
      private var var_1918:String;
      
      private var var_2580:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1146 = param2;
         this.var_1918 = param3;
         this.var_2580 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_1918;
      }
      
      public function get time() : String
      {
         return this.var_2580;
      }
      
      public function get senderId() : int
      {
         return this.var_1146;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
