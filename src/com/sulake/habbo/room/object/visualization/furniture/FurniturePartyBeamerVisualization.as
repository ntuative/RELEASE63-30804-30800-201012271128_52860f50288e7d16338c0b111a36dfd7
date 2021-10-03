package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.geom.Point;
   
   public class FurniturePartyBeamerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_389:int = 2;
      
      private static const const_870:int = 15;
      
      private static const const_871:int = 31;
      
      private static const const_1206:int = 2;
      
      private static const ANIM_SPEED_SLOW:int = 1;
       
      
      private var var_1097:Array;
      
      private var var_1094:Array;
      
      private var var_1095:Array;
      
      private var var_1096:Array;
      
      private var var_710:Array;
      
      public function FurniturePartyBeamerVisualization()
      {
         this.var_710 = new Array();
         super();
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         var _loc2_:* = null;
         if(this.var_1095 == null)
         {
            this.initItems(param1);
         }
         _loc2_ = getSprite(2);
         if(_loc2_ != null)
         {
            this.var_710[0] = this.getNewPoint(0,param1);
         }
         _loc2_ = getSprite(3);
         if(_loc2_ != null)
         {
            this.var_710[1] = this.getNewPoint(1,param1);
         }
         return super.updateAnimation(param1);
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 == 2 || param1 == 3)
         {
            if(this.var_710.length == 2)
            {
               return this.var_710[param1 - 2].x;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(param1 == 2 || param1 == 3)
         {
            if(this.var_710.length == 2)
            {
               return this.var_710[param1 - 2].y;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      private function getNewPoint(param1:int, param2:Number) : Point
      {
         var _loc7_:int = 0;
         var _loc3_:Number = this.var_1097[param1];
         var _loc4_:int = this.var_1094[param1];
         var _loc5_:int = this.var_1095[param1];
         var _loc6_:Number = this.var_1096[param1];
         if(param2 == 32)
         {
            _loc7_ = const_870;
         }
         else
         {
            _loc7_ = const_871;
         }
         if(Math.abs(_loc3_ + _loc4_ * _loc5_) >= _loc7_)
         {
            _loc4_ = -_loc4_;
            this.var_1094[param1] = _loc4_;
         }
         var _loc8_:Number = (_loc7_ - Math.abs(_loc3_)) * _loc6_;
         var _loc9_:Number = _loc4_ * Math.sin(Math.abs(_loc3_ / 4)) * _loc8_;
         if(_loc4_ > 0)
         {
            _loc9_ -= _loc8_;
         }
         else
         {
            _loc9_ += _loc8_;
         }
         _loc3_ += _loc4_ * _loc5_;
         this.var_1097[param1] = _loc3_;
         if(int(_loc9_) == 0)
         {
            this.var_1096[param1] = this.getRandomAmplitudeFactor();
         }
         return new Point(_loc3_,_loc9_);
      }
      
      private function initItems(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 == 32)
         {
            _loc2_ = const_870;
         }
         else
         {
            _loc2_ = const_871;
         }
         this.var_1097 = new Array();
         this.var_1097.push(Math.random() * _loc2_ * 1.5);
         this.var_1097.push(Math.random() * _loc2_ * 1.5);
         this.var_1094 = new Array();
         this.var_1094.push(1);
         this.var_1094.push(-1);
         this.var_1095 = new Array();
         this.var_1095.push(const_1206);
         this.var_1095.push(ANIM_SPEED_SLOW);
         this.var_1096 = new Array();
         this.var_1096.push(this.getRandomAmplitudeFactor());
         this.var_1096.push(this.getRandomAmplitudeFactor());
      }
      
      private function getRandomAmplitudeFactor() : Number
      {
         return Math.random() * 30 / 100 + 0.15;
      }
   }
}
