package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1809:int;
      
      private var var_2529:int;
      
      private var var_1288:int;
      
      private var var_2057:int;
      
      private var var_103:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1809 = param1.readInteger();
         this.var_2529 = param1.readInteger();
         this.var_1288 = param1.readInteger();
         this.var_2057 = param1.readInteger();
         this.var_103 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1809);
      }
      
      public function get callId() : int
      {
         return this.var_1809;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2529;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1288;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2057;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_103;
      }
   }
}
