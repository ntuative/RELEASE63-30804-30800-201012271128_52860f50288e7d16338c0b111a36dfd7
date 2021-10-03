package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2029:String;
      
      private var var_1968:int;
      
      private var var_2028:int;
      
      private var var_1967:String;
      
      private var var_2128:int;
      
      private var var_1590:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2029 = param1.readString();
         this.var_1968 = param1.readInteger();
         this.var_2028 = param1.readInteger();
         this.var_1967 = param1.readString();
         this.var_2128 = param1.readInteger();
         this.var_1590 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2029;
      }
      
      public function get unitPort() : int
      {
         return this.var_1968;
      }
      
      public function get worldId() : int
      {
         return this.var_2028;
      }
      
      public function get castLibs() : String
      {
         return this.var_1967;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2128;
      }
      
      public function get nodeId() : int
      {
         return this.var_1590;
      }
   }
}
