package com.sulake.core.utils
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1540:uint = 1;
      
      protected static const const_1538:uint = 2;
      
      protected static const const_1539:uint = 4;
      
      protected static const const_1537:uint = 3;
      
      protected static const name_2:uint = 7;
      
      public static const const_1500:int = 5;
      
      public static const LIBRARY_LOADER_FINALIZE:String = "LIBRARY_LOADER_FINALIZE";
      
      public static const const_1015:Boolean = false;
      
      public static const const_1264:int = 2;
      
      private static var var_823:Array = new Array();
      
      private static var var_664:Array = new Array();
       
      
      protected var var_35:Loader;
      
      protected var var_15:LoaderContext;
      
      protected var _status:int = 0;
      
      protected var var_214:URLRequest;
      
      protected var var_723:XML;
      
      protected var var_599:Class;
      
      protected var var_415:uint = 0;
      
      protected var _name:String;
      
      protected var var_945:Boolean = false;
      
      protected var _debug:Boolean = false;
      
      protected var var_944:Boolean = false;
      
      protected var var_2646:String = "";
      
      protected var var_2644:String = "";
      
      protected var var_1899:int;
      
      protected var var_1177:int;
      
      protected var var_1178:int;
      
      protected var var_2726:uint = 0;
      
      protected var var_2645:Boolean = true;
      
      public function LibraryLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         if(param1 == null)
         {
            this.var_15 = new LoaderContext();
            this.var_15.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            this.var_15 = param1;
         }
         this.var_944 = param2;
         this._debug = param3;
         this._status = 0;
         this.var_35 = new Loader();
         this.var_35.contentLoaderInfo.addEventListener(Event.INIT,this.loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(Event.UNLOAD,this.loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.loadEventHandler);
         this.var_35.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadEventHandler);
         super();
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      protected static function queue(param1:LibraryLoader) : void
      {
         if(const_1015)
         {
            if(var_823.indexOf(param1) == -1)
            {
               var_823.push(param1);
            }
            throttle();
         }
         else
         {
            param1.var_35.load(param1.var_214,param1.var_15);
         }
      }
      
      protected static function throttle() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(const_1015)
         {
            _loc2_ = -1;
            while(_loc2_ > -1)
            {
               _loc1_ = var_664[_loc2_] as LibraryLoader;
               if(_loc1_ && (_loc1_.ready || _loc1_.disposed))
               {
                  var_664.splice(_loc2_,1);
               }
               _loc2_--;
            }
            while(var_664.length < const_1264 && false)
            {
               _loc1_ = var_823.shift() as LibraryLoader;
               if(!_loc1_.ready && !_loc1_.disposed)
               {
                  var_664.push(_loc1_);
                  _loc1_.var_35.load(_loc1_.var_214,_loc1_.var_15);
               }
            }
         }
      }
      
      public function get url() : String
      {
         return !!this.var_214 ? this.var_214.url : null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get ready() : Boolean
      {
         return this.var_945;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get domain() : ApplicationDomain
      {
         return this.var_35.contentLoaderInfo.applicationDomain;
      }
      
      public function get request() : URLRequest
      {
         return this.var_214;
      }
      
      public function get resource() : Class
      {
         return this.var_599;
      }
      
      public function get manifest() : XML
      {
         return this.var_723;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_35.contentLoaderInfo.bytesTotal;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_35.contentLoaderInfo.bytesLoaded;
      }
      
      public function get elapsedTime() : uint
      {
         return !!this.var_945 ? uint(this.var_1177 - this.var_1899) : uint(getTimer() - this.var_1899);
      }
      
      public function get paused() : Boolean
      {
         return this.var_944;
      }
      
      protected function get content() : DisplayObject
      {
         return this.var_35.content;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,this._status,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
            try
            {
               this.var_35.close();
            }
            catch(e:Error)
            {
            }
            try
            {
               this.var_35.unload();
            }
            catch(e:Error)
            {
            }
            this.var_35 = null;
            this.var_15 = null;
            this.var_599 = null;
            this.var_723 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest, param2:int = 5) : void
      {
         this.var_945 = false;
         this.var_214 = param1;
         this.var_1178 = param2;
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         this._name = parseNameFromUrl(this.var_214.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + this._name);
         if(!this.var_944)
         {
            this.var_944 = true;
            this.resume();
         }
      }
      
      public function resume() : void
      {
         if(this.var_944 && !_disposed)
         {
            this.var_944 = false;
            if(!this.var_945 && this.var_214)
            {
               this.var_1177 = -1;
               this.var_1899 = getTimer();
               queue(this);
            }
         }
      }
      
      protected function retry() : Boolean
      {
         if(!this.var_945 && !_disposed && this.var_1178 > 0)
         {
            try
            {
               this.var_35.close();
               this.var_35.unload();
            }
            catch(e:Error)
            {
            }
            this.addRequestCounterToUrlRequest(this.var_214,const_1500 - this.var_1178);
            if(this.var_2645)
            {
               this.var_214.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
               this.var_214.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
               this.var_2645 = false;
            }
            --this.var_1178;
            this.var_415 = 0;
            this.var_35.load(this.var_214,this.var_15);
            return true;
         }
         return false;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         var name:String = param1;
         try
         {
            return this.var_35.contentLoaderInfo.applicationDomain.hasDefinition(name);
         }
         catch(e:Error)
         {
            return false;
         }
      }
      
      public function getDefinition(param1:String) : Object
      {
         var name:String = param1;
         try
         {
            if(this.var_35.contentLoaderInfo.applicationDomain.hasDefinition(name))
            {
               return this.var_35.contentLoaderInfo.applicationDomain.getDefinition(name);
            }
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case Event.INIT:
               this.debug("Load event INIT for file \"" + this.url + "\"");
               this.var_415 |= 0;
               break;
            case Event.COMPLETE:
               this.debug("Load event COMPLETE for file \"" + this.url + "\"");
               this.var_415 |= 0;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               this._status = HTTPStatusEvent(param1).status;
               this.debug("Load event STATUS " + this._status + " for file \"" + this.url + "\"");
               break;
            case Event.UNLOAD:
               this.debug("Load event UNLOAD for file \"" + this.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,this._status,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               break;
            case ProgressEvent.PROGRESS:
               this.debug("Load event PROGRESS for file \"" + this.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,this._status,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               break;
            case IOErrorEvent.IO_ERROR:
               this.debug("Load event IO ERROR for file \"" + this.url + "\"");
               if(!this.handleHttpStatus(this._status))
               {
                  this.var_1177 = getTimer();
                  this.failure("IO Error, send or load operation failed for file \"" + this.url + "\"");
                  this.removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               this.var_1177 = getTimer();
               this.failure("Security Error, security violation with file \"" + this.url + "\"");
               this.removeEventListeners();
               break;
            case TimerEvent.TIMER:
               _loc2_ = TimerEvent(param1).target as Timer;
               _loc2_.removeEventListener(TimerEvent.TIMER,this.loadEventHandler);
               _loc2_.stop();
               if(!_disposed)
               {
                  this.var_415 = LibraryLoader.name_2;
                  this.loadEventHandler(new Event(Event.COMPLETE));
               }
               return;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(this.var_415 == LibraryLoader.const_1537)
         {
            if(this.analyzeLibrary())
            {
               this.var_415 |= 0;
            }
         }
         if(this.var_415 == LibraryLoader.name_2)
         {
            if(this.prepareLibrary())
            {
               this.var_945 = true;
               this.var_1177 = getTimer();
               this.removeEventListeners();
               throttle();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this._status,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
               dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
            }
         }
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         this.debug("Analyzing library \"" + this._name + "\", content " + (this.content is MovieClip ? "is" : "is not") + " a MovieClip");
         this.debug("\tBytes loaded: " + this.var_35.contentLoaderInfo.bytesLoaded + "/" + this.var_35.contentLoaderInfo.bytesTotal);
         if(this.content is MovieClip)
         {
            _loc1_ = this.content as MovieClip;
            _loc3_ = _loc1_.currentLabels;
            this.debug("\tLibrary \"" + this._name + "\" is in frame " + _loc1_.currentFrame + "(" + _loc1_.currentLabel + ")");
            if(_loc3_.length > 1)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc2_ = _loc3_[_loc4_] as FrameLabel;
                  if(_loc2_.name == this._name)
                  {
                     if(_loc2_.frame != _loc1_.currentFrame)
                     {
                        _loc1_.addEventListener(Event.ENTER_FRAME,this.loadEventHandler);
                        return false;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         return true;
      }
      
      protected function prepareLibrary() : Boolean
      {
         var xmlClass:Class = null;
         this.debug("Preparing library \"" + this._name + "\"");
         this.var_599 = this.getDefinition(this._name) as Class;
         if(this.var_599 == null)
         {
            if(!this.retry())
            {
               this.failure("Failed to find resource class \"" + this._name + "\" from library " + this.var_214.url + "!");
            }
            return false;
         }
         try
         {
            xmlClass = this.var_599.manifest as Class;
            if(xmlClass == null)
            {
               return false;
            }
         }
         catch(e:Error)
         {
            if(!retry())
            {
               failure("Failed to find embedded manifest.xml from library undefined!");
            }
            return false;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         try
         {
            this.var_723 = new XML(bytes.readUTFBytes(bytes.length));
         }
         catch(e:Error)
         {
            if(!retry())
            {
               failure("Failed to extract manifest.xml from library " + _name + "!\n" + e.message);
            }
            return false;
         }
         return true;
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(this.retry())
            {
               return true;
            }
            this.failure("HTTP Error " + param1 + " \"" + this.var_35.contentLoaderInfo.url + "\"");
            this.removeEventListeners();
         }
         return false;
      }
      
      protected function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc3_:Array = param1.url.split("?");
         var _loc4_:String = _loc3_[0];
         var _loc5_:String = _loc3_.length > 1 ? _loc3_[1] : "";
         var _loc7_:Array = _loc5_.split("&");
         var _loc8_:Boolean = false;
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc10_ = _loc7_[_loc9_];
            if(_loc10_.indexOf("counterparameter=") >= 0)
            {
               _loc10_ = "counterparameter=" + param2.toString();
               _loc7_[_loc9_] = _loc10_;
               _loc8_ = true;
               break;
            }
            _loc9_++;
         }
         if(!_loc8_)
         {
            _loc7_.push("counterparameter=" + param2);
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc4_ += (_loc9_ == 0 ? "?" : "&") + _loc7_[_loc9_];
            _loc9_++;
         }
         param1.url = _loc4_;
      }
      
      protected function removeEventListeners() : void
      {
         if(this.var_35)
         {
            if(this.var_35.content != null)
            {
               this.var_35.content.removeEventListener(Event.ENTER_FRAME,this.loadEventHandler);
            }
            this.var_35.contentLoaderInfo.removeEventListener(Event.INIT,this.loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(Event.UNLOAD,this.loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.loadEventHandler);
            this.var_35.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.loadEventHandler);
         }
      }
      
      protected function debug(param1:String) : void
      {
         Core.debug(param1);
         this.var_2644 = param1;
         if(this._debug)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,this._status,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
         }
      }
      
      protected function failure(param1:String) : void
      {
         Core.warning(param1);
         this.var_2646 = param1;
         throttle();
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this._status,this.bytesTotal,this.bytesLoaded,this.elapsedTime));
         dispatchEvent(new Event(LIBRARY_LOADER_FINALIZE));
      }
      
      public function getLastDebugMessage() : String
      {
         return this.var_2644;
      }
      
      public function getLastErrorMessage() : String
      {
         return this.var_2646;
      }
   }
}
