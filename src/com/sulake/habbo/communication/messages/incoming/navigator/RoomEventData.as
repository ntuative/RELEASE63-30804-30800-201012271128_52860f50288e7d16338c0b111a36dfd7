package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1017:Boolean;
      
      private var var_2110:int;
      
      private var var_2109:String;
      
      private var var_303:int;
      
      private var var_2111:int;
      
      private var var_2103:String;
      
      private var var_2107:String;
      
      private var var_2108:String;
      
      private var var_770:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_770 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1017 = false;
            return;
         }
         this.var_1017 = true;
         this.var_2110 = int(_loc2_);
         this.var_2109 = param1.readString();
         this.var_303 = int(param1.readString());
         this.var_2111 = param1.readInteger();
         this.var_2103 = param1.readString();
         this.var_2107 = param1.readString();
         this.var_2108 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_770.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_770 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2110;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2109;
      }
      
      public function get flatId() : int
      {
         return this.var_303;
      }
      
      public function get eventType() : int
      {
         return this.var_2111;
      }
      
      public function get eventName() : String
      {
         return this.var_2103;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2107;
      }
      
      public function get creationTime() : String
      {
         return this.var_2108;
      }
      
      public function get tags() : Array
      {
         return this.var_770;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1017;
      }
   }
}
