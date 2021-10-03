package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_842:int = 10;
      
      private static const const_552:int = 20;
      
      private static const const_1173:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
       
      
      private var var_282:Array;
      
      private var var_688:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_282 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_688)
            {
               this.var_688 = true;
               this.var_282 = new Array();
               this.var_282.push(const_1173);
               this.var_282.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_842)
         {
            if(this.var_688)
            {
               this.var_688 = false;
               this.var_282 = new Array();
               this.var_282.push(const_842 + param1);
               this.var_282.push(const_552 + param1);
               this.var_282.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_282.length > 0)
            {
               super.setAnimation(this.var_282.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
