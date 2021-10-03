package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2242:int;
      
      private var var_2244:int;
      
      private var var_2241:int;
      
      private var var_2243:String;
      
      private var var_1782:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2242 = param1.readInteger();
         this.var_2244 = param1.readInteger();
         this.var_2241 = param1.readInteger();
         this.var_2243 = param1.readString();
         this.var_1782 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2242;
      }
      
      public function get minute() : int
      {
         return this.var_2244;
      }
      
      public function get chatterId() : int
      {
         return this.var_2241;
      }
      
      public function get chatterName() : String
      {
         return this.var_2243;
      }
      
      public function get msg() : String
      {
         return this.var_1782;
      }
   }
}
