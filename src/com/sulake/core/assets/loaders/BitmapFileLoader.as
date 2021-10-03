package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_942:String;
      
      protected var _type:String;
      
      protected var var_35:Loader;
      
      protected var var_947:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_942 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_35 = new Loader();
         this.var_947 = new LoaderContext();
         this.var_947.checkPolicyFile = true;
         this.var_35.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            this.var_35.load(param2,this.var_947);
         }
      }
      
      public function get url() : String
      {
         return this.var_942;
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function get content() : Object
      {
         return !!this.var_35 ? this.var_35.content : null;
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this.var_35 ? uint(this.var_35.contentLoaderInfo.bytesLoaded) : uint(0);
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_35 ? uint(this.var_35.contentLoaderInfo.bytesTotal) : uint(0);
      }
      
      public function get loaderContext() : LoaderContext
      {
         return this.var_947;
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_942 = param1.url;
         var_292 = 0;
         this.var_35.load(param1,this.var_947);
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_292 < var_2653)
            {
               try
               {
                  this.var_35.close();
                  this.var_35.unload();
               }
               catch(e:Error)
               {
               }
               this.var_35.load(new URLRequest(this.var_942 + (this.var_942.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_292),this.var_947);
               return true;
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_35.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               this.var_35.close();
            }
            catch(e:*)
            {
            }
            this.var_35.unload();
            this.var_35 = null;
            this._type = null;
            this.var_942 = null;
         }
      }
   }
}
