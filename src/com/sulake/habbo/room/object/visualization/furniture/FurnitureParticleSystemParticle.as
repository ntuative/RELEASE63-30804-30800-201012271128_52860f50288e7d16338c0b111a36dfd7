package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var _x:Number;
      
      private var var_168:Number;
      
      private var var_169:Number;
      
      private var var_1740:Number;
      
      private var var_1742:Number;
      
      private var var_1743:Number;
      
      private var var_1107:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_479:int = 0;
      
      private var var_885:int;
      
      private var var_2469:Boolean = false;
      
      private var var_1744:Boolean = false;
      
      private var var_1741:Number;
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var _frames:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get fade() : Boolean
      {
         return this.var_1744;
      }
      
      public function get alphaMultiplier() : Number
      {
         return this._alphaMultiplier;
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function get age() : int
      {
         return this.var_479;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null, param10:Boolean = false) : void
      {
         this._x = param1;
         this.var_168 = param2;
         this.var_169 = param3;
         this._direction = new Vector3D(param4.x,param4.y,param4.z);
         this._direction.scaleBy(param5);
         this.var_1740 = this._x - this._direction.x * param6;
         this.var_1742 = this.var_168 - this._direction.y * param6;
         this.var_1743 = this.var_169 - this._direction.z * param6;
         this.var_479 = 0;
         this.var_1107 = false;
         this.var_885 = param7;
         this.var_2469 = param8;
         this._frames = param9;
         this.var_1744 = param10;
         this._alphaMultiplier = 1;
         this.var_1741 = 0.5 + Math.random() * 0.5;
      }
      
      public function update() : void
      {
         ++this.var_479;
         if(this.var_479 == this.var_885)
         {
            this.ignite();
         }
         if(this.var_1744)
         {
            if(this.var_479 / this.var_885 > this.var_1741)
            {
               this._alphaMultiplier = (this.var_885 - this.var_479) / (this.var_885 * (1 - this.var_1741));
            }
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(this._frames && this._frames.length > 0)
         {
            return this._frames[this.var_479 % this._frames.length];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return this.var_2469;
      }
      
      public function get isAlive() : Boolean
      {
         return this.var_479 <= this.var_885;
      }
      
      public function dispose() : void
      {
         this._direction = null;
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
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_168 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_169 = param1;
      }
      
      public function get lastX() : Number
      {
         return this.var_1740;
      }
      
      public function set lastX(param1:Number) : void
      {
         this.var_1107 = true;
         this.var_1740 = param1;
      }
      
      public function get lastY() : Number
      {
         return this.var_1742;
      }
      
      public function set lastY(param1:Number) : void
      {
         this.var_1107 = true;
         this.var_1742 = param1;
      }
      
      public function get lastZ() : Number
      {
         return this.var_1743;
      }
      
      public function set lastZ(param1:Number) : void
      {
         this.var_1107 = true;
         this.var_1743 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return this.var_1107;
      }
      
      public function toString() : String
      {
         return [this._x,this.var_168,this.var_169].toString();
      }
   }
}
