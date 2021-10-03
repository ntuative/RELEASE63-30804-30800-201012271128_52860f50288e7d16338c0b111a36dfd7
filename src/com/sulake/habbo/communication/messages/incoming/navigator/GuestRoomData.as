package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_303:int;
      
      private var var_704:Boolean;
      
      private var var_783:String;
      
      private var _ownerName:String;
      
      private var var_1943:int;
      
      private var var_1999:int;
      
      private var var_2304:int;
      
      private var var_1469:String;
      
      private var var_2305:int;
      
      private var var_2307:Boolean;
      
      private var var_684:int;
      
      private var var_1237:int;
      
      private var var_2306:String;
      
      private var var_770:Array;
      
      private var var_2303:RoomThumbnailData;
      
      private var var_1942:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_770 = new Array();
         super();
         this.var_303 = param1.readInteger();
         this.var_704 = param1.readBoolean();
         this.var_783 = param1.readString();
         this._ownerName = param1.readString();
         this.var_1943 = param1.readInteger();
         this.var_1999 = param1.readInteger();
         this.var_2304 = param1.readInteger();
         this.var_1469 = param1.readString();
         this.var_2305 = param1.readInteger();
         this.var_2307 = param1.readBoolean();
         this.var_684 = param1.readInteger();
         this.var_1237 = param1.readInteger();
         this.var_2306 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_770.push(_loc4_);
            _loc3_++;
         }
         this.var_2303 = new RoomThumbnailData(param1);
         this.var_1942 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_303;
      }
      
      public function get event() : Boolean
      {
         return this.var_704;
      }
      
      public function get roomName() : String
      {
         return this.var_783;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_1943;
      }
      
      public function get userCount() : int
      {
         return this.var_1999;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2304;
      }
      
      public function get description() : String
      {
         return this.var_1469;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2305;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2307;
      }
      
      public function get score() : int
      {
         return this.var_684;
      }
      
      public function get categoryId() : int
      {
         return this.var_1237;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2306;
      }
      
      public function get tags() : Array
      {
         return this.var_770;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2303;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_1942;
      }
   }
}
