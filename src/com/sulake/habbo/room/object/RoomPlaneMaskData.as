package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2096:Number = 0.0;
      
      private var var_2097:Number = 0.0;
      
      private var var_2420:Number = 0.0;
      
      private var var_2421:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2096 = param1;
         this.var_2097 = param2;
         this.var_2420 = param3;
         this.var_2421 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2096;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2097;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2420;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2421;
      }
   }
}
