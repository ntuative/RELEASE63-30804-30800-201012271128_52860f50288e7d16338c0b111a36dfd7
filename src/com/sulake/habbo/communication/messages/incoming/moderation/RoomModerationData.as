package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_303:int;
      
      private var var_1999:int;
      
      private var var_2478:Boolean;
      
      private var var_2088:int;
      
      private var _ownerName:String;
      
      private var var_103:RoomData;
      
      private var var_704:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_303 = param1.readInteger();
         this.var_1999 = param1.readInteger();
         this.var_2478 = param1.readBoolean();
         this.var_2088 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_103 = new RoomData(param1);
         this.var_704 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_103 != null)
         {
            this.var_103.dispose();
            this.var_103 = null;
         }
         if(this.var_704 != null)
         {
            this.var_704.dispose();
            this.var_704 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_303;
      }
      
      public function get userCount() : int
      {
         return this.var_1999;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2478;
      }
      
      public function get ownerId() : int
      {
         return this.var_2088;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_103;
      }
      
      public function get event() : RoomData
      {
         return this.var_704;
      }
   }
}
