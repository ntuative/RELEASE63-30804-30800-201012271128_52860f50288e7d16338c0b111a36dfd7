package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_837:int = 3;
       
      
      private var var_2194:int = -1;
      
      private var var_2189:int = -2;
      
      private var var_319:Vector3d = null;
      
      private var var_377:Vector3d = null;
      
      private var var_2187:Boolean = false;
      
      private var var_2193:Boolean = false;
      
      private var var_2188:Boolean = false;
      
      private var var_2185:Boolean = false;
      
      private var var_2190:int = 0;
      
      private var var_2191:int = 0;
      
      private var var_2186:int = 0;
      
      private var var_2192:int = 0;
      
      private var var_1283:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_377;
      }
      
      public function get targetId() : int
      {
         return this.var_2194;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2189;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2187;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2193;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2188;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2185;
      }
      
      public function get screenWd() : int
      {
         return this.var_2190;
      }
      
      public function get screenHt() : int
      {
         return this.var_2191;
      }
      
      public function get roomWd() : int
      {
         return this.var_2186;
      }
      
      public function get roomHt() : int
      {
         return this.var_2192;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2194 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2189 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2187 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2193 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2188 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2185 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2190 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2191 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2186 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2192 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_319 == null)
         {
            this.var_319 = new Vector3d();
         }
         if(this.var_319.x != param1.x || this.var_319.y != param1.y || this.var_319.z != param1.z)
         {
            this.var_319.assign(param1);
            this.var_1283 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_319 = null;
         this.var_377 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_377 != null)
         {
            return;
         }
         this.var_377 = new Vector3d();
         this.var_377.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_319 != null && this.var_377 != null)
         {
            ++this.var_1283;
            _loc4_ = Vector3d.dif(this.var_319,this.var_377);
            if(_loc4_.length <= param2)
            {
               this.var_377 = this.var_319;
               this.var_319 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_837 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1283 <= const_837)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_377 = Vector3d.sum(this.var_377,_loc4_);
            }
         }
      }
   }
}
