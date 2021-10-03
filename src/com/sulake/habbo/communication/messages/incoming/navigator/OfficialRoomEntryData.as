package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_951:int = 1;
      
      public static const const_788:int = 2;
      
      public static const const_792:int = 3;
      
      public static const const_1469:int = 4;
       
      
      private var _index:int;
      
      private var var_1997:String;
      
      private var var_1996:String;
      
      private var var_1998:Boolean;
      
      private var var_1995:String;
      
      private var var_908:String;
      
      private var var_2000:int;
      
      private var var_1999:int;
      
      private var _type:int;
      
      private var var_1934:String;
      
      private var var_800:GuestRoomData;
      
      private var var_801:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_1997 = param1.readString();
         this.var_1996 = param1.readString();
         this.var_1998 = param1.readInteger() == 1;
         this.var_1995 = param1.readString();
         this.var_908 = param1.readString();
         this.var_2000 = param1.readInteger();
         this.var_1999 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_951)
         {
            this.var_1934 = param1.readString();
         }
         else if(this._type == const_792)
         {
            this.var_801 = new PublicRoomData(param1);
         }
         else if(this._type == const_788)
         {
            this.var_800 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_800 != null)
         {
            this.var_800.dispose();
            this.var_800 = null;
         }
         if(this.var_801 != null)
         {
            this.var_801.dispose();
            this.var_801 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_1997;
      }
      
      public function get popupDesc() : String
      {
         return this.var_1996;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_1998;
      }
      
      public function get picText() : String
      {
         return this.var_1995;
      }
      
      public function get picRef() : String
      {
         return this.var_908;
      }
      
      public function get folderId() : int
      {
         return this.var_2000;
      }
      
      public function get tag() : String
      {
         return this.var_1934;
      }
      
      public function get userCount() : int
      {
         return this.var_1999;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_800;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_801;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_951)
         {
            return 0;
         }
         if(this.type == const_788)
         {
            return this.var_800.maxUserCount;
         }
         if(this.type == const_792)
         {
            return this.var_801.maxUsers;
         }
         return 0;
      }
   }
}
