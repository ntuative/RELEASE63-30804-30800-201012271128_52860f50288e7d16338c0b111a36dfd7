package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_2130:Number = 0;
      
      private var var_2131:Number = 0;
      
      private var var_2132:Number = 0;
      
      private var include:Number = 0;
      
      private var var_243:int = 0;
      
      private var var_2134:int = 0;
      
      private var var_291:Array;
      
      private var var_2133:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_291 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_168 = param3;
         this.var_169 = param4;
         this.var_2130 = param5;
         this.var_243 = param6;
         this.var_2134 = param7;
         this.var_2131 = param8;
         this.var_2132 = param9;
         this.include = param10;
         this.var_2133 = param11;
         this.var_291 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_168;
      }
      
      public function get z() : Number
      {
         return this.var_169;
      }
      
      public function get localZ() : Number
      {
         return this.var_2130;
      }
      
      public function get targetX() : Number
      {
         return this.var_2131;
      }
      
      public function get targetY() : Number
      {
         return this.var_2132;
      }
      
      public function get targetZ() : Number
      {
         return this.include;
      }
      
      public function get dir() : int
      {
         return this.var_243;
      }
      
      public function get dirHead() : int
      {
         return this.var_2134;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2133;
      }
      
      public function get actions() : Array
      {
         return this.var_291.slice();
      }
   }
}
