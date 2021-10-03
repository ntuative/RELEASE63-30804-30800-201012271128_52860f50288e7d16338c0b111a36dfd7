package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1008:String = "M";
      
      public static const const_1261:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_243:int = 0;
      
      private var _name:String = "";
      
      private var var_2140:int = 0;
      
      private var var_856:String = "";
      
      private var var_535:String = "";
      
      private var var_2139:String = "";
      
      private var var_2136:int;
      
      private var var_2142:int = 0;
      
      private var var_2138:String = "";
      
      private var var_2141:int = 0;
      
      private var var_2137:int = 0;
      
      private var var_2135:String = "";
      
      private var var_159:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_159 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_159)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_168;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_159)
         {
            this.var_168 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_169;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_159)
         {
            this.var_169 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_243;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_243 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_159)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2140;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_2140 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_856;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_856 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_535;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_535 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2139;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_2139 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2136;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_2136 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2142;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_2142 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2138;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_2138 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2141;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_2141 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2137;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_2137 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2135;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_2135 = param1;
         }
      }
   }
}
