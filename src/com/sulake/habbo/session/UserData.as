package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_856:String = "";
      
      private var var_535:String = "";
      
      private var var_2139:String = "";
      
      private var var_2136:int;
      
      private var var_2142:int = 0;
      
      private var var_2138:String = "";
      
      private var var_2141:int = 0;
      
      private var var_2137:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2136;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2136 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_856;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_856 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_535 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2139;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2139 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2142;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2142 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2138;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2138 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2141;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2141 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2137;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2137 = param1;
      }
   }
}
