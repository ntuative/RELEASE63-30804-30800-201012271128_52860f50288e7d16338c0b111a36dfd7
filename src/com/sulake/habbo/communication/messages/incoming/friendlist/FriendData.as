package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_790:int;
      
      private var var_687:Boolean;
      
      private var var_1570:Boolean;
      
      private var var_535:String;
      
      private var var_1237:int;
      
      private var var_1569:String;
      
      private var var_1572:String;
      
      private var var_1571:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_790 = param1.readInteger();
         this.var_687 = param1.readBoolean();
         this.var_1570 = param1.readBoolean();
         this.var_535 = param1.readString();
         this.var_1237 = param1.readInteger();
         this.var_1569 = param1.readString();
         this.var_1572 = param1.readString();
         this.var_1571 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_790;
      }
      
      public function get online() : Boolean
      {
         return this.var_687;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1570;
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function get categoryId() : int
      {
         return this.var_1237;
      }
      
      public function get motto() : String
      {
         return this.var_1569;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1572;
      }
      
      public function get realName() : String
      {
         return this.var_1571;
      }
   }
}
