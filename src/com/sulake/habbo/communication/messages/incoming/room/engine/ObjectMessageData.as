package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_243:int = 0;
      
      private var var_465:int = 0;
      
      private var var_584:int = 0;
      
      private var _type:int = 0;
      
      private var var_2705:String = "";
      
      private var var_1390:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2008:int = 0;
      
      private var var_2009:String = null;
      
      private var var_159:Boolean = false;
      
      public function ObjectMessageData(param1:int)
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
      
      public function get sizeX() : int
      {
         return this.var_465;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_465 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_584;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_584 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_159)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_159)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_159)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2009;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_2009 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1390;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_1390 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2008;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_159)
         {
            this.var_2008 = param1;
         }
      }
   }
}
