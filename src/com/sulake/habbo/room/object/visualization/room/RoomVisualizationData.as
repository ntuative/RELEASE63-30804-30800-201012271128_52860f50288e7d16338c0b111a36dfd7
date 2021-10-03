package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_447:WallRasterizer;
      
      private var var_446:FloorRasterizer;
      
      private var var_665:WallAdRasterizer;
      
      private var var_448:LandscapeRasterizer;
      
      private var var_666:PlaneMaskManager;
      
      private var var_746:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_447 = new WallRasterizer();
         this.var_446 = new FloorRasterizer();
         this.var_665 = new WallAdRasterizer();
         this.var_448 = new LandscapeRasterizer();
         this.var_666 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_746;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_446;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_447;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_665;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_448;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_666;
      }
      
      public function dispose() : void
      {
         if(this.var_447 != null)
         {
            this.var_447.dispose();
            this.var_447 = null;
         }
         if(this.var_446 != null)
         {
            this.var_446.dispose();
            this.var_446 = null;
         }
         if(this.var_665 != null)
         {
            this.var_665.dispose();
            this.var_665 = null;
         }
         if(this.var_448 != null)
         {
            this.var_448.dispose();
            this.var_448 = null;
         }
         if(this.var_666 != null)
         {
            this.var_666.dispose();
            this.var_666 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_447 != null)
         {
            this.var_447.clearCache();
         }
         if(this.var_446 != null)
         {
            this.var_446.clearCache();
         }
         if(this.var_448 != null)
         {
            this.var_448.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_447.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_446.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_665.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_448.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_666.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_746)
         {
            return;
         }
         this.var_447.initializeAssetCollection(param1);
         this.var_446.initializeAssetCollection(param1);
         this.var_665.initializeAssetCollection(param1);
         this.var_448.initializeAssetCollection(param1);
         this.var_666.initializeAssetCollection(param1);
         this.var_746 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
