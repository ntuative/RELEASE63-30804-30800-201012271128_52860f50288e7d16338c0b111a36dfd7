package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_187;
         param1["bound_to_parent_rect"] = const_91;
         param1["child_window"] = const_1005;
         param1["embedded_controller"] = const_1016;
         param1["resize_to_accommodate_children"] = const_64;
         param1["input_event_processor"] = const_28;
         param1["internal_event_handling"] = const_608;
         param1["mouse_dragging_target"] = const_256;
         param1["mouse_dragging_trigger"] = const_328;
         param1["mouse_scaling_target"] = const_268;
         param1["mouse_scaling_trigger"] = const_431;
         param1["horizontal_mouse_scaling_trigger"] = const_226;
         param1["vertical_mouse_scaling_trigger"] = const_200;
         param1["observe_parent_input_events"] = const_908;
         param1["optimize_region_to_layout_size"] = const_417;
         param1["parent_window"] = const_990;
         param1["relative_horizontal_scale_center"] = const_188;
         param1["relative_horizontal_scale_fixed"] = const_127;
         param1["relative_horizontal_scale_move"] = const_336;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_1006;
         param1["relative_scale_fixed"] = const_563;
         param1["relative_scale_move"] = const_1102;
         param1["relative_scale_strech"] = const_1095;
         param1["relative_vertical_scale_center"] = const_164;
         param1["relative_vertical_scale_fixed"] = const_136;
         param1["relative_vertical_scale_move"] = const_333;
         param1["relative_vertical_scale_strech"] = const_342;
         param1["on_resize_align_left"] = const_666;
         param1["on_resize_align_right"] = const_464;
         param1["on_resize_align_center"] = const_411;
         param1["on_resize_align_top"] = const_764;
         param1["on_resize_align_bottom"] = const_436;
         param1["on_resize_align_middle"] = const_524;
         param1["on_accommodate_align_left"] = const_1065;
         param1["on_accommodate_align_right"] = const_481;
         param1["on_accommodate_align_center"] = const_651;
         param1["on_accommodate_align_top"] = const_896;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_609;
         param1["route_input_events_to_parent"] = const_399;
         param1["use_parent_graphic_context"] = const_31;
         param1["draggable_with_mouse"] = const_1094;
         param1["scalable_with_mouse"] = const_1051;
         param1["reflect_horizontal_resize_to_parent"] = const_466;
         param1["reflect_vertical_resize_to_parent"] = const_504;
         param1["reflect_resize_to_parent"] = const_260;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
