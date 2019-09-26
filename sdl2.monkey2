
Namespace sdl2

#Import "<jni>"
#Import "<libc>"

#Import "SDL/include/*.h"

#If __TARGET__="android"

#Import "SDL/src/core/android/SDL_android.h"

#Endif

#Import "<SDL.h>"

#Import "makefile.monkey2"

#Import "sdl_2d_render.monkey2"
Using libc
Extern

#If __TARGET__="android"

Function Android_JNI_GetEnv:jni.JNIEnv()
Function Android_JNI_GetActivityClass:jni.jclass()
Function Android_JNI_SetActivityTitle( title:CString )

#Endif

'Struct SDL_Surface  'moved to sdl_2d_render.monkey2
'End

Enum SDL_bool
End

Const SDL_FALSE:SDL_bool
Const SDL_TRUE:SDL_bool

'${EXTERN}

'FILE="sdl2/SDL_rwops.h"
Struct SDL_RWops
End

Const RW_SEEK_SET:Int
Const RW_SEEK_CUR:Int
Const RW_SEEK_END:Int

Function SDL_RWFromMem:SDL_RWops Ptr( mem:Void Ptr,size:Int )
Function SDL_RWFromFile:SDL_RWops Ptr( file:CString,mode:CString )

Function SDL_RWsize:Long( ops:SDL_RWops Ptr )
Function SDL_RWtell:Long( ops:SDL_RWops Ptr )
Function SDL_RWseek:Long( ops:SDL_RWops Ptr,offset:Long,whence:Int )
Function SDL_RWread:Long( ops:SDL_RWops Ptr,buf:Void Ptr,size:Long,count:Long )
Function SDL_RWwrite:Long( ops:SDL_RWops Ptr,buf:Void Ptr,size:Long,count:Long )
Function SDL_RWclose:Int( ops:SDL_RWops Ptr )

'FILE=sdl2/SDL_hints.h

Function SDL_SetHint( name:CString,value:CString )

'FILE="sdl2/SDL.h"

Const SDL_INIT_TIMER:Int
Const SDL_INIT_AUDIO:Int
Const SDL_INIT_VIDEO:Int
Const SDL_INIT_JOYSTICK:Int
Const SDL_INIT_HAPTIC:Int
Const SDL_INIT_GAMECONTROLLER:Int
Const SDL_INIT_EVENTS:Int
Const SDL_INIT_NOPARACHUTE:Int
Const SDL_INIT_EVERYTHING:Int

Function SDL_Init:Int(flags_:Int)
Function SDL_InitSubSystem:Int(flags_:Int)
Function SDL_QuitSubSystem:Void(flags_:Int)
Function SDL_WasInit:Int(flags_:Int)
Function SDL_Quit:Void()

'FILE="sdl2/SDL_error.h"

Function SDL_GetError:char_t Ptr()
Function SDL_ClearError:Void()
Const SDL_OutOfMemory:Int
Const SDL_Unsupported:Int
Const SDL_InvalidParamError:Int
Enum SDL_errorcode
End
Const SDL_ENOMEM:SDL_errorcode
Const SDL_EFREAD:SDL_errorcode
Const SDL_EFWRITE:SDL_errorcode
Const SDL_EFSEEK:SDL_errorcode
Const SDL_UNSUPPORTED:SDL_errorcode
Const SDL_LASTERROR:SDL_errorcode
Function SDL_Error:Int(code_:SDL_errorcode)

'FILE="sdl2/SDL_timer.h"

Function SDL_GetTicks:Int()
Const SDL_TICKS_PASSED:Int
Function SDL_GetPerformanceCounter:Long()
Function SDL_GetPerformanceFrequency:Long()
Function SDL_Delay:Void(ms_:Int)
Alias SDL_TimerCallback:Int(Int,Void Ptr)
Alias SDL_TimerID:Int
Function SDL_AddTimer:SDL_TimerID(interval_:Int,callback_:SDL_TimerCallback,param_:Void Ptr)
Function SDL_RemoveTimer:SDL_bool(id_:SDL_TimerID)

'FILE="sdl2/SDL_rect.h"

Struct SDL_Point
	Field x:Int
	Field y:Int
End
Struct SDL_Rect
	Field x:Int
	Field y:Int
	Field w:Int
	Field h:Int
End
Function SDL_PointInRect:SDL_bool(p_:SDL_Point Ptr,r_:SDL_Rect Ptr)
Function SDL_RectEmpty:SDL_bool(r_:SDL_Rect Ptr)
Function SDL_RectEquals:SDL_bool(a_:SDL_Rect Ptr,b_:SDL_Rect Ptr)
Function SDL_HasIntersection:SDL_bool(A_:SDL_Rect Ptr,B_:SDL_Rect Ptr)
Function SDL_IntersectRect:SDL_bool(A_:SDL_Rect Ptr,B_:SDL_Rect Ptr,result_:SDL_Rect Ptr)
Function SDL_UnionRect:Void(A_:SDL_Rect Ptr,B_:SDL_Rect Ptr,result_:SDL_Rect Ptr)
Function SDL_EnclosePoints:SDL_bool(points_:SDL_Point Ptr,count_:Int,clip_:SDL_Rect Ptr,result_:SDL_Rect Ptr)
Function SDL_IntersectRectAndLine:SDL_bool(rect_:SDL_Rect Ptr,X1_:Int Ptr,Y1_:Int Ptr,X2_:Int Ptr,Y2_:Int Ptr)

'FILE="sdl2/sdl_video.h"

Struct SDL_DisplayMode
	Field format:Int
	Field w:Int
	Field h:Int
	Field refresh_rate:Int
	Field driverdata:Void Ptr
End
Struct SDL_Window
	Field w:Int
	Field h:int
End
Enum SDL_WindowFlags
End
Const SDL_WINDOW_FULLSCREEN:SDL_WindowFlags
Const SDL_WINDOW_OPENGL:SDL_WindowFlags
Const SDL_WINDOW_SHOWN:SDL_WindowFlags
Const SDL_WINDOW_HIDDEN:SDL_WindowFlags
Const SDL_WINDOW_BORDERLESS:SDL_WindowFlags
Const SDL_WINDOW_RESIZABLE:SDL_WindowFlags
Const SDL_WINDOW_MINIMIZED:SDL_WindowFlags
Const SDL_WINDOW_MAXIMIZED:SDL_WindowFlags
Const SDL_WINDOW_INPUT_GRABBED:SDL_WindowFlags
Const SDL_WINDOW_INPUT_FOCUS:SDL_WindowFlags
Const SDL_WINDOW_MOUSE_FOCUS:SDL_WindowFlags
Const SDL_WINDOW_FULLSCREEN_DESKTOP:SDL_WindowFlags
Const SDL_WINDOW_FOREIGN:SDL_WindowFlags
Const SDL_WINDOW_ALLOW_HIGHDPI:SDL_WindowFlags
Const SDL_WINDOW_MOUSE_CAPTURE:SDL_WindowFlags
Const SDL_WINDOW_FLOATING:SDL_WindowFlags

Const SDL_WINDOWPOS_UNDEFINED_MASK:Int
Const SDL_WINDOWPOS_UNDEFINED_DISPLAY:Int
Const SDL_WINDOWPOS_UNDEFINED:Int
Const SDL_WINDOWPOS_ISUNDEFINED:Int
Const SDL_WINDOWPOS_CENTERED_MASK:Int
Const SDL_WINDOWPOS_CENTERED_DISPLAY:Int
Const SDL_WINDOWPOS_CENTERED:Int
Const SDL_WINDOWPOS_ISCENTERED:Int
Enum SDL_WindowEventID
End
Const SDL_WINDOWEVENT_NONE:SDL_WindowEventID
Const SDL_WINDOWEVENT_SHOWN:SDL_WindowEventID
Const SDL_WINDOWEVENT_HIDDEN:SDL_WindowEventID
Const SDL_WINDOWEVENT_EXPOSED:SDL_WindowEventID
Const SDL_WINDOWEVENT_MOVED:SDL_WindowEventID
Const SDL_WINDOWEVENT_RESIZED:SDL_WindowEventID
Const SDL_WINDOWEVENT_SIZE_CHANGED:SDL_WindowEventID
Const SDL_WINDOWEVENT_MINIMIZED:SDL_WindowEventID
Const SDL_WINDOWEVENT_MAXIMIZED:SDL_WindowEventID
Const SDL_WINDOWEVENT_RESTORED:SDL_WindowEventID
Const SDL_WINDOWEVENT_ENTER:SDL_WindowEventID
Const SDL_WINDOWEVENT_LEAVE:SDL_WindowEventID
Const SDL_WINDOWEVENT_FOCUS_GAINED:SDL_WindowEventID
Const SDL_WINDOWEVENT_FOCUS_LOST:SDL_WindowEventID
Const SDL_WINDOWEVENT_CLOSE:SDL_WindowEventID
Alias SDL_GLContext:Void Ptr
Enum SDL_GLattr
End
Const SDL_GL_RED_SIZE:SDL_GLattr
Const SDL_GL_GREEN_SIZE:SDL_GLattr
Const SDL_GL_BLUE_SIZE:SDL_GLattr
Const SDL_GL_ALPHA_SIZE:SDL_GLattr
Const SDL_GL_BUFFER_SIZE:SDL_GLattr
Const SDL_GL_DOUBLEBUFFER:SDL_GLattr
Const SDL_GL_DEPTH_SIZE:SDL_GLattr
Const SDL_GL_STENCIL_SIZE:SDL_GLattr
Const SDL_GL_ACCUM_RED_SIZE:SDL_GLattr
Const SDL_GL_ACCUM_GREEN_SIZE:SDL_GLattr
Const SDL_GL_ACCUM_BLUE_SIZE:SDL_GLattr
Const SDL_GL_ACCUM_ALPHA_SIZE:SDL_GLattr
Const SDL_GL_STEREO:SDL_GLattr
Const SDL_GL_MULTISAMPLEBUFFERS:SDL_GLattr
Const SDL_GL_MULTISAMPLESAMPLES:SDL_GLattr
Const SDL_GL_ACCELERATED_VISUAL:SDL_GLattr
Const SDL_GL_RETAINED_BACKING:SDL_GLattr
Const SDL_GL_CONTEXT_MAJOR_VERSION:SDL_GLattr
Const SDL_GL_CONTEXT_MINOR_VERSION:SDL_GLattr
Const SDL_GL_CONTEXT_EGL:SDL_GLattr
Const SDL_GL_CONTEXT_FLAGS:SDL_GLattr
Const SDL_GL_CONTEXT_PROFILE_MASK:SDL_GLattr
Const SDL_GL_SHARE_WITH_CURRENT_CONTEXT:SDL_GLattr
Const SDL_GL_FRAMEBUFFER_SRGB_CAPABLE:SDL_GLattr
Const SDL_GL_CONTEXT_RELEASE_BEHAVIOR:SDL_GLattr
Enum SDL_GLprofile
End
Const SDL_GL_CONTEXT_PROFILE_CORE:SDL_GLprofile
Const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY:SDL_GLprofile
Const SDL_GL_CONTEXT_PROFILE_ES:SDL_GLprofile
Enum SDL_GLcontextFlag
End
Const SDL_GL_CONTEXT_DEBUG_FLAG:SDL_GLcontextFlag
Const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG:SDL_GLcontextFlag
Const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG:SDL_GLcontextFlag
Const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG:SDL_GLcontextFlag
Enum SDL_GLcontextReleaseFlag
End
Const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE:SDL_GLcontextReleaseFlag
Const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH:SDL_GLcontextReleaseFlag
Function SDL_GetNumVideoDrivers:Int()
Function SDL_GetVideoDriver:char_t Ptr(index_:Int)
Function SDL_VideoInit:Int(driver_name_:CString)
Function SDL_VideoQuit:Void()
Function SDL_GetCurrentVideoDriver:char_t Ptr()
Function SDL_GetNumVideoDisplays:Int()
Function SDL_GetDisplayName:char_t Ptr(displayIndex_:Int)
Function SDL_GetDisplayBounds:Int(displayIndex_:Int,rect_:SDL_Rect Ptr)
Function SDL_GetDisplayDPI:Int( displayIndex:Int,ddpi:Float Ptr,hdpi:Float Ptr,vdpi:Float Ptr )
Function SDL_GetNumDisplayModes:Int(displayIndex_:Int)
Function SDL_GetDisplayMode:Int(displayIndex_:Int,modeIndex_:Int,mode_:SDL_DisplayMode Ptr)
Function SDL_GetDesktopDisplayMode:Int(displayIndex_:Int,mode_:SDL_DisplayMode Ptr)
Function SDL_GetCurrentDisplayMode:Int(displayIndex_:Int,mode_:SDL_DisplayMode Ptr)
Function SDL_GetClosestDisplayMode:SDL_DisplayMode Ptr(displayIndex_:Int,mode_:SDL_DisplayMode Ptr,closest_:SDL_DisplayMode Ptr)
Function SDL_GetWindowDisplayIndex:Int(window_:SDL_Window Ptr)
Function SDL_SetWindowDisplayMode:Int(window_:SDL_Window Ptr,mode_:SDL_DisplayMode Ptr)
Function SDL_GetWindowDisplayMode:Int(window_:SDL_Window Ptr,mode_:SDL_DisplayMode Ptr)
Function SDL_GetWindowPixelFormat:Int(window_:SDL_Window Ptr)
Function SDL_CreateWindow:SDL_Window Ptr(title_:CString,x_:Int,y_:Int,w_:Int,h_:Int,flags_:Int)
Function SDL_CreateWindowFrom:SDL_Window Ptr(data_:Void Ptr)
Function SDL_GetWindowID:Int(window_:SDL_Window Ptr)
Function SDL_GetWindowFromID:SDL_Window Ptr(id_:Int)
Function SDL_GetWindowFlags:Int(window_:SDL_Window Ptr)
Function SDL_SetWindowTitle:Void(window_:SDL_Window Ptr,title_:CString)
Function SDL_GetWindowTitle:char_t Ptr(window_:SDL_Window Ptr)
Function SDL_SetWindowIcon:Void(window_:SDL_Window Ptr,icon_:SDL_Surface Ptr)
Function SDL_SetWindowData:Void Ptr(window_:SDL_Window Ptr,name_:CString,userdata_:Void Ptr)
Function SDL_GetWindowData:Void Ptr(window_:SDL_Window Ptr,name_:CString)
Function SDL_SetWindowPosition:Void(window_:SDL_Window Ptr,x_:Int,y_:Int)
Function SDL_GetWindowPosition:Void(window_:SDL_Window Ptr,x_:Int Ptr,y_:Int Ptr)
Function SDL_SetWindowSize:Void(window_:SDL_Window Ptr,w_:Int,h_:Int)
Function SDL_GetWindowSize:Void(window_:SDL_Window Ptr,w_:Int Ptr,h_:Int Ptr)
Function SDL_SetWindowMinimumSize:Void(window_:SDL_Window Ptr,min_w_:Int,min_h_:Int)
Function SDL_GetWindowMinimumSize:Void(window_:SDL_Window Ptr,w_:Int Ptr,h_:Int Ptr)
Function SDL_SetWindowMaximumSize:Void(window_:SDL_Window Ptr,max_w_:Int,max_h_:Int)
Function SDL_GetWindowMaximumSize:Void(window_:SDL_Window Ptr,w_:Int Ptr,h_:Int Ptr)
Function SDL_SetWindowBordered:Void(window_:SDL_Window Ptr,bordered_:SDL_bool)
Function SDL_ShowWindow:Void(window_:SDL_Window Ptr)
Function SDL_HideWindow:Void(window_:SDL_Window Ptr)
Function SDL_RaiseWindow:Void(window_:SDL_Window Ptr)
Function SDL_MaximizeWindow:Void(window_:SDL_Window Ptr)
Function SDL_MinimizeWindow:Void(window_:SDL_Window Ptr)
Function SDL_RestoreWindow:Void(window_:SDL_Window Ptr)
Function SDL_SetWindowFullscreen:Int(window_:SDL_Window Ptr,flags_:Int)
Function SDL_GetWindowSurface:SDL_Surface Ptr(window_:SDL_Window Ptr)
Function SDL_UpdateWindowSurface:Int(window_:SDL_Window Ptr)
Function SDL_UpdateWindowSurfaceRects:Int(window_:SDL_Window Ptr,rects_:SDL_Rect Ptr,numrects_:Int)
Function SDL_SetWindowGrab:Void(window_:SDL_Window Ptr,grabbed_:SDL_bool)
Function SDL_GetWindowGrab:SDL_bool(window_:SDL_Window Ptr)
Function SDL_SetWindowBrightness:Int(window_:SDL_Window Ptr,brightness_:Float)
Function SDL_GetWindowBrightness:Float(window_:SDL_Window Ptr)
Function SDL_SetWindowGammaRamp:Int(window_:SDL_Window Ptr,red_:Short Ptr,green_:Short Ptr,blue_:Short Ptr)
Function SDL_GetWindowGammaRamp:Int(window_:SDL_Window Ptr,red_:Short Ptr,green_:Short Ptr,blue_:Short Ptr)
Enum SDL_HitTestResult
End
Const SDL_HITTEST_NORMAL:SDL_HitTestResult
Const SDL_HITTEST_DRAGGABLE:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_TOPLEFT:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_TOP:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_TOPRIGHT:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_RIGHT:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_BOTTOMRIGHT:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_BOTTOM:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_BOTTOMLEFT:SDL_HitTestResult
Const SDL_HITTEST_RESIZE_LEFT:SDL_HitTestResult
Alias SDL_HitTest:SDL_HitTestResult(SDL_Window Ptr,SDL_Point Ptr,Void Ptr)
Function SDL_SetWindowHitTest:Int(window_:SDL_Window Ptr,callback_:SDL_HitTest,callback_data_:Void Ptr)
Function SDL_DestroyWindow:Void(window_:SDL_Window Ptr)
Function SDL_IsScreenSaverEnabled:SDL_bool()
Function SDL_EnableScreenSaver:Void()
Function SDL_DisableScreenSaver:Void()
Function SDL_GL_LoadLibrary:Int(path_:CString)
Function SDL_GL_GetProcAddress:Void Ptr(proc_:CString)
Function SDL_GL_UnloadLibrary:Void()
Function SDL_GL_ExtensionSupported:SDL_bool(extension_:CString)
Function SDL_GL_ResetAttributes:Void()
Function SDL_GL_SetAttribute:Int(attr_:SDL_GLattr,value_:Int)
Function SDL_GL_GetAttribute:Int(attr_:SDL_GLattr,value_:Int Ptr)
Function SDL_GL_CreateContext:SDL_GLContext(window_:SDL_Window Ptr)
Function SDL_GL_MakeCurrent:Int(window_:SDL_Window Ptr,context_:SDL_GLContext)
Function SDL_GL_GetCurrentWindow:SDL_Window Ptr()
Function SDL_GL_GetCurrentContext:SDL_GLContext()
Function SDL_GL_GetDrawableSize:Void(window_:SDL_Window Ptr,w_:Int Ptr,h_:Int Ptr)
Function SDL_GL_SetSwapInterval:Int(interval_:Int)
Function SDL_GL_GetSwapInterval:Int()
Function SDL_GL_SwapWindow:Void(window_:SDL_Window Ptr)
Function SDL_GL_DeleteContext:Void(context_:SDL_GLContext)

'FILE="sdl2/sdl_touch.h"

Alias SDL_TouchID:Long
Alias SDL_FingerID:Long
Struct SDL_Finger
	Field id:SDL_FingerID
	Field x:Float
	Field y:Float
	Field pressure:Float
End
Const SDL_TOUCH_MOUSEID:Int
Function SDL_GetNumTouchDevices:Int()
Function SDL_GetTouchDevice:SDL_TouchID(index_:Int)
Function SDL_GetNumTouchFingers:Int(touchID_:SDL_TouchID)
Function SDL_GetTouchFinger:SDL_Finger Ptr(touchID_:SDL_TouchID,index_:Int)

'FILE="sdl2/sdl_mouse.h"

Struct SDL_Cursor
End
Enum SDL_SystemCursor
End
Const SDL_SYSTEM_CURSOR_ARROW:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_IBEAM:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_WAIT:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_CROSSHAIR:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_WAITARROW:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_SIZENWSE:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_SIZENESW:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_SIZEWE:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_SIZENS:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_SIZEALL:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_NO:SDL_SystemCursor
Const SDL_SYSTEM_CURSOR_HAND:SDL_SystemCursor
Const SDL_NUM_SYSTEM_CURSORS:SDL_SystemCursor
Enum SDL_MouseWheelDirection
End
Const SDL_MOUSEWHEEL_NORMAL:SDL_MouseWheelDirection
Const SDL_MOUSEWHEEL_FLIPPED:SDL_MouseWheelDirection
Function SDL_GetMouseFocus:SDL_Window Ptr()
Function SDL_GetMouseState:Int(x_:Int Ptr,y_:Int Ptr)
Function SDL_GetGlobalMouseState:Int(x_:Int Ptr,y_:Int Ptr)
Function SDL_GetRelativeMouseState:Int(x_:Int Ptr,y_:Int Ptr)
Function SDL_WarpMouseInWindow:Void(window_:SDL_Window Ptr,x_:Int,y_:Int)
Function SDL_WarpMouseGlobal:Void(x_:Int,y_:Int)
Function SDL_SetRelativeMouseMode:Int(enabled_:SDL_bool)
Function SDL_CaptureMouse:Int(enabled_:SDL_bool)
Function SDL_GetRelativeMouseMode:SDL_bool()
Function SDL_CreateCursor:SDL_Cursor Ptr(data_:CString,mask_:CString,w_:Int,h_:Int,hot_x_:Int,hot_y_:Int)
Function SDL_CreateColorCursor:SDL_Cursor Ptr(surface_:SDL_Surface Ptr,hot_x_:Int,hot_y_:Int)
Function SDL_CreateSystemCursor:SDL_Cursor Ptr(id_:SDL_SystemCursor)
Function SDL_SetCursor:Void(cursor_:SDL_Cursor Ptr)
Function SDL_GetCursor:SDL_Cursor Ptr()
Function SDL_GetDefaultCursor:SDL_Cursor Ptr()
Function SDL_FreeCursor:Void(cursor_:SDL_Cursor Ptr)
Function SDL_ShowCursor:Int(toggle_:Int)
Const SDL_BUTTON:Int
Const SDL_BUTTON_LEFT:Int
Const SDL_BUTTON_MIDDLE:Int
Const SDL_BUTTON_RIGHT:Int
Const SDL_BUTTON_X1:Int
Const SDL_BUTTON_X2:Int
Const SDL_BUTTON_LMASK:Int
Const SDL_BUTTON_MMASK:Int
Const SDL_BUTTON_RMASK:Int
Const SDL_BUTTON_X1MASK:Int
Const SDL_BUTTON_X2MASK:Int

'FILE="sdl2/sdl_joystick.h"

Struct SDL_Joystick
End
Struct SDL_JoystickGUID
End
Alias SDL_JoystickID:Int
Function SDL_NumJoysticks:Int()
Function SDL_JoystickNameForIndex:CString(device_index_:Int)
Function SDL_JoystickOpen:SDL_Joystick Ptr(device_index_:Int)
Function SDL_JoystickName:CString(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickGetDeviceGUID:SDL_JoystickGUID(device_index_:Int)
Function SDL_JoystickGetGUID:SDL_JoystickGUID(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickGetGUIDString:Void(guid_:SDL_JoystickGUID,pszGUID_:char_t Ptr ,cbGUID_:Int)
Function SDL_JoystickGetGUIDFromString:SDL_JoystickGUID(pchGUID_:CString)
Function SDL_JoystickGetAttached:SDL_bool(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickInstanceID:SDL_JoystickID(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickNumAxes:Int(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickNumBalls:Int(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickNumHats:Int(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickNumButtons:Int(joystick_:SDL_Joystick Ptr)
Function SDL_JoystickUpdate:Void()
Function SDL_JoystickEventState:Int(state_:Int)
Function SDL_JoystickGetAxis:Short(joystick_:SDL_Joystick Ptr,axis_:Int)
Function SDL_JoystickFromInstanceID:SDL_Joystick Ptr( instanceID:Int )
Const SDL_HAT_CENTERED:Int
Const SDL_HAT_UP:Int
Const SDL_HAT_RIGHT:Int
Const SDL_HAT_DOWN:Int
Const SDL_HAT_LEFT:Int
Const SDL_HAT_RIGHTUP:Int
Const SDL_HAT_RIGHTDOWN:Int
Const SDL_HAT_LEFTUP:Int
Const SDL_HAT_LEFTDOWN:Int
Function SDL_JoystickGetHat:Byte(joystick_:SDL_Joystick Ptr,hat_:Int)
Function SDL_JoystickGetBall:Int(joystick_:SDL_Joystick Ptr,ball_:Int,dx_:Int Ptr,dy_:Int Ptr)
Function SDL_JoystickGetButton:Byte(joystick_:SDL_Joystick Ptr,button_:Int)
Function SDL_JoystickClose:Void(joystick_:SDL_Joystick Ptr)

'FILE="sdl2/sdl_gamecontroller.h"

Struct SDL_GameController
End

Struct SDL_GameControllerButtonBind
End

Enum SDL_GameControllerAxis
End

Const SDL_CONTROLLER_AXIS_INVALID:SDL_GameControllerAxis	'-1
Const SDL_CONTROLLER_AXIS_LEFTX:SDL_GameControllerAxis
Const SDL_CONTROLLER_AXIS_LEFTY:SDL_GameControllerAxis
Const SDL_CONTROLLER_AXIS_RIGHTX:SDL_GameControllerAxis
Const SDL_CONTROLLER_AXIS_RIGHTY:SDL_GameControllerAxis
Const SDL_CONTROLLER_AXIS_TRIGGERLEFT:SDL_GameControllerAxis
Const SDL_CONTROLLER_AXIS_TRIGGERRIGHT:SDL_GameControllerAxis

Enum SDL_GameControllerButton
End

Const SDL_CONTROLLER_BUTTON_INVALID:SDL_GameControllerButton		'-1
Const SDL_CONTROLLER_BUTTON_A:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_B:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_X:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_Y:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_BACK:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_GUIDE:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_START:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_LEFTSTICK:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_RIGHTSTICK:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_LEFTSHOULDER:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_RIGHTSHOULDER:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_DPAD_UP:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_DPAD_DOWN:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_DPAD_LEFT:SDL_GameControllerButton
Const SDL_CONTROLLER_BUTTON_DPAD_RIGHT:SDL_GameControllerButton

Function SDL_GameControllerAddMapping:Int( mappingString:CString )
Function SDL_GameControllerMappingForGUID:libc.char_t Ptr( guid:SDL_JoystickGUID )
Function SDL_GameControllerMapping:libc.char_t Ptr( gamecontroller:SDL_GameController Ptr )
Function SDL_IsGameController:SDL_bool( joystick_index:Int )
Function SDL_GameControllerNameForIndex:CString( joystick_index:Int )
Function SDL_GameControllerOpen:SDL_GameController Ptr( joystick_index:Int )
Function SDL_GameControllerFromInstanceID:SDL_GameController Ptr( joyid:Int )
Function SDL_GameControllerName:CString( gamecontroller:SDL_GameController Ptr )
Function SDL_GameControllerGetVendor:ushort( gamecontroller:SDL_GameController Ptr )
Function SDL_GameControllerGetProduct:UShort( gamecontroller:SDL_GameController Ptr )
Function SDL_GameControllerGetProductVersion:Short( gamecontroller:SDL_GameController Ptr )
Function SDL_GameControllerGetAttached:SDL_bool( gamecontroller:SDL_GameController Ptr )
Function SDL_GameControllerGetJoystick:SDL_Joystick Ptr( gamecontroller:SDL_GameController Ptr )
Function SDL_GameControllerEventState:Int( state:Int )
Function SDL_GameControllerUpdate()

Function SDL_GameControllerGetAxisFromString:SDL_GameControllerAxis( pchString:CString )
Function SDL_GameControllerGetStringForAxis:CString( axis:SDL_GameControllerAxis )
Function SDL_GameControllerGetBindForAxis:SDL_GameControllerButtonBind( gamecontroller:SDL_GameController Ptr,axis:SDL_GameControllerAxis )
Function SDL_GameControllerGetAxis:Short( gamecontroller:SDL_GameController Ptr,axis:SDL_GameControllerAxis )

Function SDL_GameControllerGetButtonFromString:SDL_GameControllerButton( pchString:CString )
Function SDL_GameControllerGetStringForButton:CString( button:SDL_GameControllerButton )
Function SDL_GameControllerGetBindForButton:SDL_GameControllerButtonBind( gamecontroller:SDL_GameController Ptr,button:SDL_GameControllerButton )
Function SDL_GameControllerGetButton:UByte( gamecontroller:SDL_GameController Ptr,button:SDL_GameControllerButton )

Function SDL_GameControllerClose( gamecontroller:SDL_GameController Ptr )

'FILE="sdl2/sdl_keycode.h"

Alias SDL_Keycode:Int
Const SDL_SCANCODE_TO_KEYCODE:Int
Enum SDL_Keymod
End
Const KMOD_NONE:SDL_Keymod
Const KMOD_LSHIFT:SDL_Keymod
Const KMOD_RSHIFT:SDL_Keymod
Const KMOD_LCTRL:SDL_Keymod
Const KMOD_RCTRL:SDL_Keymod
Const KMOD_LALT:SDL_Keymod
Const KMOD_RALT:SDL_Keymod
Const KMOD_LGUI:SDL_Keymod
Const KMOD_RGUI:SDL_Keymod
Const KMOD_NUM:SDL_Keymod
Const KMOD_CAPS:SDL_Keymod
Const KMOD_MODE:SDL_Keymod
Const KMOD_RESERVED:SDL_Keymod

'FILE="sdl2/sdl_scancode.h"

Enum SDL_Scancode
End
Const SDL_SCANCODE_UNKNOWN:SDL_Scancode
Const SDL_SCANCODE_A:SDL_Scancode
Const SDL_SCANCODE_B:SDL_Scancode
Const SDL_SCANCODE_C:SDL_Scancode
Const SDL_SCANCODE_D:SDL_Scancode
Const SDL_SCANCODE_E:SDL_Scancode
Const SDL_SCANCODE_F:SDL_Scancode
Const SDL_SCANCODE_G:SDL_Scancode
Const SDL_SCANCODE_H:SDL_Scancode
Const SDL_SCANCODE_I:SDL_Scancode
Const SDL_SCANCODE_J:SDL_Scancode
Const SDL_SCANCODE_K:SDL_Scancode
Const SDL_SCANCODE_L:SDL_Scancode
Const SDL_SCANCODE_M:SDL_Scancode
Const SDL_SCANCODE_N:SDL_Scancode
Const SDL_SCANCODE_O:SDL_Scancode
Const SDL_SCANCODE_P:SDL_Scancode
Const SDL_SCANCODE_Q:SDL_Scancode
Const SDL_SCANCODE_R:SDL_Scancode
Const SDL_SCANCODE_S:SDL_Scancode
Const SDL_SCANCODE_T:SDL_Scancode
Const SDL_SCANCODE_U:SDL_Scancode
Const SDL_SCANCODE_V:SDL_Scancode
Const SDL_SCANCODE_W:SDL_Scancode
Const SDL_SCANCODE_X:SDL_Scancode
Const SDL_SCANCODE_Y:SDL_Scancode
Const SDL_SCANCODE_Z:SDL_Scancode
Const SDL_SCANCODE_1:SDL_Scancode
Const SDL_SCANCODE_2:SDL_Scancode
Const SDL_SCANCODE_3:SDL_Scancode
Const SDL_SCANCODE_4:SDL_Scancode
Const SDL_SCANCODE_5:SDL_Scancode
Const SDL_SCANCODE_6:SDL_Scancode
Const SDL_SCANCODE_7:SDL_Scancode
Const SDL_SCANCODE_8:SDL_Scancode
Const SDL_SCANCODE_9:SDL_Scancode
Const SDL_SCANCODE_0:SDL_Scancode
Const SDL_SCANCODE_RETURN:SDL_Scancode
Const SDL_SCANCODE_ESCAPE:SDL_Scancode
Const SDL_SCANCODE_BACKSPACE:SDL_Scancode
Const SDL_SCANCODE_TAB:SDL_Scancode
Const SDL_SCANCODE_SPACE:SDL_Scancode
Const SDL_SCANCODE_MINUS:SDL_Scancode
Const SDL_SCANCODE_EQUALS:SDL_Scancode
Const SDL_SCANCODE_LEFTBRACKET:SDL_Scancode
Const SDL_SCANCODE_RIGHTBRACKET:SDL_Scancode
Const SDL_SCANCODE_BACKSLASH:SDL_Scancode
Const SDL_SCANCODE_NONUSHASH:SDL_Scancode
Const SDL_SCANCODE_SEMICOLON:SDL_Scancode
Const SDL_SCANCODE_APOSTROPHE:SDL_Scancode
Const SDL_SCANCODE_GRAVE:SDL_Scancode
Const SDL_SCANCODE_COMMA:SDL_Scancode
Const SDL_SCANCODE_PERIOD:SDL_Scancode
Const SDL_SCANCODE_SLASH:SDL_Scancode
Const SDL_SCANCODE_CAPSLOCK:SDL_Scancode
Const SDL_SCANCODE_F1:SDL_Scancode
Const SDL_SCANCODE_F2:SDL_Scancode
Const SDL_SCANCODE_F3:SDL_Scancode
Const SDL_SCANCODE_F4:SDL_Scancode
Const SDL_SCANCODE_F5:SDL_Scancode
Const SDL_SCANCODE_F6:SDL_Scancode
Const SDL_SCANCODE_F7:SDL_Scancode
Const SDL_SCANCODE_F8:SDL_Scancode
Const SDL_SCANCODE_F9:SDL_Scancode
Const SDL_SCANCODE_F10:SDL_Scancode
Const SDL_SCANCODE_F11:SDL_Scancode
Const SDL_SCANCODE_F12:SDL_Scancode
Const SDL_SCANCODE_PRINTSCREEN:SDL_Scancode
Const SDL_SCANCODE_SCROLLLOCK:SDL_Scancode
Const SDL_SCANCODE_PAUSE:SDL_Scancode
Const SDL_SCANCODE_INSERT:SDL_Scancode
Const SDL_SCANCODE_HOME:SDL_Scancode
Const SDL_SCANCODE_PAGEUP:SDL_Scancode
Const SDL_SCANCODE_DELETE:SDL_Scancode
Const SDL_SCANCODE_END:SDL_Scancode
Const SDL_SCANCODE_PAGEDOWN:SDL_Scancode
Const SDL_SCANCODE_RIGHT:SDL_Scancode
Const SDL_SCANCODE_LEFT:SDL_Scancode
Const SDL_SCANCODE_DOWN:SDL_Scancode
Const SDL_SCANCODE_UP:SDL_Scancode
Const SDL_SCANCODE_NUMLOCKCLEAR:SDL_Scancode
Const SDL_SCANCODE_KP_DIVIDE:SDL_Scancode
Const SDL_SCANCODE_KP_MULTIPLY:SDL_Scancode
Const SDL_SCANCODE_KP_MINUS:SDL_Scancode
Const SDL_SCANCODE_KP_PLUS:SDL_Scancode
Const SDL_SCANCODE_KP_ENTER:SDL_Scancode
Const SDL_SCANCODE_KP_1:SDL_Scancode
Const SDL_SCANCODE_KP_2:SDL_Scancode
Const SDL_SCANCODE_KP_3:SDL_Scancode
Const SDL_SCANCODE_KP_4:SDL_Scancode
Const SDL_SCANCODE_KP_5:SDL_Scancode
Const SDL_SCANCODE_KP_6:SDL_Scancode
Const SDL_SCANCODE_KP_7:SDL_Scancode
Const SDL_SCANCODE_KP_8:SDL_Scancode
Const SDL_SCANCODE_KP_9:SDL_Scancode
Const SDL_SCANCODE_KP_0:SDL_Scancode
Const SDL_SCANCODE_KP_PERIOD:SDL_Scancode
Const SDL_SCANCODE_NONUSBACKSLASH:SDL_Scancode
Const SDL_SCANCODE_APPLICATION:SDL_Scancode
Const SDL_SCANCODE_POWER:SDL_Scancode
Const SDL_SCANCODE_KP_EQUALS:SDL_Scancode
Const SDL_SCANCODE_F13:SDL_Scancode
Const SDL_SCANCODE_F14:SDL_Scancode
Const SDL_SCANCODE_F15:SDL_Scancode
Const SDL_SCANCODE_F16:SDL_Scancode
Const SDL_SCANCODE_F17:SDL_Scancode
Const SDL_SCANCODE_F18:SDL_Scancode
Const SDL_SCANCODE_F19:SDL_Scancode
Const SDL_SCANCODE_F20:SDL_Scancode
Const SDL_SCANCODE_F21:SDL_Scancode
Const SDL_SCANCODE_F22:SDL_Scancode
Const SDL_SCANCODE_F23:SDL_Scancode
Const SDL_SCANCODE_F24:SDL_Scancode
Const SDL_SCANCODE_EXECUTE:SDL_Scancode
Const SDL_SCANCODE_HELP:SDL_Scancode
Const SDL_SCANCODE_MENU:SDL_Scancode
Const SDL_SCANCODE_SELECT:SDL_Scancode
Const SDL_SCANCODE_STOP:SDL_Scancode
Const SDL_SCANCODE_AGAIN:SDL_Scancode
Const SDL_SCANCODE_UNDO:SDL_Scancode
Const SDL_SCANCODE_CUT:SDL_Scancode
Const SDL_SCANCODE_COPY:SDL_Scancode
Const SDL_SCANCODE_PASTE:SDL_Scancode
Const SDL_SCANCODE_FIND:SDL_Scancode
Const SDL_SCANCODE_MUTE:SDL_Scancode
Const SDL_SCANCODE_VOLUMEUP:SDL_Scancode
Const SDL_SCANCODE_VOLUMEDOWN:SDL_Scancode
Const SDL_SCANCODE_KP_COMMA:SDL_Scancode
Const SDL_SCANCODE_KP_EQUALSAS400:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL1:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL2:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL3:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL4:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL5:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL6:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL7:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL8:SDL_Scancode
Const SDL_SCANCODE_INTERNATIONAL9:SDL_Scancode
Const SDL_SCANCODE_LANG1:SDL_Scancode
Const SDL_SCANCODE_LANG2:SDL_Scancode
Const SDL_SCANCODE_LANG3:SDL_Scancode
Const SDL_SCANCODE_LANG4:SDL_Scancode
Const SDL_SCANCODE_LANG5:SDL_Scancode
Const SDL_SCANCODE_LANG6:SDL_Scancode
Const SDL_SCANCODE_LANG7:SDL_Scancode
Const SDL_SCANCODE_LANG8:SDL_Scancode
Const SDL_SCANCODE_LANG9:SDL_Scancode
Const SDL_SCANCODE_ALTERASE:SDL_Scancode
Const SDL_SCANCODE_SYSREQ:SDL_Scancode
Const SDL_SCANCODE_CANCEL:SDL_Scancode
Const SDL_SCANCODE_CLEAR:SDL_Scancode
Const SDL_SCANCODE_PRIOR:SDL_Scancode
Const SDL_SCANCODE_RETURN2:SDL_Scancode
Const SDL_SCANCODE_SEPARATOR:SDL_Scancode
Const SDL_SCANCODE_OUT:SDL_Scancode
Const SDL_SCANCODE_OPER:SDL_Scancode
Const SDL_SCANCODE_CLEARAGAIN:SDL_Scancode
Const SDL_SCANCODE_CRSEL:SDL_Scancode
Const SDL_SCANCODE_EXSEL:SDL_Scancode
Const SDL_SCANCODE_KP_00:SDL_Scancode
Const SDL_SCANCODE_KP_000:SDL_Scancode
Const SDL_SCANCODE_THOUSANDSSEPARATOR:SDL_Scancode
Const SDL_SCANCODE_DECIMALSEPARATOR:SDL_Scancode
Const SDL_SCANCODE_CURRENCYUNIT:SDL_Scancode
Const SDL_SCANCODE_CURRENCYSUBUNIT:SDL_Scancode
Const SDL_SCANCODE_KP_LEFTPAREN:SDL_Scancode
Const SDL_SCANCODE_KP_RIGHTPAREN:SDL_Scancode
Const SDL_SCANCODE_KP_LEFTBRACE:SDL_Scancode
Const SDL_SCANCODE_KP_RIGHTBRACE:SDL_Scancode
Const SDL_SCANCODE_KP_TAB:SDL_Scancode
Const SDL_SCANCODE_KP_BACKSPACE:SDL_Scancode
Const SDL_SCANCODE_KP_A:SDL_Scancode
Const SDL_SCANCODE_KP_B:SDL_Scancode
Const SDL_SCANCODE_KP_C:SDL_Scancode
Const SDL_SCANCODE_KP_D:SDL_Scancode
Const SDL_SCANCODE_KP_E:SDL_Scancode
Const SDL_SCANCODE_KP_F:SDL_Scancode
Const SDL_SCANCODE_KP_XOR:SDL_Scancode
Const SDL_SCANCODE_KP_POWER:SDL_Scancode
Const SDL_SCANCODE_KP_PERCENT:SDL_Scancode
Const SDL_SCANCODE_KP_LESS:SDL_Scancode
Const SDL_SCANCODE_KP_GREATER:SDL_Scancode
Const SDL_SCANCODE_KP_AMPERSAND:SDL_Scancode
Const SDL_SCANCODE_KP_DBLAMPERSAND:SDL_Scancode
Const SDL_SCANCODE_KP_VERTICALBAR:SDL_Scancode
Const SDL_SCANCODE_KP_DBLVERTICALBAR:SDL_Scancode
Const SDL_SCANCODE_KP_COLON:SDL_Scancode
Const SDL_SCANCODE_KP_HASH:SDL_Scancode
Const SDL_SCANCODE_KP_SPACE:SDL_Scancode
Const SDL_SCANCODE_KP_AT:SDL_Scancode
Const SDL_SCANCODE_KP_EXCLAM:SDL_Scancode
Const SDL_SCANCODE_KP_MEMSTORE:SDL_Scancode
Const SDL_SCANCODE_KP_MEMRECALL:SDL_Scancode
Const SDL_SCANCODE_KP_MEMCLEAR:SDL_Scancode
Const SDL_SCANCODE_KP_MEMADD:SDL_Scancode
Const SDL_SCANCODE_KP_MEMSUBTRACT:SDL_Scancode
Const SDL_SCANCODE_KP_MEMMULTIPLY:SDL_Scancode
Const SDL_SCANCODE_KP_MEMDIVIDE:SDL_Scancode
Const SDL_SCANCODE_KP_PLUSMINUS:SDL_Scancode
Const SDL_SCANCODE_KP_CLEAR:SDL_Scancode
Const SDL_SCANCODE_KP_CLEARENTRY:SDL_Scancode
Const SDL_SCANCODE_KP_BINARY:SDL_Scancode
Const SDL_SCANCODE_KP_OCTAL:SDL_Scancode
Const SDL_SCANCODE_KP_DECIMAL:SDL_Scancode
Const SDL_SCANCODE_KP_HEXADECIMAL:SDL_Scancode
Const SDL_SCANCODE_LCTRL:SDL_Scancode
Const SDL_SCANCODE_LSHIFT:SDL_Scancode
Const SDL_SCANCODE_LALT:SDL_Scancode
Const SDL_SCANCODE_LGUI:SDL_Scancode
Const SDL_SCANCODE_RCTRL:SDL_Scancode
Const SDL_SCANCODE_RSHIFT:SDL_Scancode
Const SDL_SCANCODE_RALT:SDL_Scancode
Const SDL_SCANCODE_RGUI:SDL_Scancode
Const SDL_SCANCODE_MODE:SDL_Scancode
Const SDL_SCANCODE_AUDIONEXT:SDL_Scancode
Const SDL_SCANCODE_AUDIOPREV:SDL_Scancode
Const SDL_SCANCODE_AUDIOSTOP:SDL_Scancode
Const SDL_SCANCODE_AUDIOPLAY:SDL_Scancode
Const SDL_SCANCODE_AUDIOMUTE:SDL_Scancode
Const SDL_SCANCODE_MEDIASELECT:SDL_Scancode
Const SDL_SCANCODE_WWW:SDL_Scancode
Const SDL_SCANCODE_MAIL:SDL_Scancode
Const SDL_SCANCODE_CALCULATOR:SDL_Scancode
Const SDL_SCANCODE_COMPUTER:SDL_Scancode
Const SDL_SCANCODE_AC_SEARCH:SDL_Scancode
Const SDL_SCANCODE_AC_HOME:SDL_Scancode
Const SDL_SCANCODE_AC_BACK:SDL_Scancode
Const SDL_SCANCODE_AC_FORWARD:SDL_Scancode
Const SDL_SCANCODE_AC_STOP:SDL_Scancode
Const SDL_SCANCODE_AC_REFRESH:SDL_Scancode
Const SDL_SCANCODE_AC_BOOKMARKS:SDL_Scancode
Const SDL_SCANCODE_BRIGHTNESSDOWN:SDL_Scancode
Const SDL_SCANCODE_BRIGHTNESSUP:SDL_Scancode
Const SDL_SCANCODE_DISPLAYSWITCH:SDL_Scancode
Const SDL_SCANCODE_KBDILLUMTOGGLE:SDL_Scancode
Const SDL_SCANCODE_KBDILLUMDOWN:SDL_Scancode
Const SDL_SCANCODE_KBDILLUMUP:SDL_Scancode
Const SDL_SCANCODE_EJECT:SDL_Scancode
Const SDL_SCANCODE_SLEEP:SDL_Scancode
Const SDL_SCANCODE_APP1:SDL_Scancode
Const SDL_SCANCODE_APP2:SDL_Scancode
Const SDL_NUM_SCANCODES:SDL_Scancode

'FILE="sdl2/sdl_keyboard.h"

Struct SDL_Keysym
	Field scancode:SDL_Scancode
	Field sym:SDL_Keycode
	Field mod_:Short="mod"
	Field unused:Int
End
Function SDL_GetKeyboardFocus:SDL_Window Ptr()

Function SDL_GetKeyboardState:UByte Ptr(numkeys_:Int Ptr)="(bbUByte*)SDL_GetKeyboardState"

Function SDL_GetModState:SDL_Keymod()
Function SDL_SetModState:Void(modstate_:SDL_Keymod)
Function SDL_GetKeyFromScancode:SDL_Keycode(scancode_:SDL_Scancode)
Function SDL_GetScancodeFromKey:SDL_Scancode(key_:SDL_Keycode)
Function SDL_GetScancodeName:char_t Ptr(scancode_:SDL_Scancode)
Function SDL_GetScancodeFromName:SDL_Scancode(name_:CString)
Function SDL_GetKeyName:char_t Ptr(key_:SDL_Keycode)
Function SDL_GetKeyFromName:SDL_Keycode(name_:CString)
Function SDL_StartTextInput:Void()
Function SDL_IsTextInputActive:SDL_bool()
Function SDL_StopTextInput:Void()
Function SDL_SetTextInputRect:Void(rect_:SDL_Rect Ptr)
Function SDL_HasScreenKeyboardSupport:SDL_bool()
Function SDL_IsScreenKeyboardShown:SDL_bool(window_:SDL_Window Ptr)

'FILE="sdl2/sdl_events.h"

Const SDL_RELEASED:Int
Const SDL_PRESSED:Int
Enum SDL_EventType
End
Const SDL_FIRSTEVENT:SDL_EventType
Const SDL_QUIT:SDL_EventType
Const SDL_APP_TERMINATING:SDL_EventType
Const SDL_APP_LOWMEMORY:SDL_EventType
Const SDL_APP_WILLENTERBACKGROUND:SDL_EventType
Const SDL_APP_DIDENTERBACKGROUND:SDL_EventType
Const SDL_APP_WILLENTERFOREGROUND:SDL_EventType
Const SDL_APP_DIDENTERFOREGROUND:SDL_EventType
Const SDL_WINDOWEVENT:SDL_EventType
Const SDL_SYSWMEVENT:SDL_EventType
Const SDL_KEYDOWN:SDL_EventType
Const SDL_KEYUP:SDL_EventType
Const SDL_TEXTEDITING:SDL_EventType
Const SDL_TEXTINPUT:SDL_EventType
Const SDL_MOUSEMOTION:SDL_EventType
Const SDL_MOUSEBUTTONDOWN:SDL_EventType
Const SDL_MOUSEBUTTONUP:SDL_EventType
Const SDL_MOUSEWHEEL:SDL_EventType
Const SDL_JOYAXISMOTION:SDL_EventType
Const SDL_JOYBALLMOTION:SDL_EventType
Const SDL_JOYHATMOTION:SDL_EventType
Const SDL_JOYBUTTONDOWN:SDL_EventType
Const SDL_JOYBUTTONUP:SDL_EventType
Const SDL_JOYDEVICEADDED:SDL_EventType
Const SDL_JOYDEVICEREMOVED:SDL_EventType
Const SDL_CONTROLLERAXISMOTION:SDL_EventType
Const SDL_CONTROLLERBUTTONDOWN:SDL_EventType
Const SDL_CONTROLLERBUTTONUP:SDL_EventType
Const SDL_CONTROLLERDEVICEADDED:SDL_EventType
Const SDL_CONTROLLERDEVICEREMOVED:SDL_EventType
Const SDL_CONTROLLERDEVICEREMAPPED:SDL_EventType
Const SDL_FINGERDOWN:SDL_EventType
Const SDL_FINGERUP:SDL_EventType
Const SDL_FINGERMOTION:SDL_EventType
Const SDL_DOLLARGESTURE:SDL_EventType
Const SDL_DOLLARRECORD:SDL_EventType
Const SDL_MULTIGESTURE:SDL_EventType
Const SDL_CLIPBOARDUPDATE:SDL_EventType
Const SDL_DROPFILE:SDL_EventType
Const SDL_AUDIODEVICEADDED:SDL_EventType
Const SDL_AUDIODEVICEREMOVED:SDL_EventType
Const SDL_RENDER_TARGETS_RESET:SDL_EventType
Const SDL_RENDER_DEVICE_RESET:SDL_EventType
Const SDL_USEREVENT:SDL_EventType
Const SDL_LASTEVENT:SDL_EventType
Struct SDL_CommonEvent
	Field type:Int
	Field timestamp:Int
End
Struct SDL_WindowEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field event:Byte
	Field padding1:Byte
	Field padding2:Byte
	Field padding3:Byte
	Field data1:Int
	Field data2:Int
End
Struct SDL_KeyboardEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field state:Byte
	Field repeat_:Byte="repeat"
	Field padding2:Byte
	Field padding3:Byte
	Field keysym:SDL_Keysym
End
Const SDL_TEXTEDITINGEVENT_TEXT_SIZE:Int
Struct SDL_TextEditingEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field text:UByte Ptr
	Field start:Int
	Field length:Int
End
Const SDL_TEXTINPUTEVENT_TEXT_SIZE:Int
Struct SDL_TextInputEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field text:UByte Ptr
End
Struct SDL_MouseMotionEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field which:Int
	Field state:Int
	Field x:Int
	Field y:Int
	Field xrel:Int
	Field yrel:Int
End
Struct SDL_MouseButtonEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field which:Int
	Field button:Byte
	Field state:Byte
	Field clicks:Byte
	Field padding1:Byte
	Field x:Int
	Field y:Int
End
Struct SDL_MouseWheelEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field which:Int
	Field x:Int
	Field y:Int
	Field direction:Int
End
Struct SDL_JoyAxisEvent
	Field type:Int
	Field timestamp:Int
	Field which:SDL_JoystickID
	Field axis:Byte
	Field padding1:Byte
	Field padding2:Byte
	Field padding3:Byte
	Field value:Short
	Field padding4:Short
End
Struct SDL_JoyBallEvent
	Field type:Int
	Field timestamp:Int
	Field which:SDL_JoystickID
	Field ball:Byte
	Field padding1:Byte
	Field padding2:Byte
	Field padding3:Byte
	Field xrel:Short
	Field yrel:Short
End
Struct SDL_JoyHatEvent
	Field type:Int
	Field timestamp:Int
	Field which:SDL_JoystickID
	Field hat:Byte
	Field value:Byte
	Field padding1:Byte
	Field padding2:Byte
End
Struct SDL_JoyButtonEvent
	Field type:Int
	Field timestamp:Int
	Field which:SDL_JoystickID
	Field button:Byte
	Field state:Byte
	Field padding1:Byte
	Field padding2:Byte
End
Struct SDL_JoyDeviceEvent
	Field type:Int
	Field timestamp:Int
	Field which:Int
End
Struct SDL_ControllerAxisEvent
	Field type:Int
	Field timestamp:Int
	Field which:SDL_JoystickID
	Field axis:Byte
	Field padding1:Byte
	Field padding2:Byte
	Field padding3:Byte
	Field value:Short
	Field padding4:Short
End
Struct SDL_ControllerButtonEvent
	Field type:Int
	Field timestamp:Int
	Field which:SDL_JoystickID
	Field button:Byte
	Field state:Byte
	Field padding1:Byte
	Field padding2:Byte
End
Struct SDL_ControllerDeviceEvent
	Field type:Int
	Field timestamp:Int
	Field which:Int
End
Struct SDL_AudioDeviceEvent
	Field type:Int
	Field timestamp:Int
	Field which:Int
	Field iscapture:Byte
	Field padding1:Byte
	Field padding2:Byte
	Field padding3:Byte
End
Struct SDL_TouchFingerEvent
	Field type:Int
	Field timestamp:Int
	Field touchId:SDL_TouchID
	Field fingerId:SDL_FingerID
	Field x:Float
	Field y:Float
	Field dx:Float
	Field dy:Float
	Field pressure:Float
End
Struct SDL_MultiGestureEvent
	Field type:Int
	Field timestamp:Int
	Field touchId:SDL_TouchID
	Field dTheta:Float
	Field dDist:Float
	Field x:Float
	Field y:Float
	Field numFingers:Short
	Field padding:Short
End
Struct SDL_DollarGestureEvent
	Field type:Int
	Field timestamp:Int
	Field touchId:SDL_TouchID
'	Field gestureId:SDL_GestureID
	Field numFingers:Int
	Field error:Float
	Field x:Float
	Field y:Float
End
Struct SDL_DropEvent
	Field type:Int
	Field timestamp:Int
	Field file:Byte Ptr
End
Struct SDL_QuitEvent
	Field type:Int
	Field timestamp:Int
End
Struct SDL_OSEvent
	Field type:Int
	Field timestamp:Int
End
Struct SDL_UserEvent
	Field type:Int
	Field timestamp:Int
	Field windowID:Int
	Field code:Int
	Field data1:Void Ptr
	Field data2:Void Ptr
End
Struct SDL_SysWMmsg
End
Struct SDL_SysWMEvent
	Field type:Int
	Field timestamp:Int
	Field msg:SDL_SysWMmsg Ptr
End
Struct SDL_Event
	Field type:Int
	Field common:SDL_CommonEvent
	Field window:SDL_WindowEvent
	Field key:SDL_KeyboardEvent
	Field edit:SDL_TextEditingEvent
	Field text:SDL_TextInputEvent
	Field motion:SDL_MouseMotionEvent
	Field button:SDL_MouseButtonEvent
	Field wheel:SDL_MouseWheelEvent
	Field jaxis:SDL_JoyAxisEvent
	Field jball:SDL_JoyBallEvent
	Field jhat:SDL_JoyHatEvent
	Field jbutton:SDL_JoyButtonEvent
	Field jdevice:SDL_JoyDeviceEvent
	Field caxis:SDL_ControllerAxisEvent
	Field cbutton:SDL_ControllerButtonEvent
	Field cdevice:SDL_ControllerDeviceEvent
	Field adevice:SDL_AudioDeviceEvent
	Field quit:SDL_QuitEvent
	Field user:SDL_UserEvent
	Field syswm:SDL_SysWMEvent
	Field tfinger:SDL_TouchFingerEvent
	Field mgesture:SDL_MultiGestureEvent
	Field dgesture:SDL_DollarGestureEvent
	Field drop:SDL_DropEvent
End
Function SDL_PumpEvents:Void()
Enum SDL_eventaction
End
Const SDL_ADDEVENT:SDL_eventaction
Const SDL_PEEKEVENT:SDL_eventaction
Const SDL_GETEVENT:SDL_eventaction
Function SDL_PeepEvents:Int(events_:SDL_Event Ptr,numevents_:Int,action_:SDL_eventaction,minType_:Int,maxType_:Int)
Function SDL_HasEvent:SDL_bool(type_:Int)
Function SDL_HasEvents:SDL_bool(minType_:Int,maxType_:Int)
Function SDL_FlushEvent:Void(type_:Int)
Function SDL_FlushEvents:Void(minType_:Int,maxType_:Int)
Function SDL_PollEvent:Int(event_:SDL_Event Ptr)
Function SDL_WaitEvent:Int(event_:SDL_Event Ptr)
Function SDL_WaitEventTimeout:Int(event_:SDL_Event Ptr,timeout_:Int)
Function SDL_PushEvent:Int(event_:SDL_Event Ptr)
Alias SDL_EventFilter:Int(Void Ptr,SDL_Event Ptr)
Function SDL_SetEventFilter:Void(filter_:SDL_EventFilter,userdata_:Void Ptr)
Function SDL_GetEventFilter:SDL_bool(filter_:SDL_EventFilter Ptr,userdata_:Void Ptr Ptr)
Function SDL_AddEventWatch:Void(filter_:SDL_EventFilter,userdata_:Void Ptr)
Function SDL_DelEventWatch:Void(filter_:SDL_EventFilter,userdata_:Void Ptr)
Function SDL_FilterEvents:Void(filter_:SDL_EventFilter,userdata_:Void Ptr)
Const SDL_QUERY:Int
Const SDL_IGNORE:Int
Const SDL_DISABLE:Int
Const SDL_ENABLE:Int
Function SDL_EventState:Byte(type_:Int,state_:Int)
Const SDL_GetEventState:Int
Function SDL_RegisterEvents:Int(numevents_:Int)

'FILE="sdl2/sdl_audio.h"

Alias SDL_AudioFormat:Short
Const SDL_AUDIO_MASK_BITSIZE:Int
Const SDL_AUDIO_MASK_DATATYPE:Int
Const SDL_AUDIO_MASK_ENDIAN:Int
Const SDL_AUDIO_MASK_SIGNED:Int
Const SDL_AUDIO_BITSIZE:Int
Const SDL_AUDIO_ISFLOAT:Int
Const SDL_AUDIO_ISBIGENDIAN:Int
Const SDL_AUDIO_ISSIGNED:Int
Const SDL_AUDIO_ISINT:Int
Const SDL_AUDIO_ISLITTLEENDIAN:Int
Const SDL_AUDIO_ISUNSIGNED:Int
Const SDL_AUDIO_ALLOW_FREQUENCY_CHANGE:Int
Const SDL_AUDIO_ALLOW_FORMAT_CHANGE:Int
Const SDL_AUDIO_ALLOW_CHANNELS_CHANGE:Int
Const SDL_AUDIO_ALLOW_ANY_CHANGE:Int
Alias SDL_AudioCallback:Void(Void Ptr,UByte Ptr,Int)
Struct SDL_AudioSpec
	Field freq:Int
	Field format:SDL_AudioFormat
	Field channels:Byte
	Field silence:Byte
	Field samples:Short
	Field padding:Short
	Field size:Int
	Field callback:SDL_AudioCallback
	Field userdata:Void Ptr
End
Struct SDL_AudioCVT
	Field needed:Int
	Field src_format:SDL_AudioFormat
	Field dst_format:SDL_AudioFormat
	Field rate_incr:Double
	Field buf:Byte Ptr
	Field len:Int
	Field len_cvt:Int
	Field len_mult:Int
	Field len_ratio:Double
	Field filter_index:Int
End
Alias SDL_AudioFilter:Void(SDL_AudioCVT Ptr,SDL_AudioFormat)
Function SDL_GetNumAudioDrivers:Int()
Function SDL_GetAudioDriver:char_t Ptr(index_:Int)
Function SDL_AudioInit:Int(driver_name_:CString)
Function SDL_AudioQuit:Void()
Function SDL_GetCurrentAudioDriver:char_t Ptr()
Function SDL_OpenAudio:Int(desired_:SDL_AudioSpec Ptr,obtained_:SDL_AudioSpec Ptr)
Alias SDL_AudioDeviceID:Int
Function SDL_GetNumAudioDevices:Int(iscapture_:Int)
Function SDL_GetAudioDeviceName:char_t Ptr(index_:Int,iscapture_:Int)
Function SDL_OpenAudioDevice:SDL_AudioDeviceID(device_:CString,iscapture_:Int,desired_:SDL_AudioSpec Ptr,obtained_:SDL_AudioSpec Ptr,allowed_changes_:Int)
Enum SDL_AudioStatus
End
Const SDL_AUDIO_STOPPED:SDL_AudioStatus
Const SDL_AUDIO_PLAYING:SDL_AudioStatus
Const SDL_AUDIO_PAUSED:SDL_AudioStatus
Function SDL_GetAudioStatus:SDL_AudioStatus()
Function SDL_GetAudioDeviceStatus:SDL_AudioStatus(dev_:SDL_AudioDeviceID)
Function SDL_PauseAudio:Void(pause_on_:Int)
Function SDL_PauseAudioDevice:Void(dev_:SDL_AudioDeviceID,pause_on_:Int)
Function SDL_LoadWAV_RW:SDL_AudioSpec Ptr(src_:SDL_RWops Ptr,freesrc_:Int,spec_:SDL_AudioSpec Ptr,audio_buf_:UByte Ptr Ptr,audio_len_:UInt Ptr)
Const SDL_LoadWAV:Int
Function SDL_FreeWAV:Void(audio_buf_:Byte Ptr)
Function SDL_BuildAudioCVT:Int(cvt_:SDL_AudioCVT Ptr,src_format_:SDL_AudioFormat,src_channels_:Byte,src_rate_:Int,dst_format_:SDL_AudioFormat,dst_channels_:Byte,dst_rate_:Int)
Function SDL_ConvertAudio:Int(cvt_:SDL_AudioCVT Ptr)
Const SDL_MIX_MAXVOLUME:Int
Function SDL_MixAudio:Void(dst_:Byte Ptr,src_:CString,len_:Int,volume_:Int)
Function SDL_MixAudioFormat:Void(dst_:Byte Ptr,src_:CString,format_:SDL_AudioFormat,len_:Int,volume_:Int)
Function SDL_QueueAudio:Int(dev_:SDL_AudioDeviceID,data_:Void Ptr,len_:Int)
Function SDL_GetQueuedAudioSize:Int(dev_:SDL_AudioDeviceID)
Function SDL_ClearQueuedAudio:Void(dev_:SDL_AudioDeviceID)
Function SDL_LockAudio:Void()
Function SDL_LockAudioDevice:Void(dev_:SDL_AudioDeviceID)
Function SDL_UnlockAudio:Void()
Function SDL_UnlockAudioDevice:Void(dev_:SDL_AudioDeviceID)
Function SDL_CloseAudio:Void()
Function SDL_CloseAudioDevice:Void(dev_:SDL_AudioDeviceID)

'FILE="sdl2/SDL_clipboard.h"

Function SDL_SetClipboardText( text:CString )

Function SDL_GetClipboardText:char_t Ptr()

Function SDL_HasClipboardText:SDL_bool()

Function SDL_free( text:Void Ptr )

'FILE="sdl2/SDL_audio.h"

Const AUDIO_U8:Int
Const AUDIO_S8:Int
Const AUDIO_U16LSB:Int
Const AUDIO_S16LSB:Int
Const AUDIO_U16MSB:Int
Const AUDIO_S16MSB:Int
Const AUDIO_U16:Int
Const AUDIO_S16:Int

'FILE="sdl2/SDL_thread.h"

Alias SDL_threadID:UInt

Function SDL_ThreadID:SDL_threadID()

'FILE="sdl2/SDL_fileystem.h"

Function SDL_GetPrefPath:CString( org:CString,app:CString )
	
'FILE="sdl2/SDL_pixels.h"

Function SDL_BYTESPERPIXEL:Int( format:Int )

'${END}
