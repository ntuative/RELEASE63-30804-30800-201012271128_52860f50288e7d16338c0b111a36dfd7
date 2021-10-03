package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1517:String = "";
      
      private var var_1551:String = "";
      
      private var var_2068:String = "";
      
      private var var_2069:Number = 0;
      
      private var var_2067:Number = 0;
      
      private var var_2073:Number = 0;
      
      private var var_2066:Number = 0;
      
      private var var_2072:Boolean = false;
      
      private var var_2071:Boolean = false;
      
      private var var_2070:Boolean = false;
      
      private var var_2065:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1517 = param2;
         this.var_1551 = param3;
         this.var_2068 = param4;
         this.var_2069 = param5;
         this.var_2067 = param6;
         this.var_2073 = param7;
         this.var_2066 = param8;
         this.var_2072 = param9;
         this.var_2071 = param10;
         this.var_2070 = param11;
         this.var_2065 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1517;
      }
      
      public function get canvasId() : String
      {
         return this.var_1551;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2068;
      }
      
      public function get screenX() : Number
      {
         return this.var_2069;
      }
      
      public function get screenY() : Number
      {
         return this.var_2067;
      }
      
      public function get localX() : Number
      {
         return this.var_2073;
      }
      
      public function get localY() : Number
      {
         return this.var_2066;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2072;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2071;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2070;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2065;
      }
   }
}
