package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_738:String = "";
      
      public static const const_415:int = 0;
      
      public static const const_526:int = 255;
      
      public static const const_772:Boolean = false;
      
      public static const const_398:int = 0;
      
      public static const const_439:int = 0;
      
      public static const const_455:int = 0;
      
      public static const const_910:int = 1;
      
      public static const const_913:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_1934:String = "";
      
      private var var_1812:int = 0;
      
      private var var_1936:int = 255;
      
      private var var_1937:Boolean = false;
      
      private var var_1933:int = 0;
      
      private var var_1932:int = 0;
      
      private var var_1935:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_1934 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_1934;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1812 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1812;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_1936 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_1936;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_1937 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_1937;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_1933 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_1933;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_1932 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_1932;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_1935 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_1935;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
