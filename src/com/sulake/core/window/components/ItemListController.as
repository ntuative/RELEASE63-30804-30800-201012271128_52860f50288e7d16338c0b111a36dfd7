package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IInputProcessorRoot;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot
   {
      
      protected static const const_1133:String = "spacing";
      
      protected static const const_1134:String = "scale_to_fit_items";
      
      protected static const const_1131:String = "resize_on_item_update";
      
      protected static const const_1132:String = "auto_arrange_items";
      
      protected static const DEF_SPACING:int = 0;
      
      protected static const const_1548:Boolean = false;
      
      protected static const DEF_RESIZE_ON_ITEM_UPDATE:Boolean = false;
      
      protected static const const_1547:Boolean = true;
       
      
      protected var var_630:Number;
      
      protected var var_631:Number;
      
      protected var var_100:Number;
      
      protected var var_91:Number;
      
      protected var _container:IWindowContainer;
      
      protected var var_1915:Boolean = false;
      
      protected var var_517:Boolean = false;
      
      protected var _spacing:int = 0;
      
      protected var _horizontal:Boolean = false;
      
      protected var var_2699:Number = 0.0;
      
      protected var var_2700:Number = 0.0;
      
      protected var var_950:Boolean = true;
      
      protected var var_518:Boolean = false;
      
      protected var var_1186:Boolean = false;
      
      protected var var_1916:int = 0;
      
      protected var var_1914:int = 0;
      
      protected var var_1188:Number;
      
      protected var var_1187:Number;
      
      protected var var_1185:Boolean = false;
      
      public function ItemListController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         this.var_630 = 0;
         this.var_631 = 0;
         this.var_100 = 0;
         this.var_91 = 0;
         this._horizontal = param2 == WindowType.const_355;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_152 = var_418 || !testParamFlag(WindowParam.const_31);
         this._container = var_15.create("_CONTAINER","",WindowType.const_377,WindowStyle.const_628,0 | 0 | 0,new Rectangle(0,0,width,height),null,this,0,null,[TAG_INTERNAL,TAG_EXCLUDE]) as IWindowContainer;
         this._container.addEventListener(WindowEvent.const_44,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_400,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_263,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_513,this.containerEventHandler);
         this.resizeOnItemUpdate = this.var_1186;
      }
      
      public function get spacing() : int
      {
         return this._spacing;
      }
      
      public function set spacing(param1:int) : void
      {
         if(param1 != this._spacing)
         {
            this._spacing = param1;
            this.updateScrollAreaRegion();
         }
      }
      
      public function get scrollH() : Number
      {
         return this.var_630;
      }
      
      public function get scrollV() : Number
      {
         return this.var_631;
      }
      
      public function get maxScrollH() : int
      {
         var _loc1_:int = this.var_100 - width;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get maxScrollV() : int
      {
         var _loc1_:int = this.var_91 - height;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(this.var_630 * this.maxScrollH,this.var_631 * this.maxScrollV,width,height);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return this._container.rectangle.clone();
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_630)
         {
            this.var_630 = param1;
            this._container.x = -this.var_630 * this.maxScrollH;
            var_15.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_72);
            dispatchEvent(new WindowEvent(WindowEvent.const_441,this,null));
         }
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_631)
         {
            this.var_631 = param1;
            this._container.y = -this.var_631 * this.maxScrollV;
            var_15.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_72);
            dispatchEvent(new WindowEvent(WindowEvent.const_441,this,null));
         }
      }
      
      public function get scrollStepH() : Number
      {
         return !!this._horizontal ? Number(this._container.width / this.numListItems) : Number(0.1 * this._container.width);
      }
      
      public function get scrollStepV() : Number
      {
         return !!this._horizontal ? Number(0.1 * this._container.height) : Number(this._container.height / this.numListItems);
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         this.var_2699 = Math.max(param1,0);
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         this.var_2700 = Math.max(param1,0);
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         this.var_518 = param1;
         this.updateScrollAreaRegion();
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return this.var_518;
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         this.var_950 = param1;
         this.updateScrollAreaRegion();
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return this.var_950;
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         this.var_1186 = param1;
         if(this._container)
         {
            if(this._horizontal)
            {
               this._container.setParamFlag(WindowParam.const_466,param1);
            }
            else
            {
               this._container.setParamFlag(WindowParam.const_504,param1);
            }
         }
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return this.var_1186;
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
      
      public function get firstListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(0) : null;
      }
      
      public function get lastListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(this.numListItems - 1) : null;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            if(this.var_1185)
            {
               try
               {
                  var_15.getWindowServices().getGestureAgentService().end(this);
               }
               catch(e:Error)
               {
               }
            }
            this._container.removeEventListener(WindowEvent.const_44,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_400,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_263,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_513,this.containerEventHandler);
            super.dispose();
         }
      }
      
      override protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.numListItems)
         {
            IItemListWindow(param1).addListItem(this.getListItemAt(_loc2_).clone());
            _loc2_++;
         }
      }
      
      public function get numListItems() : int
      {
         return this._container != null ? int(this._container.numChildren) : 0;
      }
      
      public function addListItem(param1:IWindow) : IWindow
      {
         this.var_517 = true;
         if(this._horizontal)
         {
            param1.x = this.var_100 + (this.numListItems > 0 ? this._spacing : 0);
            this.var_100 = param1.rectangle.right;
            this._container.width = this.var_100;
         }
         else
         {
            if(this.autoArrangeItems)
            {
               param1.y = this.var_91 + (this.numListItems > 0 ? this._spacing : 0);
               this.var_91 = param1.rectangle.bottom;
            }
            else
            {
               this.var_91 = Math.max(this.var_91,param1.rectangle.bottom);
            }
            this._container.height = this.var_91;
         }
         param1 = this._container.addChild(param1);
         this.var_517 = false;
         return param1;
      }
      
      public function addListItemAt(param1:IWindow, param2:uint) : IWindow
      {
         param1 = this._container.addChildAt(param1,param2);
         this.updateScrollAreaRegion();
         return param1;
      }
      
      public function getListItemAt(param1:uint) : IWindow
      {
         return this._container.getChildAt(param1);
      }
      
      public function getListItemByID(param1:uint) : IWindow
      {
         return this._container.getChildByID(param1);
      }
      
      public function getListItemByName(param1:String) : IWindow
      {
         return this._container.getChildByName(param1);
      }
      
      public function getListItemIndex(param1:IWindow) : int
      {
         return this._container.getChildIndex(param1);
      }
      
      public function removeListItem(param1:IWindow) : IWindow
      {
         param1 = this._container.removeChild(param1);
         if(param1)
         {
            this.updateScrollAreaRegion();
         }
         return param1;
      }
      
      public function removeListItemAt(param1:int) : IWindow
      {
         return this._container.removeChildAt(param1);
      }
      
      public function setListItemIndex(param1:IWindow, param2:int) : void
      {
         this._container.setChildIndex(param1,param2);
      }
      
      public function swapListItems(param1:IWindow, param2:IWindow) : void
      {
         this._container.swapChildren(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         this._container.swapChildrenAt(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithID(param1,param2,param3);
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function removeListItems() : void
      {
         this.var_517 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0);
         }
         this.var_517 = false;
         this.updateScrollAreaRegion();
      }
      
      public function destroyListItems() : void
      {
         this.var_517 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0).destroy();
         }
         this.var_517 = false;
         this.updateScrollAreaRegion();
      }
      
      public function arrangeListItems() : void
      {
         this.updateScrollAreaRegion();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case WindowNotifyEvent.const_520:
               break;
            case WindowNotifyEvent.const_684:
               this.var_1915 = true;
               break;
            case WindowNotifyEvent.const_178:
               if(!this.var_518)
               {
                  if(this._horizontal)
                  {
                     this._container.height = var_11.height;
                  }
                  else
                  {
                     this._container.width = var_11.width;
                  }
               }
               this.updateScrollAreaRegion();
               this.var_1915 = false;
               break;
            default:
               if(param2 is WindowEvent)
               {
                  _loc3_ = this.process(param2 as WindowEvent);
               }
         }
         return _loc3_;
      }
      
      public function process(param1:WindowEvent) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is WindowMouseEvent)
         {
            _loc3_ = WindowMouseEvent(param1).localX;
            _loc4_ = WindowMouseEvent(param1).localY;
            _loc5_ = WindowMouseEvent(param1).delta;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_279:
               if(this._horizontal)
               {
                  this.scrollH -= _loc5_ * 0.01;
               }
               else
               {
                  this.scrollV -= _loc5_ * 0.01;
               }
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_39:
               this.var_1916 = _loc3_;
               this.var_1914 = _loc4_;
               this.var_1188 = 0;
               this.var_1187 = 0;
               this.var_1185 = true;
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_186:
               if(this.var_1185)
               {
                  this.var_1188 = this.var_1916 - _loc3_;
                  this.var_1187 = this.var_1914 - _loc4_;
                  if(this._horizontal)
                  {
                     if(this.var_1188 != 0 && this.var_100 != 0)
                     {
                        this.scrollH += this.var_1188 / this.var_100;
                     }
                  }
                  else if(this.var_1187 != 0 && this.var_91 != 0)
                  {
                     this.scrollV += this.var_1187 / this.var_91;
                  }
                  this.var_1916 = _loc3_;
                  this.var_1914 = _loc4_;
                  _loc2_ = true;
               }
               break;
            case WindowMouseEvent.const_54:
            case WindowMouseEvent.const_170:
               if(this.var_1185)
               {
                  if(this._horizontal)
                  {
                     var_15.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,-this.var_1188,0);
                  }
                  else
                  {
                     var_15.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,0,-this.var_1187);
                  }
                  this.var_1185 = false;
                  _loc2_ = true;
               }
         }
         return _loc2_;
      }
      
      private function scrollAnimationCallback(param1:int, param2:int) : void
      {
         if(!disposed)
         {
            this.scrollH -= param1 / this.var_100;
            this.scrollV -= param2 / this.var_91;
         }
      }
      
      private function containerEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case WindowEvent.const_400:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_263:
               if(!this.var_1915)
               {
                  this.updateScrollAreaRegion();
               }
               break;
            case WindowEvent.const_513:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_44:
               dispatchEvent(new WindowEvent(WindowEvent.const_44,this,null));
               break;
            default:
               Logger.log("ItemListController::containerEventHandler(" + param1.type + ")");
         }
      }
      
      protected function updateScrollAreaRegion() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.var_950 && !this.var_517 && this._container)
         {
            this.var_517 = true;
            _loc1_ = uint(this._container.numChildren);
            if(this._horizontal)
            {
               this.var_100 = 0;
               this.var_91 = var_11.height;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.x = this.var_100;
                     this.var_100 += _loc2_.width + this._spacing;
                     if(this.var_518)
                     {
                        _loc3_ = _loc2_.height + _loc2_.y;
                        this.var_91 = _loc3_ > this.var_91 ? Number(_loc3_) : Number(this.var_91);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_100 -= this._spacing;
               }
            }
            else
            {
               this.var_100 = var_11.width;
               this.var_91 = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.y = this.var_91;
                     this.var_91 += _loc2_.height + this._spacing;
                     if(this.var_518)
                     {
                        _loc3_ = _loc2_.width + _loc2_.x;
                        this.var_100 = _loc3_ > this.var_100 ? Number(_loc3_) : Number(this.var_100);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_91 -= this._spacing;
               }
            }
            if(this.var_630 > 0)
            {
               if(this.var_100 <= var_11.width)
               {
                  this.scrollH = 0;
               }
               else
               {
                  this._container.x = -(this.var_630 * this.maxScrollH);
               }
            }
            if(this.var_631 > 0)
            {
               if(this.var_91 <= var_11.height)
               {
                  this.scrollV = 0;
               }
               else
               {
                  this._container.y = -(this.var_631 * this.maxScrollV);
               }
            }
            this._container.height = this.var_91;
            this._container.width = this.var_100;
            this.var_517 = false;
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(new PropertyStruct(const_1133,this._spacing,PropertyStruct.const_51,this._spacing != DEF_SPACING));
         _loc1_.push(new PropertyStruct(const_1132,this.var_950,PropertyStruct.const_50,this.var_950 != const_1547));
         _loc1_.push(new PropertyStruct(const_1134,this.var_518,PropertyStruct.const_50,this.var_518 != const_1548));
         _loc1_.push(new PropertyStruct(const_1131,this.var_1186,PropertyStruct.const_50,this.var_1186 != DEF_RESIZE_ON_ITEM_UPDATE));
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case const_1133:
                  this.spacing = _loc2_.value as int;
                  break;
               case const_1134:
                  this.scaleToFitItems = _loc2_.value as Boolean;
                  break;
               case const_1131:
                  this.resizeOnItemUpdate = _loc2_.value as Boolean;
                  break;
               case const_1132:
                  this.var_950 = _loc2_.value as Boolean;
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
