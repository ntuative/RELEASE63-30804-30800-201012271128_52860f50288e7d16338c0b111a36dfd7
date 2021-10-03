package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_919:RoomObjectLocationCacheItem = null;
      
      private var var_179:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_919 = new RoomObjectLocationCacheItem(param1);
         this.var_179 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_919;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_179;
      }
      
      public function dispose() : void
      {
         if(this.var_919 != null)
         {
            this.var_919.dispose();
            this.var_919 = null;
         }
         if(this.var_179 != null)
         {
            this.var_179.dispose();
            this.var_179 = null;
         }
      }
   }
}
