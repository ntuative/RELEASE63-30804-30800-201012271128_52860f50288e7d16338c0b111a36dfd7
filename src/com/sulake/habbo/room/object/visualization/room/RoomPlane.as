package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomPlane
   {
      
      public static const const_1373:int = 0;
      
      public static const const_105:int = 1;
      
      public static const const_191:int = 2;
      
      public static const const_90:int = 3;
       
      
      private var _disposed:Boolean = false;
      
      private var var_2575:int = 0;
      
      private var var_1084:Vector3d = null;
      
      private var var_75:Vector3d = null;
      
      private var var_276:Vector3d = null;
      
      private var var_277:Vector3d = null;
      
      private var var_588:Vector3d = null;
      
      private var var_1345:Array;
      
      private var var_1589:int = -1;
      
      private var _type:int = 0;
      
      private var _isVisible:Boolean = false;
      
      private var _bitmapData:BitmapData = null;
      
      private var var_1825:Boolean = true;
      
      private var _offset:Point = null;
      
      private var var_2369:Number = 0;
      
      private var _color:uint = 0;
      
      private var var_925:IPlaneRasterizer = null;
      
      private var var_666:PlaneMaskManager = null;
      
      private var _id:String = null;
      
      private var var_2576:Number = 0;
      
      private var var_2574:Number = 0;
      
      private var var_2578:Number = 0;
      
      private var var_2577:Number = 0;
      
      private var var_177:Map = null;
      
      private var var_408:PlaneBitmapData = null;
      
      private var var_924:Boolean = false;
      
      private var var_250:Array;
      
      private var var_346:Array;
      
      private var var_345:Boolean = false;
      
      private var var_66:BitmapData = null;
      
      private var var_210:BitmapData = null;
      
      private var var_923:Array;
      
      private var var_1413:Array;
      
      private var var_144:Vector3d = null;
      
      private var var_108:Vector3d = null;
      
      private var var_83:Vector3d = null;
      
      private var var_109:Vector3d = null;
      
      private var _width:Number = 0.0;
      
      private var _height:Number = 0.0;
      
      private var var_750:Boolean = true;
      
      public function RoomPlane(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:int, param6:Boolean, param7:Array, param8:int, param9:Number = 0, param10:Number = 0, param11:Number = 0, param12:Number = 0)
      {
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         this.var_1345 = [];
         this.var_250 = [];
         this.var_346 = [];
         this.var_923 = [];
         this.var_1413 = [];
         super();
         this.var_2575 = param8;
         this.var_1084 = new Vector3d();
         this.var_1084.assign(param1);
         this.var_75 = new Vector3d();
         this.var_75.assign(param2);
         this.var_276 = new Vector3d();
         this.var_276.assign(param3);
         this.var_277 = new Vector3d();
         this.var_277.assign(param4);
         this.var_588 = Vector3d.crossProduct(this.var_276,this.var_277);
         if(this.var_588.length > 0)
         {
            this.var_588.mul(1 / this.var_588.length);
         }
         if(param7 != null)
         {
            _loc13_ = 0;
            while(_loc13_ < param7.length)
            {
               _loc14_ = param7[_loc13_] as IVector3d;
               if(_loc14_ != null)
               {
                  _loc15_ = new Vector3d();
                  _loc15_.assign(_loc14_);
                  this.var_1345.push(_loc14_);
               }
               _loc13_++;
            }
         }
         this._offset = new Point();
         this._type = param5;
         this.var_177 = new Map();
         this.var_144 = new Vector3d();
         this.var_108 = new Vector3d();
         this.var_83 = new Vector3d();
         this.var_109 = new Vector3d();
         this.var_2576 = param9;
         this.var_2574 = param10;
         this.var_2578 = param11;
         this.var_2577 = param12;
         this.var_924 = param6;
      }
      
      public function set canBeVisible(param1:Boolean) : void
      {
         if(param1 != this.var_750)
         {
            if(!this.var_750)
            {
               this.resetTextureCache();
            }
            this.var_750 = param1;
         }
      }
      
      public function get canBeVisible() : Boolean
      {
         return this.var_750;
      }
      
      public function get bitmapData() : BitmapData
      {
         if(this.visible)
         {
            if(this._bitmapData != null)
            {
               try
               {
                  return this._bitmapData.clone();
               }
               catch(e:Error)
               {
               }
            }
         }
         return null;
      }
      
      public function get visible() : Boolean
      {
         return this._isVisible && this.var_750;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_2369;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get leftSide() : IVector3d
      {
         return this.var_276;
      }
      
      public function get rightSide() : IVector3d
      {
         return this.var_277;
      }
      
      public function get location() : IVector3d
      {
         return this.var_75;
      }
      
      public function get normal() : IVector3d
      {
         return this.var_588;
      }
      
      public function get hasTexture() : Boolean
      {
         return this.var_1825;
      }
      
      public function set hasTexture(param1:Boolean) : void
      {
         this.var_1825 = param1;
      }
      
      public function set rasterizer(param1:IPlaneRasterizer) : void
      {
         this.var_925 = param1;
      }
      
      public function set maskManager(param1:PlaneMaskManager) : void
      {
         this.var_666 = param1;
      }
      
      public function set id(param1:String) : void
      {
         if(param1 != this._id)
         {
            this.resetTextureCache();
            this._id = param1;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this._bitmapData != null)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
         }
         if(this.var_177 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_177.length)
            {
               _loc2_ = this.var_177.getWithIndex(_loc1_) as PlaneBitmapData;
               if(_loc2_ != null)
               {
                  if(_loc2_.bitmap != null)
                  {
                     _loc2_.bitmap.dispose();
                  }
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_177.dispose();
            this.var_177 = null;
         }
         this.var_408 = null;
         this.var_75 = null;
         this.var_1084 = null;
         this.var_276 = null;
         this.var_277 = null;
         this.var_588 = null;
         this.var_925 = null;
         this.var_144 = null;
         this.var_108 = null;
         this.var_83 = null;
         this.var_109 = null;
         this.var_250 = null;
         this.var_346 = null;
         if(this.var_66 != null)
         {
            this.var_66.dispose();
            this.var_66 = null;
         }
         if(this.var_210 != null)
         {
            this.var_210.dispose();
            this.var_210 = null;
         }
         this._disposed = true;
      }
      
      public function copyBitmapData(param1:BitmapData) : BitmapData
      {
         if(this.visible)
         {
            if(this._bitmapData != null && param1 != null)
            {
               if(this._bitmapData.width == param1.width && this._bitmapData.height == param1.height)
               {
                  param1.copyPixels(this._bitmapData,this._bitmapData.rect,new Point(0,0));
                  return param1;
               }
            }
         }
         return null;
      }
      
      private function cacheTexture(param1:String, param2:PlaneBitmapData) : Boolean
      {
         var _loc3_:PlaneBitmapData = this.var_177.remove(param1) as PlaneBitmapData;
         if(_loc3_ != null)
         {
            if(param2 != null && param2.bitmap != _loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.dispose();
         }
         this.var_408 = param2;
         this.var_177.add(param1,param2);
         return true;
      }
      
      private function resetTextureCache(param1:BitmapData = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(this.var_177 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_177.length)
            {
               _loc3_ = this.var_177.getWithIndex(_loc2_) as PlaneBitmapData;
               if(_loc3_ != null)
               {
                  if(_loc3_.bitmap != null && _loc3_.bitmap != param1)
                  {
                     _loc3_.bitmap.dispose();
                  }
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_177.reset();
         }
         this.var_408 = null;
      }
      
      private function getTextureIdentifier(param1:Number) : String
      {
         if(this.var_925 != null)
         {
            return this.var_925.getTextureIdentifier(param1,this.normal);
         }
         return String(param1);
      }
      
      private function needsNewTexture(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:PlaneBitmapData = this.var_408;
         if(_loc3_ == null)
         {
            _loc4_ = this.getTextureIdentifier(param1.scale);
            _loc3_ = this.var_177.getValue(_loc4_) as PlaneBitmapData;
         }
         this.updateMaskChangeStatus();
         if(this.var_750 && (_loc3_ == null || _loc3_.timeStamp >= 0 && param2 > _loc3_.timeStamp || this.var_345))
         {
            return true;
         }
         return false;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.needsNewTexture(param1,param2))
         {
            _loc5_ = this.var_276.length * param1.scale;
            _loc6_ = this.var_277.length * param1.scale;
            _loc7_ = param1.getCoordinatePosition(this.var_588);
            _loc4_ = this.getTextureIdentifier(param1.scale);
            if(this.var_408 != null)
            {
               _loc3_ = this.var_408;
            }
            else
            {
               _loc3_ = this.var_177.getValue(_loc4_) as PlaneBitmapData;
            }
            _loc8_ = null;
            if(_loc3_ != null)
            {
               _loc8_ = _loc3_.bitmap;
            }
            if(this.var_925 != null)
            {
               _loc3_ = this.var_925.render(_loc8_,this._id,_loc5_,_loc6_,param1.scale,_loc7_,this.var_1825,this.var_2576,this.var_2574,this.var_2578,this.var_2577,param2);
               if(_loc3_ != null)
               {
                  if(_loc8_ != null && _loc3_.bitmap != _loc8_)
                  {
                     _loc8_.dispose();
                  }
               }
            }
            else
            {
               _loc9_ = new BitmapData(_loc5_,_loc6_,true,4278190080 | this._color);
               _loc3_ = new PlaneBitmapData(_loc9_,-1);
            }
            if(_loc3_ != null)
            {
               this.updateMask(_loc3_.bitmap,param1);
               this.cacheTexture(_loc4_,_loc3_);
            }
         }
         else if(this.var_408 != null)
         {
            _loc3_ = this.var_408;
         }
         else
         {
            _loc4_ = this.getTextureIdentifier(param1.scale);
            _loc3_ = this.var_177.getValue(_loc4_) as PlaneBitmapData;
         }
         if(_loc3_ != null)
         {
            this.var_408 = _loc3_;
            return _loc3_.bitmap;
         }
         return null;
      }
      
      private function addOutlines(param1:PlaneBitmapData) : void
      {
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var cosAngle:Number = NaN;
         var i:int = 0;
         var originPos:IVector3d = null;
         var originZ:Number = NaN;
         var relativeDepth:Number = NaN;
         var texture:BitmapData = null;
         var geometry:IRoomGeometry = param1;
         var timeSinceStartMs:int = param2;
         if(geometry == null || this._disposed)
         {
            return false;
         }
         var geometryChanged:Boolean = false;
         if(this.var_1589 != geometry.updateId)
         {
            geometryChanged = true;
         }
         if(!geometryChanged || !this.var_750)
         {
            if(!this.visible)
            {
               return false;
            }
         }
         if(geometryChanged)
         {
            this.var_408 = null;
            cosAngle = 0;
            cosAngle = Vector3d.cosAngle(geometry.directionAxis,this.normal);
            if(cosAngle > -0.001)
            {
               if(this._isVisible)
               {
                  this._isVisible = false;
                  return true;
               }
               return false;
            }
            i = 0;
            while(i < this.var_1345.length)
            {
               cosAngle = Vector3d.cosAngle(geometry.directionAxis,this.var_1345[i]);
               if(cosAngle > -0.001)
               {
                  if(this._isVisible)
                  {
                     this._isVisible = false;
                     return true;
                  }
                  return false;
               }
               i++;
            }
            this.updateCorners(geometry);
            originPos = geometry.getScreenPosition(this.var_1084);
            originZ = originPos.z;
            relativeDepth = Math.max(this.var_144.z - originZ,this.var_108.z - originZ,this.var_83.z - originZ,this.var_109.z - originZ);
            if(this._type == const_90)
            {
               relativeDepth += 0.02;
            }
            this.var_2369 = relativeDepth;
            this._isVisible = true;
            this.var_1589 = geometry.updateId;
         }
         if(geometryChanged || this.needsNewTexture(geometry,timeSinceStartMs))
         {
            if(this._bitmapData == null || this._width != this._bitmapData.width || this._height != this._bitmapData.height)
            {
               if(this._bitmapData != null)
               {
                  this._bitmapData.dispose();
                  this._bitmapData = null;
                  if(this._width < 1 || this._height < 1)
                  {
                     return true;
                  }
               }
               else if(this._width < 1 || this._height < 1)
               {
                  return false;
               }
               try
               {
                  this._bitmapData = new BitmapData(this._width,this._height,true,16777215);
               }
               catch(e:Error)
               {
                  _bitmapData = null;
                  return false;
               }
               this._bitmapData.lock();
            }
            else
            {
               this._bitmapData.lock();
               this._bitmapData.fillRect(this._bitmapData.rect,16777215);
            }
            Randomizer.setSeed(this.var_2575);
            texture = this.getTexture(geometry,timeSinceStartMs);
            if(texture != null)
            {
               this.renderTexture(geometry,texture);
            }
            this._bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         this.var_144.assign(param1.getScreenPosition(this.var_75));
         this.var_108.assign(param1.getScreenPosition(Vector3d.sum(this.var_75,this.var_277)));
         this.var_83.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(this.var_75,this.var_276),this.var_277)));
         this.var_109.assign(param1.getScreenPosition(Vector3d.sum(this.var_75,this.var_276)));
         this._offset = param1.getScreenPoint(this.var_1084);
         this.var_144.x = Math.round(this.var_144.x);
         this.var_144.y = Math.round(this.var_144.y);
         this.var_108.x = Math.round(this.var_108.x);
         this.var_108.y = Math.round(this.var_108.y);
         this.var_83.x = Math.round(this.var_83.x);
         this.var_83.y = Math.round(this.var_83.y);
         this.var_109.x = Math.round(this.var_109.x);
         this.var_109.y = Math.round(this.var_109.y);
         this._offset.x = Math.round(this._offset.x);
         this._offset.y = Math.round(this._offset.y);
         var _loc2_:Number = Math.min(this.var_144.x,this.var_108.x,this.var_83.x,this.var_109.x);
         var _loc3_:Number = Math.max(this.var_144.x,this.var_108.x,this.var_83.x,this.var_109.x);
         var _loc4_:Number = Math.min(this.var_144.y,this.var_108.y,this.var_83.y,this.var_109.y);
         var _loc5_:Number = Math.max(this.var_144.y,this.var_108.y,this.var_83.y,this.var_109.y);
         _loc3_ -= _loc2_;
         this._offset.x -= _loc2_;
         this.var_144.x -= _loc2_;
         this.var_108.x -= _loc2_;
         this.var_83.x -= _loc2_;
         this.var_109.x -= _loc2_;
         _loc5_ -= _loc4_;
         this._offset.y -= _loc4_;
         this.var_144.y -= _loc4_;
         this.var_108.y -= _loc4_;
         this.var_83.y -= _loc4_;
         this.var_109.y -= _loc4_;
         this._width = _loc3_;
         this._height = _loc5_;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(this.var_144 == null || this.var_108 == null || this.var_83 == null || this.var_109 == null || param2 == null || this._bitmapData == null)
         {
            return;
         }
         var _loc3_:Number = this.var_109.x - this.var_83.x;
         var _loc4_:Number = this.var_109.y - this.var_83.y;
         var _loc5_:Number = this.var_108.x - this.var_83.x;
         var _loc6_:Number = this.var_108.y - this.var_83.y;
         if(this._type == const_105 || this._type == const_90)
         {
            if(Math.abs(_loc5_ - param2.width) <= 1)
            {
               _loc5_ = param2.width;
            }
            if(Math.abs(_loc6_ - param2.width) <= 1)
            {
               _loc6_ = param2.width;
            }
            if(Math.abs(_loc3_ - param2.height) <= 1)
            {
               _loc3_ = param2.height;
            }
            if(Math.abs(_loc4_ - param2.height) <= 1)
            {
               _loc4_ = param2.height;
            }
         }
         var _loc7_:Number = _loc5_ / param2.width;
         var _loc8_:Number = _loc6_ / param2.width;
         var _loc9_:Number = _loc3_ / param2.height;
         var _loc10_:Number = _loc4_ / param2.height;
         var _loc11_:Matrix = new Matrix();
         _loc11_.a = _loc7_;
         _loc11_.b = _loc8_;
         _loc11_.c = _loc9_;
         _loc11_.d = _loc10_;
         _loc11_.translate(this.var_83.x,this.var_83.y);
         this.draw(param2,_loc11_);
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1 && (this._type == const_105 || this._type == const_90))
            {
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  ++param2.ty;
               }
               _loc7_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc3_++;
                  _loc5_ += Math.abs(param2.b);
                  if(_loc5_ >= 1)
                  {
                     this._bitmapData.copyPixels(param1,new Rectangle(_loc4_ + _loc6_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
                     _loc4_ = _loc3_;
                     if(param2.b > 0)
                     {
                        _loc7_++;
                     }
                     else
                     {
                        _loc7_--;
                     }
                     _loc5_ = 0;
                  }
               }
               if(_loc5_ > 0)
               {
                  this._bitmapData.copyPixels(param1,new Rectangle(_loc4_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
               }
               return;
            }
            this._bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
      
      public function resetBitmapMasks() : void
      {
         if(this.var_924)
         {
            if(this.var_250.length == 0)
            {
               return;
            }
            this.var_345 = true;
            this.var_250 = [];
         }
      }
      
      public function addBitmapMask(param1:String, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(this.var_924)
         {
            _loc4_ = null;
            _loc5_ = 0;
            while(_loc5_ < this.var_250.length)
            {
               _loc4_ = this.var_250[_loc5_] as RoomPlaneBitmapMask;
               if(_loc4_ != null)
               {
                  if(_loc4_.type == param1 && _loc4_.leftSideLoc == param2 && _loc4_.rightSideLoc == param3)
                  {
                     return false;
                  }
               }
               _loc5_++;
            }
            _loc4_ = new RoomPlaneBitmapMask(param1,param2,param3);
            this.var_250.push(_loc4_);
            this.var_345 = true;
            return true;
         }
         return false;
      }
      
      public function resetRectangleMasks() : void
      {
         if(this.var_924)
         {
            if(this.var_346.length == 0)
            {
               return;
            }
            this.var_345 = true;
            this.var_346 = [];
         }
      }
      
      public function addRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(this.var_924)
         {
            _loc5_ = null;
            _loc6_ = 0;
            while(_loc6_ < this.var_346.length)
            {
               _loc5_ = this.var_346[_loc6_] as RoomPlaneRectangleMask;
               if(_loc5_ != null)
               {
                  if(_loc5_.leftSideLoc == param1 && _loc5_.rightSideLoc == param2 && _loc5_.leftSideLength == param3 && _loc5_.rightSideLength == param4)
                  {
                     return false;
                  }
               }
               _loc6_++;
            }
            _loc5_ = new RoomPlaneRectangleMask(param1,param2,param3,param4);
            this.var_346.push(_loc5_);
            this.var_345 = true;
            return true;
         }
         return false;
      }
      
      private function updateMaskChangeStatus() : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         if(!this.var_345)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = true;
         var _loc4_:* = null;
         if(this.var_250.length == this.var_923.length)
         {
            while(_loc1_ < this.var_250.length)
            {
               _loc4_ = this.var_250[_loc1_] as RoomPlaneBitmapMask;
               if(_loc4_ != null)
               {
                  _loc6_ = false;
                  while(_loc2_ < this.var_923.length)
                  {
                     _loc7_ = this.var_923[_loc2_] as RoomPlaneBitmapMask;
                     if(_loc7_ != null)
                     {
                        if(_loc7_.type == _loc4_.type && _loc7_.leftSideLoc == _loc4_.leftSideLoc && _loc7_.rightSideLoc == _loc4_.rightSideLoc)
                        {
                           _loc6_ = true;
                           break;
                        }
                     }
                     _loc2_++;
                  }
                  if(!_loc6_)
                  {
                     _loc3_ = false;
                     break;
                  }
               }
               _loc1_++;
            }
         }
         else
         {
            _loc3_ = false;
         }
         if(this.var_346.length > this.var_1413.length)
         {
            _loc3_ = false;
         }
         if(_loc3_)
         {
            this.var_345 = false;
         }
      }
      
      private function updateMask(param1:BitmapData, param2:IRoomGeometry) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(!this.var_924 || this.var_250.length == 0 && this.var_346.length == 0 && !this.var_345 || this.var_666 == null)
         {
            return;
         }
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.updateMaskChangeStatus();
         var _loc7_:Number = param1.width;
         var _loc8_:Number = param1.height;
         if(this.var_66 == null || this.var_66.width != _loc7_ || this.var_66.height != _loc8_)
         {
            if(this.var_66 != null)
            {
               this.var_66.dispose();
               this.var_66 = null;
            }
            this.var_66 = new BitmapData(_loc7_ + 1,_loc8_,true,16777215);
            this.var_345 = true;
         }
         if(this.var_345)
         {
            this.var_923 = [];
            this.var_1413 = [];
            if(this.var_66 != null)
            {
               this.var_66.fillRect(this.var_66.rect,16777215);
            }
            this.resetTextureCache(param1);
            _loc9_ = param2.getCoordinatePosition(this.var_588);
            _loc10_ = 0;
            _loc11_ = 0;
            _loc5_ = 0;
            while(_loc5_ < this.var_250.length)
            {
               _loc3_ = this.var_250[_loc5_] as RoomPlaneBitmapMask;
               if(_loc3_ != null)
               {
                  _loc10_ = this.var_66.width - this.var_66.width * _loc3_.leftSideLoc / this.var_276.length;
                  _loc11_ = this.var_66.height - this.var_66.height * _loc3_.rightSideLoc / this.var_277.length;
                  _loc12_ = _loc3_.type;
                  this.var_666.updateMask(this.var_66,_loc12_,param2.scale,_loc9_,_loc10_,_loc11_);
                  this.var_923.push(new RoomPlaneBitmapMask(_loc12_,_loc3_.leftSideLoc,_loc3_.rightSideLoc));
               }
               _loc5_++;
            }
            _loc6_ = 0;
            while(_loc6_ < this.var_346.length)
            {
               _loc4_ = this.var_346[_loc6_] as RoomPlaneRectangleMask;
               if(_loc4_ != null)
               {
                  _loc10_ = this.var_66.width - this.var_66.width * _loc4_.leftSideLoc / this.var_276.length;
                  _loc11_ = this.var_66.height - this.var_66.height * _loc4_.rightSideLoc / this.var_277.length;
                  _loc13_ = this.var_66.width * _loc4_.leftSideLength / this.var_276.length;
                  _loc14_ = this.var_66.height * _loc4_.rightSideLength / this.var_277.length;
                  this.var_66.fillRect(new Rectangle(_loc10_ - _loc13_,_loc11_ - _loc14_,_loc13_,_loc14_),4278190080);
                  this.var_1413.push(new RoomPlaneRectangleMask(_loc4_.leftSideLength,_loc4_.rightSideLoc,_loc4_.leftSideLength,_loc4_.rightSideLength));
               }
               _loc6_++;
            }
            this.var_345 = false;
         }
         this.combineTextureMask(param1,this.var_66);
      }
      
      private function combineTextureMask(param1:BitmapData, param2:BitmapData) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(this.var_210 != null && (this.var_210.width != param1.width || this.var_210.height != param1.height))
         {
            this.var_210.dispose();
            this.var_210 = null;
         }
         if(this.var_210 == null)
         {
            this.var_210 = new BitmapData(param1.width,param1.height,true,4294967295);
         }
         this.var_210.copyChannel(param1,param1.rect,new Point(0,0),BitmapDataChannel.ALPHA,BitmapDataChannel.RED);
         this.var_210.draw(param2,null,null,BlendMode.DARKEN);
         param1.copyChannel(this.var_210,this.var_210.rect,new Point(0,0),BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
      }
   }
}
