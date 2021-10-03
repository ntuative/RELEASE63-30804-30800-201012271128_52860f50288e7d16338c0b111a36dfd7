package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_834:IAssetLoader;
      
      private var var_1489:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1489 = param1;
         this.var_834 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1489;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_834;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_834 != null)
            {
               if(!this.var_834.disposed)
               {
                  this.var_834.dispose();
                  this.var_834 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
