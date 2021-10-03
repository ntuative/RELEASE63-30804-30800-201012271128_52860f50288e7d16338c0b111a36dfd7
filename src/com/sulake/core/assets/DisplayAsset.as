package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_942:String;
      
      protected var var_153:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_768:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_768 = param1;
         this.var_942 = param2;
      }
      
      public function get url() : String
      {
         return this.var_942;
      }
      
      public function get content() : Object
      {
         return this.var_153;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_768;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_153.loaderInfo != null)
            {
               if(this.var_153.loaderInfo.loader != null)
               {
                  this.var_153.loaderInfo.loader.unload();
               }
            }
            this.var_153 = null;
            this.var_768 = null;
            this._disposed = true;
            this.var_942 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_153 = param1 as DisplayObject;
            if(this.var_153 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_153 = DisplayAsset(param1).var_153;
            this.var_768 = DisplayAsset(param1).var_768;
            if(this.var_153 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_153 = DisplayAsset(param1).var_153;
            this.var_768 = DisplayAsset(param1).var_768;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
