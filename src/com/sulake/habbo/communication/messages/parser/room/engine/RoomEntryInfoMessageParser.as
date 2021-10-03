package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1630:Boolean;
      
      private var var_2279:int;
      
      private var var_364:Boolean;
      
      private var var_1056:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1630;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2279;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1056;
      }
      
      public function get owner() : Boolean
      {
         return this.var_364;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1056 != null)
         {
            this.var_1056.dispose();
            this.var_1056 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1630 = param1.readBoolean();
         if(this.var_1630)
         {
            this.var_2279 = param1.readInteger();
            this.var_364 = param1.readBoolean();
         }
         else
         {
            this.var_1056 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
