package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2459:Boolean = false;
      
      private var var_2457:int = 0;
      
      private var var_2458:int = 0;
      
      private var var_2073:int = 0;
      
      private var var_2066:int = 0;
      
      private var var_168:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_243:String = "";
      
      private var _type:int = 0;
      
      private var var_2705:String = "";
      
      private var var_1390:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_159:Boolean = false;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2459 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_159 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2459;
      }
      
      public function get wallX() : Number
      {
         return this.var_2457;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_159)
         {
            this.var_2457 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2458;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_159)
         {
            this.var_2458 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2073;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_159)
         {
            this.var_2073 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2066;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_159)
         {
            this.var_2066 = param1;
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
      
      public function get dir() : String
      {
         return this.var_243;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_159)
         {
            this.var_243 = param1;
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
   }
}
