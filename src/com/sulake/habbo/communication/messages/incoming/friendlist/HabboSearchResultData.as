package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2061:int;
      
      private var var_1628:String;
      
      private var var_2058:String;
      
      private var var_2060:Boolean;
      
      private var var_2063:Boolean;
      
      private var var_2062:int;
      
      private var var_2064:String;
      
      private var var_2059:String;
      
      private var var_1571:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2061 = param1.readInteger();
         this.var_1628 = param1.readString();
         this.var_2058 = param1.readString();
         this.var_2060 = param1.readBoolean();
         this.var_2063 = param1.readBoolean();
         param1.readString();
         this.var_2062 = param1.readInteger();
         this.var_2064 = param1.readString();
         this.var_2059 = param1.readString();
         this.var_1571 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2061;
      }
      
      public function get avatarName() : String
      {
         return this.var_1628;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2058;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2060;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2063;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2062;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2064;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2059;
      }
      
      public function get realName() : String
      {
         return this.var_1571;
      }
   }
}
