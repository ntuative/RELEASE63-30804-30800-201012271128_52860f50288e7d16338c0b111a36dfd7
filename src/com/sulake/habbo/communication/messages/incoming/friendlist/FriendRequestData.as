package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1046:int;
      
      private var var_2502:String;
      
      private var var_2501:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1046 = param1.readInteger();
         this.var_2502 = param1.readString();
         this.var_2501 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1046;
      }
      
      public function get requesterName() : String
      {
         return this.var_2502;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2501;
      }
   }
}
